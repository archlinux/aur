# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: xRemaLx <anton.komolov@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgbase=buildbot
pkgname=(buildbot buildbot-worker buildbot-docs buildbot-common
         python-buildbot-www python-buildbot-www-react
         python-buildbot-waterfall-view
         python-buildbot-console-view python-buildbot-grid-view
         python-buildbot-wsgi-dashboards python-buildbot-badges
         python-buildbot-react-waterfall-view
         python-buildbot-react-console-view python-buildbot-react-grid-view
         python-buildbot-react-wsgi-dashboards)
# https://github.com/buildbot/buildbot/releases
pkgver=3.11.9
_bb_contrib_commit=cc230791dcd4717830d4dcb62843c0a19bdf3262
pkgrel=1
arch=(any)
url='https://buildbot.net'
# https://github.com/buildbot/buildbot/blob/v3.10.1/master/setup.py says GPLv2, and does not mention "any later version"
license=('GPL-2.0-only')
checkdepends=(python-boto3 python-ldap3 python-lz4 python-treq python-txrequests
              python-moto python-docker python-parameterized python-subunit
              python-psutil python-ruamel-yaml python-markdown
              openssh chromium)
makedepends=(python-twisted python-jinja python-msgpack python-zope-interface python-sqlalchemy1.4
             python-alembic python-dateutil python-txaio
             python-autobahn python-pyjwt python-yaml python-croniter python-unidiff
             python-importlib_resources python-packaging
             python-graphql-core python-hvac
             libvirt-python python-novaclient python-pypugjs python-aiohttp
             python-setuptools python-six
             python-sphinx-jinja
             python-sphinx_rtd_theme
             git yarn)
source=("git+https://github.com/buildbot/buildbot.git?signed#tag=v$pkgver"
        "git+https://github.com/buildbot/buildbot-contrib.git#commit=$_bb_contrib_commit"
        "disable-flaky-tests.diff")
sha256sums=('d8aa460adb20b5c263fb5170da4ac4d7ca23d13f34971f6926db3d6b095ca3ab'
            '2f8747848b96d9e31a66d3becd62d36dcbdd349e5381a8bd2558da7c1f2faddb'
            '175cb41a707a278b0a7c0864304a00459d6e2dee16cd5ddbc28a6dc90abfd3fc')
validpgpkeys=(
  'FD0004A26EADFE43A4C3F249C6F7AE200374452D'  # https://github.com/p12tic.gpg
)

# Some WWW modules are not tested by upstream, see https://github.com/buildbot/buildbot/blob/v3.11.9/Makefile#L27-L29
_buildbot_www_modules_with_tests=(base waterfall_view console_view grid_view wsgi_dashboards)
_buildbot_www_react_modules_with_tests=(react-base react-waterfall_view react-console_view)
_buildbot_www_modules=(${_buildbot_www_modules_with_tests[@]} ${_buildbot_www_react_modules_with_tests[@]} react-grid_view react-wsgi_dashboards badges)

prepare() {
  cd buildbot

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
  # Also, don't hide known warnings, which are useful for checking compatibility with
  # Python dependencies
  sed -r -i "s#['\"](error|ignore)['\"]#'default'#" master/buildbot/test/__init__.py

  # See https://github.com/buildbot/buildbot/issues/6776 for an earlier report about those flaky tests
  patch -Np1 -i ../disable-flaky-tests.diff
}

build() {
  export NODE_OPTIONS="--max-old-space-size=2048 --openssl-legacy-provider"

  cd "$srcdir"/buildbot/pkg
  python setup.py egg_info

  #################### buildbot ########################
  cd "$srcdir"/buildbot/master
  python setup.py build

  ################## buildbot-worker ###################
  cd "$srcdir"/buildbot/worker
  python setup.py build

  ################### buildbot-www #####################
  cd "$srcdir"/buildbot

  # HACK: use system packages instead of ones via pip
  make PIP=/usr/bin/true frontend_deps

  export PYTHONPATH="$srcdir"/buildbot/pkg
  for module in ${_buildbot_www_modules[@]}
  do
    cd "$srcdir"/buildbot/www/$module
    python setup.py build
  done

  ################### buildbot-docs ####################
  cd "$srcdir"/buildbot/master/docs
  # Default SPHINXOPTS used in upstream Makefile treats warnings as errors and may break the build when Arch uses newer sphinx
  make SPHINXOPTS="-j$(nproc)" clean html singlehtml
}

check() {
  # Install packages to a temp folder for tests
  cd "$srcdir"/buildbot/master
  python setup.py egg_info
  python setup.py install_scripts --install-dir="$srcdir/tmp_install"

  cd "$srcdir"/buildbot/worker
  python setup.py egg_info

  cd "$srcdir"/buildbot/www/base
  python setup.py egg_info

  # Run tests
  _basedir="$srcdir/buildbot"
  export PYTHONPATH="$_basedir/master:$_basedir/worker:$_basedir/www/base:$_basedir/pkg"
  export PATH="$PATH:$srcdir/tmp_install"

  cd "$srcdir"/buildbot/master
  TZ=UTC python -W default /usr/bin/trial --rterrors buildbot

  cd "$srcdir"/buildbot/worker
  PYTHONPATH=. python -W default /usr/bin/trial buildbot_worker

  export CHROME_BIN=/usr/bin/chromium

  for module in ${_buildbot_www_modules_with_tests[@]}
  do
    cd "$srcdir"/buildbot/www/$module
    yarn run test --browsers BBChromeHeadless
  done

  for module in ${_buildbot_www_react_modules_with_tests[@]}
  do
    cd "$srcdir"/buildbot/www/$module
    yarn run test
  done
}

package_buildbot() {
  pkgdesc='The Continuous Integration Framework'
  depends=(buildbot-common=$pkgver-$pkgrel python python-twisted python-jinja python-msgpack python-zope-interface python-sqlalchemy1.4
           python-alembic python-dateutil python-txaio
           python-autobahn python-pyjwt python-yaml python-croniter python-unidiff python-importlib_resources python-packaging)
  optdepends=(
    # reporters
    'python-pyopenssl: to use SSL/TLS in mail or IRC notifiers'
    # secrets
    'pass: to use SecretInPass provider'
    'vault: to use HashiCorpVaultSecretProvider or HashiCorpVaultKvSecretProvider provider'
    'python-hvac: to use HashiCorpVaultKvSecretProvider provider'
    # statistics
    # 'python-influxdb: for using InfluxDB to store statistics'  # dead project, upstream github repo archived
    # steps
    'python-subunit: for SubunitShellCommand'
    'python-treq: for using HTTP requests as steps'
    'python-requests: for using HTTP requests as steps'
    'python-txrequests: for using HTTP requests as steps'
    # workers
    'buildbot-worker: for local worker'
    'libvirt-python: for libvirt worker'
    'python-boto3: for AWS EC2 latent worker'
    'python-botocore: for AWS EC2 latent worker'
    'python-docker: for Docker latent worker'
    'python-novaclient: for OpenStack latent worker'
    'python-keystoneauth1: for OpenStack latent worker'
    # www
    'python-graphql-core: GraphQL API for buildbot'
    'python-ldap3: to authenticate users via LDAP'
    'python-pypugjs: to use custom Pug.js templates'

    # misc
    'python-lz4: to compress logs using lz4'
    'python-aiohttp: for dev-proxy'
    'python-markdown: for descriptions in markdown'
  )

  cd buildbot/master
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 "$srcdir"/buildbot-contrib/master/contrib/systemd/buildbot@.service \
    -t "$pkgdir"/usr/lib/systemd/system/
}

package_buildbot-worker() {
  pkgdesc='Buildbot worker daemon'
  depends=(buildbot-common=$pkgver-$pkgrel python python-twisted python-six python-autobahn python-msgpack python-zope-interface)
  optdepends=(
    'buildbot: for local worker'
  )

  cd buildbot/worker
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 "$srcdir"/buildbot-contrib/worker/contrib/systemd/buildbot-worker@.service \
    -t "$pkgdir"/usr/lib/systemd/system/
}

package_buildbot-docs() {
  pkgdesc='Buildbot docs'

  cd buildbot/master/docs
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
  depends=(python buildbot=$pkgver-$pkgrel)
  optdepends=(
    'python-buildbot-waterfall-view'
    'python-buildbot-console-view'
    'python-buildbot-grid-view'
    'python-buildbot-badges'
  )

  cd buildbot/www/base
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

package_python-buildbot-www-react() {
  pkgdesc='React-based Buildbot UI (experimental)'
  depends=(python buildbot=$pkgver-$pkgrel)
  optdepends=(
    'python-buildbot-react-waterfall-view'
    'python-buildbot-react-console-view'
    'python-buildbot-react-grid-view'
  )

  cd buildbot/www/react-base
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

package_python-buildbot-waterfall-view() {
  pkgdesc='Buildbot Waterfall View plugin'
  depends=(buildbot=$pkgver-$pkgrel python-buildbot-www=$pkgver-$pkgrel)

  cd buildbot/www/waterfall_view
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

package_python-buildbot-console-view() {
  pkgdesc='Buildbot Console View plugin'
  depends=(buildbot=$pkgver-$pkgrel python-buildbot-www=$pkgver-$pkgrel)

  cd buildbot/www/console_view
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

package_python-buildbot-grid-view() {
  pkgdesc='Buildbot Grid View plugin'
  depends=(buildbot=$pkgver-$pkgrel python-buildbot-www=$pkgver-$pkgrel)

  cd buildbot/www/grid_view
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

package_python-buildbot-wsgi-dashboards() {
  pkgdesc='Buildbot plugin to integrate flask or bottle dashboards to buildbot UI'
  depends=(buildbot=$pkgver-$pkgrel python-buildbot-www=$pkgver-$pkgrel python-twisted)

  cd buildbot/www/wsgi_dashboards
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

package_python-buildbot-badges() {
  pkgdesc='Buildbot badges'
  depends=(python buildbot=$pkgver-$pkgrel python-buildbot-www=$pkgver-$pkgrel python-klein python-cairosvg python-cairocffi python-jinja python-twisted)
  # https://github.com/buildbot/buildbot/blob/v1.6.0/www/badges/buildbot_badges/__init__.py#L40
  optdepends=(
    'ttf-dejavu: the default font for rendering badges as PNGs'
  )

  cd buildbot/www/badges
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

package_python-buildbot-react-waterfall-view() {
pkgdesc='Buildbot Waterfall View plugin (React)'
  depends=(buildbot=$pkgver-$pkgrel python-buildbot-www-react=$pkgver-$pkgrel)

  cd buildbot/www/react-waterfall_view
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

package_python-buildbot-react-console-view() {
pkgdesc='Buildbot Console View plugin (React)'
  depends=(buildbot=$pkgver-$pkgrel python-buildbot-www-react=$pkgver-$pkgrel)

  cd buildbot/www/react-console_view
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

package_python-buildbot-react-grid-view() {
  pkgdesc='Buildbot Grid View plugin (React)'
  depends=(buildbot=$pkgver-$pkgrel python-buildbot-www-react=$pkgver-$pkgrel)

  cd buildbot/www/react-grid_view
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

package_python-buildbot-react-wsgi-dashboards() {
  pkgdesc='Buildbot plugin to integrate flask or bottle dashboards to buildbot UI (React)'
  depends=(buildbot=$pkgver-$pkgrel python-buildbot-www-react=$pkgver-$pkgrel python-twisted)

  cd buildbot/www/react-wsgi_dashboards
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
