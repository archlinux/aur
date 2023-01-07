# Maintainer: gardar <aur@gardar.net>

pkgname=molecule-containers
pkgver=2.0.0
pkgrel=1
pkgdesc="Molecule Container-agnostic Driver Plugin"
arch=('any')
url="https://github.com/ansible-community/molecule-containers"
license=('MIT')
depends=('molecule' 'python-ansible-compat' 'python-selinux')
makedepends=('python-setuptools-scm' 'python-setuptools-scm-git-archive' 'python-build' 'python-installer')
checkdepends=('python-pytest' 'python-pytest-cov')
optdepends=('podman: for using a local podman setup' 'docker: for using a local docker setup')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('596fc31ea49ec541f44b5ea6cdd8c48a0e05192b8ab5b412ebbca0a6eb1ae8008c9ac9173e5ec5c40561c2a462122f28c5e95b848cbf2eb18649bf379b309c83')
b2sums=('d428757f3532709462d33feca2e23c2f066a0297ce980ae5012aa841c1ef624f4d31faa8f7038542f029af1ac3e9832e40b6290dad96859c08770515efd04a8c')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd "$pkgname-$pkgver"
  export PYTHONPATH="build:${PYTHONPATH}"
  # disable tests that require the driver to be installed for the system
  # version of molecule that we are testing with
  pytest -v --ignore src/molecule_containers/test/functional/test_containers.py
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="${pkgdir}" --compile-bytecode=1 dist/*.whl
  install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -vDm 644 README.rst \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}

