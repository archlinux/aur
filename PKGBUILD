# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=molecule-plugins
pkgver=23.4.1
pkgrel=3
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
  https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz
  $pkgname-23.4.1-molecule_internals.patch
)
sha512sums=('5c158e278318402006f9f86f4143dac27d0cf6e95912963414e9c06720f9b5572240a6b6ddaccbd2872bb594144215a4a5ec434f4414e692fb72a3d97de175d3'
            '11822fbd65ba7ccc796e454c015fe765a811e82bd89dc0727201cd45495907df3f808be967d73f45473c073816f9db5c072f32dbcab807229d7c7cf82de9101c')
b2sums=('e0261d189e55b0705ff2e967620146dd6ef0bc4182a6e87d5ffdaf8e1298dc0bc9e9bb188669300b63cf692f822ad6b0d4c8038fc1cff6afbf7f79b61dfbc184'
        '62bb11057e5c429229a033ca8911b836817c456270077469decf608c9c9927c425e1c647a54f5370b4cabb644cfb0a1e44e0166b6a4f21912ce4e430f6b56a8f')

prepare() {
  # fix issues with vagrant plugin using molecule internals that are now gone:
  # https://github.com/ansible-community/molecule-plugins/pull/142
  # https://bugs.archlinux.org/task/78447
  patch -Np1 -d $pkgname-$pkgver -i ../$pkgname-23.4.1-molecule_internals.patch
}

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
