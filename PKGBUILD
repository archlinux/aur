# Maintainer: Chih-Hsuan Yen <yan12125@gmail.com>
# Contributor: xRemaLx <anton.komolov@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgbase=buildbot
pkgname=(buildbot buildbot-worker buildbot-docs
         python-buildbot-www python-buildbot-waterfall-view
         python-buildbot-console-view python-buildbot-grid-view
         python-buildbot-wsgi-dashboards python-buildbot-badges)
pkgver=2.9.3
_bb_contrib_commit=4c8615db51253f0be4bfd08210a3aaf903a74b4f
pkgrel=1
arch=(any)
url='https://buildbot.net'
license=(GPL2)
checkdepends=(python-boto3 python-lz4 python-treq python-txrequests
              python-moto python-parameterized python-mock python-subunit
              openssh chromium)
makedepends=(python-twisted python-jinja python-zope-interface
             python-sqlalchemy-migrate python-dateutil python-txaio
             python-autobahn python-pyjwt python-yaml
             python-setuptools python-future
             python-sphinx-jinja python-sphinxcontrib-blockdiag
             python-sphinx_rtd_theme
             git yarn)
source=("https://github.com/buildbot/buildbot/releases/download/v$pkgver/buildbot-v$pkgver.gitarchive.tar.gz"{,.asc}
        "git+https://github.com/buildbot/buildbot-contrib.git#commit=$_bb_contrib_commit"
        "subunit-tests.diff")
sha256sums=('184255af362855cdcd001c82c3a9e49d1071e24aebb4e9ffb4da5e2f52365e09'
            'SKIP'
            'SKIP'
            'cd66bf65e45fa0a5916a6e0201dcebc4db001e4f47da856afbffc58a04356d55')
validpgpkeys=(
  '390EB159056ED56F66AB1092AECD456B4D2531FC'  # Pierre Tardy <tardyp@gmail.com> (@tardyp on GitHub)
  'FD0004A26EADFE43A4C3F249C6F7AE200374452D'  # Povilas Kanapickas <povilas@radix.lt> (@p12tic on GitHub)
)

prepare() {
  cd buildbot-$pkgver

  # Some master tests use scripts from contrib
  ln -s ../../buildbot-contrib/master/contrib master/contrib

  # HACK: do not use virtualenv
  sed -i -e 's#frontend_deps:.*#frontend_deps:#' Makefile

  # HACK: Do not build JS again during install
  # We take care about the command order manually
  sed -i '/egg_info=EggInfoCommand/d' pkg/buildbot_pkg.py

  sed -i '/buildbot_windows_service/d' master/setup.py
  rm -v master/buildbot/scripts/windows_service.py
  sed -i '/buildbot_worker_windows_service/d' worker/setup.py
  rm -v worker/buildbot_worker/scripts/windows_service.py

  # Subunit logs are from testtools. Arch Linux's testtools is patched to use
  # traceback instead of traceback2, and causing a difference. See
  # https://github.com/testing-cabal/testtools/pull/299 for more defailts.
  patch -Np1 -i ../subunit-tests.diff
}

build() {
  export NODE_OPTIONS="--max-old-space-size=2048"

  cd "$srcdir"/buildbot-$pkgver/pkg
  python setup.py egg_info

  #################### buildbot ########################
  cd "$srcdir"/buildbot-$pkgver/master
  python setup.py build

  ################## buildbot-worker ###################
  cd "$srcdir"/buildbot-$pkgver/worker
  python setup.py build

  ################### buildbot-www #####################
  cd "$srcdir"/buildbot-$pkgver

  # HACK: use system packages instead of ones via pip
  make PIP=/usr/bin/true frontend_deps

  export PYTHONPATH="$srcdir"/buildbot-$pkgver/pkg
  for module in base waterfall_view console_view grid_view wsgi_dashboards badges
  do
    cd "$srcdir"/buildbot-$pkgver/www/$module
    python setup.py build
  done

  ################### buildbot-docs ####################
  cd "$srcdir"/buildbot-$pkgver/master/docs
  make clean html singlehtml
}

check() {
  # Install packages to a temp folder for tests
  cd "$srcdir"/buildbot-$pkgver/master
  python setup.py egg_info
  python setup.py install_scripts --install-dir="$srcdir/tmp_install"

  cd "$srcdir"/buildbot-$pkgver/worker
  python setup.py egg_info

  cd "$srcdir"/buildbot-$pkgver/www/base
  python setup.py egg_info

  # Run tests
  _basedir="$srcdir/buildbot-$pkgver"
  export PYTHONPATH="$_basedir/master:$_basedir/worker:$_basedir/www/base:$_basedir/pkg"
  export PATH="$PATH:$srcdir/tmp_install"

  cd "$srcdir"/buildbot-$pkgver/master
  TZ=UTC trial3 --rterrors buildbot

  cd "$srcdir"/buildbot-$pkgver/worker
  PYTHONPATH=. trial3 buildbot_worker

  for module in base waterfall_view console_view grid_view wsgi_dashboards
  do
    cd "$srcdir"/buildbot-$pkgver/www/$module
    CHROME_BIN=/usr/bin/chromium yarn run test --browsers BBChromeHeadless
  done
}

# use PYTHONHASHSEED=0 to work around https://bugs.python.org/issue34033 and https://bugs.python.org/issue34722
export PYTHONHASHSEED=0

package_buildbot() {
  pkgdesc='The Continuous Integration Framework'
  # include setuptools as plugins are enumerated via pkg_resources
  depends=(python-twisted python-jinja python-zope-interface
           python-sqlalchemy-migrate python-dateutil python-txaio
           python-autobahn python-pyjwt python-yaml python-setuptools)
  optdepends=(
    # reporters
    'python-pyopenssl: to use SSL/TLS in mail or IRC notifiers'
    # secrets
    'pass: to use SecretInPass provider'
    'vault: to use HashiCorpVaultSecretProvider provider'
    # statistics
    'python-influxdb: for using InfluxDB to store statistics'
    # steps
    'python-subunit: for SubunitShellCommand'
    'python-treq: for using HTTP requests as steps'
    'python-requests: for using HTTP requests as steps'
    'python-txrequests: for using HTTP requests as steps'
    # workers
    'buildbot-worker: for local worker'
    'libvirt-python: for libvirt worker'
    'python-boto3: for AWS EC2 latent worker'
    'python-docker: for Docker latent worker'
    'python-novaclient: for OpenStack latent worker'
    # www
    'python-ldap3: to authenticate users via LDAP'
    'python-pypugjs: to use custom Pug.js templates'

    # misc
    'python-lz4: to compress logs using lz4'
  )

  cd buildbot-$pkgver/master
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 "$srcdir"/buildbot-contrib/master/contrib/systemd/buildbot@.service \
    -t "$pkgdir"/usr/lib/systemd/system/
}

package_buildbot-worker() {
  pkgdesc='Buildbot worker daemon'
  depends=(python-twisted python-future)

  cd buildbot-$pkgver/worker
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 "$srcdir"/buildbot-contrib/worker/contrib/systemd/buildbot-worker@.service \
    -t "$pkgdir"/usr/lib/systemd/system/
}

package_buildbot-docs() {
  pkgdesc='Buildbot docs'

  cd buildbot-$pkgver/master/docs
  install -Ddm755 "$pkgdir"/usr/share/doc/buildbot
  for kind in html singlehtml ; do
    cp -dr --no-preserve=ownership _build/$kind "$pkgdir"/usr/share/doc/buildbot/$kind
  done
}

package_python-buildbot-www() {
  pkgdesc='Buildbot UI'
  depends=(python buildbot)
  optdepends=(
    'python-buildbot-waterfall-view'
    'python-buildbot-console-view'
    'python-buildbot-grid-view'
    'python-buildbot-badges'
  )

  cd buildbot-$pkgver/www/base
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

package_python-buildbot-waterfall-view() {
  pkgdesc='Buildbot Waterfall View plugin'
  depends=(python-buildbot-www)

  cd buildbot-$pkgver/www/waterfall_view
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

package_python-buildbot-console-view() {
  pkgdesc='Buildbot Console View plugin'
  depends=(python-buildbot-www)

  cd buildbot-$pkgver/www/console_view
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

package_python-buildbot-grid-view() {
  pkgdesc='Buildbot Grid View plugin'
  depends=(python-buildbot-www)

  cd buildbot-$pkgver/www/grid_view
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

package_python-buildbot-wsgi-dashboards() {
  pkgdesc='Buildbot plugin to integrate flask or bottle dashboards to buildbot UI'
  depends=(python-buildbot-www)

  cd buildbot-$pkgver/www/wsgi_dashboards
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

package_python-buildbot-badges() {
  pkgdesc='Buildbot badges'
  depends=(python-buildbot-www python-klein python-cairosvg python-cairocffi python-jinja)
  # https://github.com/buildbot/buildbot/blob/v1.6.0/www/badges/buildbot_badges/__init__.py#L40
  optdepends=(
    'ttf-dejavu: the default font for rendering badges as PNGs'
  )

  cd buildbot-$pkgver/www/badges
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
