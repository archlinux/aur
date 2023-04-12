# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=molecule-plugins
pkgver=23.0.0
pkgrel=2
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
source=(https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz)
sha512sums=('205c106a9bb3a0225f4f8924ae29779e4c834ab75a05b9a6b0e1fd99036ab6b1c1d76c9ee2eae4ce4514e72dba6cd2eabb53d52aee578a86a26a7bb233c36a6b')
b2sums=('09853fa0e747335a140ecbb4bedff0b18f223ab606c45cad0a6bb08bf0429553396e25956558c558cf35f1d683d868584286ab293617c9080f8488e70d3fb0b3')

build() {
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
