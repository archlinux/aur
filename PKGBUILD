# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=molecule-plugins
pkgver=23.5.0
pkgrel=1
pkgdesc="Collection of molecule plugins"
arch=(any)
url="https://github.com/ansible-community/molecule-plugins"
license=(MIT)
depends=(
  molecule
  python
  python-boto3  # for ec2 driver
  python-cryptography  # for ec2 driver
  python-docker
  python-packaging  # required for podman driver
  python-requests
  python-selinux
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-setuptools-scm
  python-wheel
)
checkdepends=(
  podman
  python-filelock
  python-google-auth
  python-google-api-python-client
  python-pexpect
  python-pycryptodome
  python-pytest
  python-pytest-helpers-namespace
  python-vagrant
  vagrant
)
optdepends=(
  'python-pycryptodome: for GCE playbooks'
  'python-google-auth: for GCE playbooks'
  'python-google-api-python-client: for GCE playbooks'
  'python-vagrant: for vagrant module'
)
conflicts=(
  molecule-containers
  molecule-docker
  molecule-podman
  molecule-vagrant
)
replaces=(
  molecule-containers
  molecule-docker
  molecule-podman
  molecule-vagrant
)
source=(
  $url/archive/v$pkgver/$pkgname-v$pkgver.tar.gz
)
sha512sums=('f9e50d0810ba8be3c393f48f101bf2db6f37374747204150237b3ba760abbbe1a562af4efb2c0804f40fd4635d1bfcdc324b02135e8954ec19614a05d4c1e53f')
b2sums=('ee51a6f671043c75640a5b35c8207b8d0398cfd937d9ccd9bb1df2ae29a631c1fc2f72e58893605f75c88cdcad99fd75e85212d893583cc076751f778d1e2565')

build() {
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver

  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  local pytest_options=(
    --deselect test/azure/functional/test_azure.py::test_command_init_scenario
    --deselect test/containers/functional/test_containers.py::test_command_init_scenario
    --deselect test/podman/test_func.py::test_command_init_scenario
    --deselect test/podman/test_func.py::test_sample
    --deselect test/podman/test_func.py::test_dockerfile
    --deselect test/vagrant/functional/test_func.py::test_command_init_scenario
    --deselect test/vagrant/functional/test_func.py::test_invalid_settings
    --deselect test/vagrant/functional/test_func.py::test_vagrant_root[vagrant_root]
    --deselect test/vagrant/functional/test_func.py::test_vagrant_root[config_options]
    --deselect test/vagrant/functional/test_func.py::test_vagrant_root[provider_config_options]
    --deselect test/vagrant/functional/test_func.py::test_vagrant_root[default]
    --deselect test/vagrant/functional/test_func.py::test_vagrant_root[default-compat]
    --deselect test/vagrant/functional/test_func.py::test_vagrant_root[network]
    --deselect test/vagrant/functional/test_func.py::test_vagrant_root[hostname]
    --deselect test/vagrant/functional/test_func.py::test_multi_node
    -vv
  )

  cd $pkgname-$pkgver
  # install to temporary location, as importlib is used
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="test_dir/$site_packages:$PYTHONPATH"
  # skip tests that would fail because of missing interpreters: https://github.com/pdm-project/pdm/issues/1175
  pytest "${pytest_options[@]}"
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 doc/ec2/*.rst  -t "$pkgdir/usr/share/doc/$pkgname/ec2"
  install -vDm 644 doc/vagrant/*.rst  -t "$pkgdir/usr/share/doc/$pkgname/vagrant"
}
