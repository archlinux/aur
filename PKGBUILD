# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>
# Contributor: Sebastiaan Lokhorst <sebastiaanlokhorst@gmail.com>
# Contributor: Tommy Li <ttoo74@gmail.com>
# Contributor: Mark Lee <mark at markelee dot com>

pkgname=jupyterhub
pkgver=5.4.3
pkgrel=1
pkgdesc="Multi-user server for Jupyter notebooks"
url="https://jupyter.org/hub"
arch=(any)
license=('BSD-3-Clause')
depends=(
  'ipython'
  'nodejs-configurable-http-proxy'
  'python-alembic'
  'python-certipy'
  'python-dateutil'
  'python-jinja'
  'python-jupyter-events'
  'python-oauthlib'
  'python-packaging'
  'python-pamela'
  'python-prometheus_client'
  'python-psutil'
  'python-pydantic'
  'python-requests'
  'python-sqlalchemy'
  'python-tornado'
  'python-traitlets'
)
makedepends=(
  'git'
  'npm'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-setuptools-scm'
  'python-wheel'
  'yarn'
)
checkdepends=(
  'jupyter-notebook'
  'python-beautifulsoup4'
  'python-cryptography'
  'python-jsonschema'
  'python-pytest'
  'python-pytest-asyncio'
  'python-pytest-rerunfailures'
  'python-requests-mock'
  'python-playwright'
)
optdepends=(
  'jupyter-notebook: standard notebook server'
  'jupyterlab: to use the JupyterLab interface'
  'python-cryptography: encrypt authentication state'
  'python-pycurl: improved HTTP performance'
  'python-statsd: send metrics to a StatsD server'
)
install=jupyterhub.install
backup=(
  'etc/jupyterhub/jupyterhub_config.py'
)

source=(
  "git+https://github.com/jupyterhub/jupyterhub.git#tag=$pkgver"
  'jupyterhub.service'
  'tests_use_random_ports.patch'
)
sha256sums=(
  '8a04996fdea04a0d5b924c274f4befb4cc5d4f1bcc3b1e019910cf4744f00be9'
  'f851dac9e098afa1dfcf30169b23414e7384559984eb7090aaf3c4f9c1c84997'
  'f5efb4d2e64fa9e98121b8ae0473a7366f8e727176addb0b92f568e3c6d5c66b'
)

prepare() {
  cd "${srcdir}/jupyterhub"
  patch -p0 -i "${srcdir}/tests_use_random_ports.patch"
}

build() {
  cd "${srcdir}/jupyterhub"
  python -m build --wheel --no-isolation

  # Generate the default configuration. The value of data_files_path is set
  # based on the directory containing the loaded code, so we need to replace
  # it with the final installed destination. We also replace the 'Currently
  # installed' headers with 'Included with the jupyterhub package'.
  cd build/lib
  python -m jupyterhub --generate-config -f "$srcdir/default_config.py" -y True
  local _srcdir_escaped="${srcdir////\\/}"
  sed -i "$srcdir/default_config.py" \
    -e "s/${_srcdir_escaped}\/jupyterhub/\/usr/" \
    -e 's/#  Currently installed:/#  Included with the jupyterhub package:/'
}

check() {
  cd "${srcdir}/jupyterhub"

  local skip_files=(
    # DB upgrade tests always seem to fail (virtual environment appears incorrect).
    # Assume the upstream CI checks the upgrades work.
    'test_db.py'

    # Broken by our patch to use random ports for testing. This enables a lot
    # more tests than it breaks so it is a worthwhile trade-off for now.
    'test_internal_ssl_connections.py'
  )

  local skip_tests=(
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

  # Install into a local temporary virtual environment and run the tests there.
  rm -rf test-env
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer "dist/jupyterhub-$pkgver"-*.whl
  test-env/bin/python ci/check_installed_data.py
  PATH="${srcdir}/jupyterhub/test-env/bin:$PATH" test-env/bin/python -m pytest -x -v jupyterhub "${testargs[@]}"
}

package() {
  cd "${srcdir}/jupyterhub"

  # Install the package.
  python -m installer --destdir="$pkgdir" "dist/jupyterhub-$pkgver"-*.whl
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE

  # Previously we removed unit tests from the final package. However, some plugins,
  # e.g., jupyterhub-nativeauthenticator, reuse some fixtures etc so now we keep them.

  # Remove $srcdir references from npm metadata.
  find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'

  # systemd service and default configuration.
  install -Dm644 "$srcdir/jupyterhub.service" "$pkgdir/usr/lib/systemd/system/jupyterhub.service"
  install -Dm644 "$srcdir/default_config.py" "$pkgdir/etc/jupyterhub/jupyterhub_config.py"
}
