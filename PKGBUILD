# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=molecule-plugins
pkgver=23.5.3
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
  python-jinja  # for vagrant driver
  python-packaging  # required for podman driver
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
  'ansible-core: for vagrant driver and validating docker and podman playbooks'
  'python-ansible-compat: for podman driver'
  'python-docker: for Docker support'
  'python-google-auth: for GCE playbooks'
  'python-google-api-python-client: for GCE playbooks'
  'python-pycryptodome: for GCE playbooks'
  'python-requests: for Docker support'
  'python-selinux: for SELinux and Docker support'
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
sha512sums=('5c262649dcf048c882978bc6f96b621e94c26c91aec164e79beba8eb9ea2a93d80559accbf89a3afb73bbb619a30d04a6777ca7e4e8e7e13baa69dbd281844fd')
b2sums=('9eb2b036d43ae84ae9b30cb075afed84723d083414e8c0c03bee02609e3d8b83efbd7c3e18ec5715ba636ac11b2474c221e0816ce9a3493b6eab2337987eefe7')

build() {
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver

  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  local pytest_options=(
    --deselect test/azure/functional/test_azure.py::test_azure_command_init_scenario
    --deselect test/containers/functional/test_containers.py::test_containers_command_init_scenario
    --deselect test/podman/test_func.py::test_podman_command_init_scenario
    --deselect test/podman/test_func.py::test_sample
    --deselect test/podman/test_func.py::test_dockerfile
    --deselect test/vagrant/functional/test_func.py::test_vagrant_command_init_scenario
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
