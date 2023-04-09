# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: xRemaLx <anton.komolov@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgbase=buildbot
pkgname=(buildbot buildbot-worker buildbot-docs buildbot-common
         python-buildbot-www python-buildbot-www-react
         python-buildbot-waterfall-view
         python-buildbot-console-view python-buildbot-grid-view
         python-buildbot-wsgi-dashboards python-buildbot-badges)
# https://github.com/buildbot/buildbot/releases
pkgver=3.7.0
_bb_contrib_commit=4c8615db51253f0be4bfd08210a3aaf903a74b4f
pkgrel=2
arch=(any)
url='https://buildbot.net'
license=(GPL2)
checkdepends=(python-boto3 python-ldap3 python-lz4 python-treq python-txrequests
              python-moto python-docker python-parameterized python-mock python-subunit
              python-unidiff python-psutil python-ruamel-yaml
              openssh chromium)
makedepends=(python-twisted python-jinja python-msgpack python-zope-interface python-sqlalchemy
             python-alembic python-dateutil python-txaio
             python-autobahn python-pyjwt python-yaml
             python-graphql-core python-hvac
             python-influxdb libvirt-python python-novaclient python-pypugjs python-aiohttp
             python-setuptools python-future
             python-sphinx-jinja
             python-sphinx_rtd_theme
             git yarn)
source=("https://github.com/buildbot/buildbot/releases/download/v$pkgver/buildbot-v$pkgver.gitarchive.tar.gz"{,.asc}
        "git+https://github.com/buildbot/buildbot-contrib.git#commit=$_bb_contrib_commit"
        "buildbot-contrib-systemd-common.patch::https://github.com/buildbot/buildbot-contrib/pull/22.patch"
        "05f8bfb2af5f77de2c512254d306bff983fec242.patch"
        "buildbot-py311.patch::https://github.com/buildbot/buildbot/pull/6813.patch")
sha256sums=('8d8b519dd60374bc327f2f829cdffdaaca415d65c7a89abd9a89435e7b7f81b9'
            'SKIP'
            'SKIP'
            '896eede4c33a8574d7c29ac4a28cebbe3d7e850931a86e945328f8ea358195a9'
            '23255ee665043109d3b267d1846e2ae73ff54bf2e7155e99996280a9e918ce69'
            '8665c30408aac249271dc57e65a38e8441e2e75061523b381ea9233a1d2fd200')
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

  # Don't treat warnings as errors. Arch often ships newer Python libraries than ones
  # in upstream CI and introduces extra deprecation warnings
  sed -r -i "s#warnings\\.filterwarnings\\('error'\\)##" master/buildbot/test/__init__.py

  # www/react: Fix websocket connections on https
  # Part of https://github.com/buildbot/buildbot/pull/6753 (merged to git master)
  patch -Np1 -i ../05f8bfb2af5f77de2c512254d306bff983fec242.patch

  # Fixes for Python 3.11
  # https://github.com/buildbot/buildbot/pull/6813 (merged to git master)
  patch -Np1 -i ../buildbot-py311.patch

  cd "$srcdir"/buildbot-contrib
  patch -Np1 -i ../buildbot-contrib-systemd-common.patch
}

build() {
  export NODE_OPTIONS="--max-old-space-size=2048 --openssl-legacy-provider"

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
  for module in base react-base waterfall_view console_view grid_view wsgi_dashboards badges
  do
    cd "$srcdir"/buildbot-$pkgver/www/$module
    python setup.py build
  done

  ################### buildbot-docs ####################
  cd "$srcdir"/buildbot-$pkgver/master/docs
  # Default SPHINXOPTS used in upstream Makefile treats warnings as errors and may break the build when Arch uses newer sphinx
  make SPHINXOPTS="-j$(nproc)" clean html singlehtml
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
  TZ=UTC trial --rterrors buildbot

  cd "$srcdir"/buildbot-$pkgver/worker
  PYTHONPATH=. trial buildbot_worker

  for module in base waterfall_view console_view grid_view wsgi_dashboards
  do
    cd "$srcdir"/buildbot-$pkgver/www/$module
    CHROME_BIN=/usr/bin/chromium yarn run test --browsers BBChromeHeadless
  done
}

package_buildbot() {
  pkgdesc='The Continuous Integration Framework'
  # include setuptools as plugins are enumerated via pkg_resources
  depends=(buildbot-common python-twisted python-jinja python-msgpack python-zope-interface python-sqlalchemy
           python-alembic python-dateutil python-txaio
           python-autobahn python-pyjwt python-yaml python-setuptools)
  optdepends=(
    # reporters
    'python-pyopenssl: to use SSL/TLS in mail or IRC notifiers'
    # secrets
    'pass: to use SecretInPass provider'
    'vault: to use HashiCorpVaultSecretProvider or HashiCorpVaultKvSecretProvider provider'
    'python-hvac: to use HashiCorpVaultKvSecretProvider provider'
    # statistics
    'python-influxdb: for using InfluxDB to store statistics'
    # steps
    'python-subunit: for SubunitShellCommand'
    'python-treq: for using HTTP requests as steps'
    'python-requests: for using HTTP requests as steps'
    'python-txrequests: for using HTTP requests as steps'
    'python-unidiff: for GitDiffInfo'
    # workers
    'buildbot-worker: for local worker'
    'libvirt-python: for libvirt worker'
    'python-boto3: for AWS EC2 latent worker'
    'python-docker: for Docker latent worker'
    'python-novaclient: for OpenStack latent worker'
    # www
    'python-graphql-core: GraphQL API for buildbot'
    'python-ldap3: to authenticate users via LDAP'
    'python-pypugjs: to use custom Pug.js templates'

    # misc
    'python-lz4: to compress logs using lz4'
    'python-aiohttp: for dev-proxy'
  )

  cd buildbot-$pkgver/master
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 "$srcdir"/buildbot-contrib/master/contrib/systemd/buildbot@.service \
    -t "$pkgdir"/usr/lib/systemd/system/
}

package_buildbot-worker() {
  pkgdesc='Buildbot worker daemon'
  depends=(buildbot-common python-twisted python-future python-autobahn python-msgpack)

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

package_buildbot-common() {
  pkgdesc='Contributed scripts for Buildbot'

  cd buildbot-contrib
  install -Dm644 common/contrib/systemd/sysusers.d/buildbot.conf -t "$pkgdir"/usr/lib/sysusers.d/
  install -Dm644 common/contrib/systemd/tmpfiles.d/buildbot.conf -t "$pkgdir"/usr/lib/tmpfiles.d/
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

package_python-buildbot-www-react() {
  pkgdesc='React-based Buildbot UI (experimental)'
  depends=(python buildbot)
  # buildbot-www-react does not support plugins yet
  optdepends=()

  cd buildbot-$pkgver/www/react-base
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
