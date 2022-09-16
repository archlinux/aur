# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>
# Contributor: Sebastiaan Lokhorst <sebastiaanlokhorst@gmail.com>
# Contributor: Tommy Li <ttoo74@gmail.com>
# Contributor: Mark Lee <mark at markelee dot com>

pkgname=jupyterhub
pkgver=3.0.0
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
  'npm' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel'
)
checkdepends=(
  'jupyter-notebook' 'python-beautifulsoup4' 'python-pytest'
  'python-pytest-asyncio' 'python-requests-mock'
)
optdepends=(
  'jupyter-notebook: standard notebook server'
  'jupyterlab: to use the JupyterLab interface'
  'python-pycurl: improved HTTP performance'
  'python-statsd: send metrics to a StatsD server'
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
  '3ddcd96ae291b24571f9aa42e6316410379d46068482e35bad7691cb336dcc72'
  'adb4c09c668c35605d9cddc4a4171dd64ed6e74ab82da97f19b3437d26b052b9'
  '05a86fad6eada56e1128f7ebaf038524d6182b6453427bbc27a58331992b7308'
)

prepare() {
  cd "${srcdir}/jupyterhub-$pkgver"
  patch -p0 -i "${srcdir}/tests_use_random_ports.patch"
}

build() {
  cd "${srcdir}/jupyterhub-$pkgver"
  python -m build --wheel --no-isolation

  # Generate the default configuration. The value of data_files_path is set
  # based on the directory containing the loaded code, so we need to replace
  # it with the final installed destination. We also replace the 'Currently
  # installed' headers with 'Included with the jupyterhub package'.
  cd build/lib
  python -m jupyterhub --generate-config -f "$srcdir/default_config.py" -y True
  local _srcdir_esc="${srcdir////\\/}"
  sed -i "$srcdir/default_config.py" \
    -e "s/${_srcdir_esc}\/jupyterhub-$pkgver/\/usr/" \
    -e 's/#  Currently installed:/#  Included with the jupyterhub package:/'
}

check() {
  cd "${srcdir}/jupyterhub-$pkgver"

  local skip_files=(
    # DB upgrade tests always seem to fail (virtual environment appears incorrect).
    'test_db.py'

    # Broken by our patch to use random ports for testing. This enables a lot
    # more tests than it breaks so it is a worthwhile trade-off for now.
    'test_internal_ssl_connections.py'
  )

  local skip_tests=(
    # Needs the package to already be installed.
    'test_server_token_role'

    # Intermittent failures. For now, trust the upstream CI.
    'test_external_service'
    'test_single_user_spawner'
    'test_nbclassic_control_panel'
  )

  # The community package jupyter-nbclassic provides and conflicts with
  # jupyter-notebook. Some tests depend on nbclassic, some on notebook, so
  # selectively skip based on what package is in use.
  if pacman -Qqs jupyter-nbclassic > /dev/null; then
    skip_tests+=('test_singleuser_app_class[notebook.notebookapp.NotebookApp]')
  else
    skip_tests+=('test_singleuser_auth' 'test_disable_user_config')
  fi

  # Start building pytest args with --ignore options for whole files.
  local testargs=()
  for filename in "${skip_files[@]}"; do
    testargs+=("--ignore=jupyterhub/tests/$filename")
  done

  # Add a filter expression with all the tests we want to skip.
  local karg=""
  for testname in "${skip_tests[@]}"; do
    karg="$karg and not $testname"
  done
  testargs+=('-k' "${karg:5}")  # Trim the leading ' and '.

  PYTHONPATH="$PWD/build/lib" pytest -v jupyterhub "${testargs[@]}"
}

package() {
  cd "${srcdir}/jupyterhub-$pkgver"

  # Install the package.
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" COPYING.md

  # Remove $srcdir references from npm metadata.
  find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'

  # systemd service and default configuration.
  install -Dm644 "$srcdir/jupyterhub.service" "$pkgdir/usr/lib/systemd/system/jupyterhub.service"
  install -Dm644 "$srcdir/default_config.py" "$pkgdir/etc/jupyterhub/jupyterhub_config.py"
}
