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
pkgver=4.2.1
pkgrel=2
arch=(any)
url='https://buildbot.net'
# https://github.com/buildbot/buildbot/blob/v3.10.1/master/setup.py says GPLv2, and does not mention "any later version"
license=('GPL-2.0-only')
checkdepends=(python-boto3 python-ldap3 python-lz4 python-txrequests
              python-moto python-docker python-parameterized python-subunit
              python-psutil python-ruamel-yaml python-markdown
              python-brotli python-zstandard python-evalidate
              openssh chromium)
makedepends=(python-build python-installer python-wheel
             python-twisted python-treq python-jinja python-msgpack python-zope-interface python-sqlalchemy
             python-alembic python-dateutil python-txaio
             python-autobahn python-pyjwt python-yaml python-croniter python-unidiff
             python-packaging
             python-graphql-core python-hvac
             libvirt-python python-novaclient python-pypugjs python-aiohttp
             python-setuptools
             python-sphinx-jinja
             python-sphinx_rtd_theme
             git yarn)
source=("git+https://github.com/buildbot/buildbot.git?signed#tag=v$pkgver"
        "disable-flaky-tests.diff"
        "fully-locked-system-accounts.diff")
sha256sums=('687e860d0e78df499e297c3781a49751066127719023cf9538b954dd7889d5ca'
            '175cb41a707a278b0a7c0864304a00459d6e2dee16cd5ddbc28a6dc90abfd3fc'
            'eb88c48ede01ee4d2fcbde83f2141b92387b4fb584e092bfd7374e2ac8929845')
validpgpkeys=(
  'FD0004A26EADFE43A4C3F249C6F7AE200374452D'  # https://github.com/p12tic.gpg
)

# Some WWW modules are not tested by upstream, see https://github.com/buildbot/buildbot/blob/v4.0.3/Makefile#L30
_buildbot_www_modules_with_tests=(base waterfall_view console_view)
_buildbot_www_modules=(${_buildbot_www_modules_with_tests[@]} grid_view wsgi_dashboards badges)

prepare() {
  cd buildbot

  # HACK: do not use virtualenv
  sed -i -e 's#frontend_deps:.*#frontend_deps:#' Makefile

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

  # https://archlinux.org/todo/change-sysusers-to-fully-locked-system-accounts/
  patch -Np1 -i ../fully-locked-system-accounts.diff
}

get_pyver() {
  python -c "import sys; print('{}.{}'.format(*sys.version_info[:2]))"
}

build() {
  export NODE_OPTIONS="--max-old-space-size=2048"

  cd "$srcdir"/buildbot/pkg
  python -m build --wheel --no-isolation
  python -m installer --destdir="$srcdir/tmp_install" dist/*.whl

  #################### buildbot ########################
  cd "$srcdir"/buildbot/master
  python -m build --wheel --no-isolation

  ################## buildbot-worker ###################
  cd "$srcdir"/buildbot/worker
  python -m build --wheel --no-isolation

  ################### buildbot-www #####################
  cd "$srcdir"/buildbot

  # HACK: use system packages instead of ones via pip
  make PIP=/usr/bin/true frontend_deps

  export PYTHONPATH="$srcdir/tmp_install/usr/lib/python$(get_pyver)/site-packages"
  for module in ${_buildbot_www_modules[@]}
  do
    cd "$srcdir"/buildbot/www/$module
    python -m build --wheel --no-isolation
  done

  ################### buildbot-docs ####################
  cd "$srcdir"/buildbot/master/docs
  # Default SPHINXOPTS used in upstream Makefile treats warnings as errors and may break the build when Arch uses newer sphinx
  make SPHINXOPTS="-j$(nproc)" clean html singlehtml
}

check() {
  _basedir="$srcdir/buildbot"

  # Install packages to a temp folder for tests
  for wheel_file in "$_basedir"/master/dist/*.whl "$_basedir"/worker/dist/*.whl "$_basedir"/www/base/dist/*.whl; do
    python -m installer --destdir="$srcdir/tmp_install" "$wheel_file"
  done

  # Run tests
  PYTHONPATH="$srcdir/tmp_install/usr/lib/python$(get_pyver)/site-packages"
  export PATH="$PATH:$srcdir/tmp_install/usr/bin"

  cd "$srcdir"/buildbot/master
  PYTHONPATH="$PWD:$PYTHONPATH" TZ=UTC python -W default /usr/bin/trial --rterrors buildbot

  cd "$srcdir"/buildbot/worker
  PYTHONPATH=. python -W default /usr/bin/trial buildbot_worker

  export CHROME_BIN=/usr/bin/chromium

  for module in ${_buildbot_www_modules_with_tests[@]}
  do
    cd "$srcdir"/buildbot/www/$module
    yarn run test
  done
}

package_buildbot() {
  pkgdesc='The Continuous Integration Framework'
  depends=(buildbot-common=$pkgver-$pkgrel python python-twisted python-treq python-jinja python-msgpack python-zope-interface python-sqlalchemy
           python-alembic python-dateutil python-txaio
           python-autobahn python-pyjwt python-yaml python-croniter python-unidiff python-packaging)
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
    'python-requests: for using HTTP requests as steps'
    'python-txrequests: for using HTTP requests as steps'
    'python-evalidate: for configurable steps'
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
    'python-brotli: for compressing REST API responses'
    'python-zstandard: for compressing REST API responses'

    # misc
    'python-lz4: to compress logs using lz4'
    'python-aiohttp: for dev-proxy'
    'python-markdown: for descriptions in markdown'
  )

  cd buildbot/master
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 contrib/systemd/buildbot@.service \
    -t "$pkgdir"/usr/lib/systemd/system/
}

package_buildbot-worker() {
  pkgdesc='Buildbot worker daemon'
  depends=(buildbot-common=$pkgver-$pkgrel python python-twisted python-autobahn python-msgpack python-zope-interface)
  optdepends=(
    'buildbot: for local worker'
  )

  cd buildbot/worker
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 contrib/systemd/buildbot-worker@.service \
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

  cd buildbot
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
  python -m installer --destdir="$pkgdir" dist/*.whl
}

package_python-buildbot-www-react() {
  pkgdesc='React-based Buildbot UI (experimental)'
  depends=(${pkgname/-react/}=$pkgver-$pkgrel)
}

package_python-buildbot-waterfall-view() {
  pkgdesc='Buildbot Waterfall View plugin'
  depends=(buildbot=$pkgver-$pkgrel python-buildbot-www=$pkgver-$pkgrel)

  cd buildbot/www/waterfall_view
  python -m installer --destdir="$pkgdir" dist/*.whl
}

package_python-buildbot-console-view() {
  pkgdesc='Buildbot Console View plugin'
  depends=(buildbot=$pkgver-$pkgrel python-buildbot-www=$pkgver-$pkgrel)

  cd buildbot/www/console_view
  python -m installer --destdir="$pkgdir" dist/*.whl
}

package_python-buildbot-grid-view() {
  pkgdesc='Buildbot Grid View plugin'
  depends=(buildbot=$pkgver-$pkgrel python-buildbot-www=$pkgver-$pkgrel)

  cd buildbot/www/grid_view
  python -m installer --destdir="$pkgdir" dist/*.whl
}

package_python-buildbot-wsgi-dashboards() {
  pkgdesc='Buildbot plugin to integrate flask or bottle dashboards to buildbot UI'
  depends=(buildbot=$pkgver-$pkgrel python-buildbot-www=$pkgver-$pkgrel python-twisted)

  cd buildbot/www/wsgi_dashboards
  python -m installer --destdir="$pkgdir" dist/*.whl
}

package_python-buildbot-badges() {
  pkgdesc='Buildbot badges'
  depends=(python buildbot=$pkgver-$pkgrel python-buildbot-www=$pkgver-$pkgrel python-klein python-cairosvg python-cairocffi python-jinja python-twisted)
  # https://github.com/buildbot/buildbot/blob/v1.6.0/www/badges/buildbot_badges/__init__.py#L40
  optdepends=(
    'ttf-dejavu: the default font for rendering badges as PNGs'
  )

  cd buildbot/www/badges
  python -m installer --destdir="$pkgdir" dist/*.whl
}

package_python-buildbot-react-waterfall-view() {
pkgdesc='Buildbot Waterfall View plugin (React)'
  depends=(${pkgname/-react/}=$pkgver-$pkgrel)
}

package_python-buildbot-react-console-view() {
pkgdesc='Buildbot Console View plugin (React)'
  depends=(${pkgname/-react/}=$pkgver-$pkgrel)
}

package_python-buildbot-react-grid-view() {
  pkgdesc='Buildbot Grid View plugin (React)'
  depends=(${pkgname/-react/}=$pkgver-$pkgrel)
}

package_python-buildbot-react-wsgi-dashboards() {
  pkgdesc='Buildbot plugin to integrate flask or bottle dashboards to buildbot UI (React)'
  depends=(${pkgname/-react/}=$pkgver-$pkgrel)
}
