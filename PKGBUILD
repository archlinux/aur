# Maintainer: Chih-Hsuan Yen <yan12125@gmail.com>
# Contributor: xRemaLx <anton.komolov@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgbase=buildbot
pkgname=(buildbot buildbot-worker buildbot-docs
         python-buildbot-www python-buildbot-waterfall-view
         python-buildbot-console-view python-buildbot-grid-view
         python-buildbot-wsgi-dashboards python-buildbot-badges)
pkgver=2.7.0
_bb_contrib_commit=ada3c8f30ca7e1b6bb260e2e5971053fbd254333
pkgrel=2
arch=(any)
url='https://buildbot.net'
license=(GPL2)
checkdepends=(python-boto3 python-lz4 python-treq python-txrequests
              python-moto python-parameterized python-mock
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
        "pygments-2.5.diff"
        "sphinx-issue7139.diff"
        "sphinx-3.0.patch"
        "reproducible-html.diff")
sha256sums=('8b0ce7d332c5013517bf3bbcc70638d16c8ded8c099770bfbc8126332ff3016a'
            'SKIP'
            'SKIP'
            'aab7437b4db78fd07971b875db0cdb9af4e4807ae8c0b7d5d4bae5ae03074ec2'
            '44753dd07bef78105528d371a053594fd7a24922e23a2841d67ff44c764224b6'
            '148410975575748984de7ae7d013135899bc522a56b7b678df3ac9bb55321f6f'
            'b921d29994eff3af134ca1b37acf291a6a95f5da35a2a4f885557adcca22f864')
validpgpkeys=(
  '390EB159056ED56F66AB1092AECD456B4D2531FC'  # Pierre Tardy <tardyp@gmail.com> (@tardyp on GitHub)
  'FD0004A26EADFE43A4C3F249C6F7AE200374452D'  # Povilas Kanapickas <povilas@radix.lt> (@p12tic on GitHub)
)

prepare() {
  cd buildbot-$pkgver
  patch -Np1 -i ../pygments-2.5.diff
  patch -Np1 -i ../sphinx-issue7139.diff
  patch -Np1 -i ../sphinx-3.0.patch
  patch -Np1 -i ../reproducible-html.diff

  # HACK: do not use virtualenv
  sed -i -e 's#frontend_deps:.*#frontend_deps:#' Makefile

  # HACK: Do not build JS again during install
  # We take care about the command order manually
  sed -i '/egg_info=EggInfoCommand/d' pkg/buildbot_pkg.py

  sed -i '/buildbot_windows_service/d' master/setup.py
  rm -v master/buildbot/scripts/windows_service.py
  sed -i '/buildbot_worker_windows_service/d' worker/setup.py
  rm -v worker/buildbot_worker/scripts/windows_service.py
}

build() {
  export NODE_OPTIONS="--max-old-space-size=2048"

  cd "$srcdir"/buildbot-$pkgver/pkg
  python setup.py egg_info

  #################### buildbot ####################
  cd "$srcdir"/buildbot-$pkgver/master
  python setup.py build

  #################### buildbot-worker ####################
  cd "$srcdir"/buildbot-$pkgver/worker
  python setup.py build

  #################### buildbot-www ####################
  cd "$srcdir"/buildbot-$pkgver

  # HACK: use system packages instead of ones via pip
  make PIP=/usr/bin/true frontend_deps

  export PYTHONPATH="$srcdir"/buildbot-$pkgver/pkg
  for module in base waterfall_view console_view grid_view wsgi_dashboards badges
  do
    cd "$srcdir"/buildbot-$pkgver/www/$module
    python setup.py build
  done

  #################### buildbot-docs ####################
  cd "$srcdir/buildbot-$pkgver"
  make docs
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

package_buildbot() {
  pkgdesc='The Continuous Integration Framework'
  depends=(python-twisted python-jinja python-zope-interface
           python-sqlalchemy-migrate python-dateutil python-txaio
           python-autobahn python-pyjwt python-yaml)
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
    'python-txrequests: for using HTTP requests as steps'
    # workers
    'buildbot-worker: for local worker'
    'libvirt-python: for libvirt worker'
    'python-boto3: for AWS EC2 latent worker'
    'python-docker: for Docker latent worker'
    'python-novaclient: for OpenStack latent worker'
    # www
    'python-ldap3: to authenticate users via LDAP'

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
  depends=(python-setuptools python-twisted python-future)

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
