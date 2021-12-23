# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>
# Contributor: Sebastiaan Lokhorst <sebastiaanlokhorst@gmail.com>
# Contributor: Tommy Li <ttoo74@gmail.com>
# Contributor: Mark Lee <mark at markelee dot com>

pkgname=jupyterhub
pkgver=2.0.1
pkgrel=1
pkgdesc="Multi-user server for Jupyter notebooks"
url="https://jupyter.org/hub"
arch=(any)
license=('BSD')
depends=(
  'ipython' 'nodejs-configurable-http-proxy' 'python-alembic'
  'python-async_generator' 'python-certipy' 'python-entrypoints' 'python-jinja'
  'python-jsonschema' 'python-jupyter_telemetry' 'python-oauthlib'
  'python-packaging' 'python-pamela' 'python-prometheus_client' 'python-requests'
  'python-sqlalchemy' 'python-tornado' 'python-traitlets'
)
makedepends=(
  'npm' 'python-setuptools'
)
checkdepends=(
  'jupyter-notebook' 'python-beautifulsoup4' 'python-pytest'
  'python-pytest-asyncio' 'python-requests-mock'
)
optdepends=(
  'jupyter-notebook: standard notebook server'
  'jupyterlab: to use the JupyterLab interface'
  'python-pycurl: improved HTTP performance'
)
install=jupyterhub.install
backup=(
  'etc/jupyterhub/jupyterhub_config.py'
)
source=(
  "jupyterhub-${pkgver}.tar.gz::https://github.com/jupyterhub/jupyterhub/archive/${pkgver}.tar.gz"
  'jupyterhub.service'
  'tests_use_random_ports.patch'
)
sha256sums=(
  '42eb7f2cf06d08a9df6c31ec3ab58a865081b478b5a15cf49557afc04bc93f18'
  'adb4c09c668c35605d9cddc4a4171dd64ed6e74ab82da97f19b3437d26b052b9'
  'acba51024276670aabad3d3f2a1c80d4b573809ca7e7ef6594916329d842417f'
)

prepare() {
  cd "${srcdir}/jupyterhub-$pkgver"
  patch -p0 -i "${srcdir}/tests_use_random_ports.patch"
}

build() {
  cd "${srcdir}/jupyterhub-$pkgver"
  python setup.py build

  # Generate the default configuration. The value of data_files_path is set
  # based on the directory containing the loaded code, so we need to replace
  # it with the final installed destination.
  cd build/lib
  python -m jupyterhub --generate-config -f "$srcdir/default_config.py" -y=true
  _srcdir_esc="${srcdir////\\/}"
  sed -i -e "s/${_srcdir_esc}\/jupyterhub-$pkgver/\/usr/" "$srcdir/default_config.py"
}

check() {
  cd "${srcdir}/jupyterhub-$pkgver"

  # Run the tests we can. The DB upgrade tests always fail for me (it looks
  # like the virtual environment they set up is not complete). The internal SSL
  # connections test are broken by our patch to use random ports for testing.
  # This enables a lot more tests than it breaks so it is a worthwhile
  # trade-off for now. The test_server_token_role test needs the package
  # installed so it can find the jupyterhub-singleuser script. The other
  # specific skipped tests intermittently fail. We'll have to trust the
  # upstream CI on those.
  PYTHONPATH="$PWD/build/lib" pytest -v jupyterhub \
    --ignore=jupyterhub/tests/test_db.py \
    --ignore=jupyterhub/tests/test_internal_ssl_connections.py \
    -k "not test_server_token_role and not test_external_service and not test_single_user_spawner"
}

package() {
  cd "${srcdir}/jupyterhub-$pkgver"
  install -Dm644 COPYING.md "${pkgdir}"/usr/share/licenses/$pkgname/COPYING.md

  # Something in the test suite writes byte code with $srcdir references, even
  # if we set PYTHONDONTWRITEBYTECODE=1. Just remove the caches. This also
  # covers anything written when generating the default config.
  find . -name "*.pyc" -delete
  find . -type d -name __pycache__ -delete

  # Install the package.
  python setup.py install --root="${pkgdir}" --prefix=/usr --skip-build --optimize=1

  # Remove $srcdir references from (1) npm metadata and (2) Python egg metadata.
  find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'
  _srcdir_esc="${srcdir////\\/}"
  find "$pkgdir" -name SOURCES.txt -exec sed -i "/${_srcdir_esc}/d" {} \;

  # systemd service and default configuration.
  install -Dm644 "$srcdir/jupyterhub.service" "$pkgdir/usr/lib/systemd/system/jupyterhub.service"
  install -Dm644 "$srcdir/default_config.py" "$pkgdir/etc/jupyterhub/jupyterhub_config.py"
}
