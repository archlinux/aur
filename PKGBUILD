# Maintainer: gardar <aur@gardar.net>

pkgname=molecule-containers
pkgver=1.0.2
pkgrel=2
pkgdesc="Molecule Container-agnostic Driver Plugin"
arch=('any')
url="https://github.com/ansible-community/molecule-containers"
license=('MIT')
depends=('molecule' 'python-ansible-compat' 'python-selinux')
makedepends=('python-setuptools-scm' 'python-setuptools-scm-git-archive' 'python-build')
checkdepends=('python-pytest')
optdepends=('podman: for using a local podman setup' 'docker: for using a local docker setup')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('ad2bfb61e3c0608e981ce9a8f466e21cb5c62e0310f1cc13fd3555ff5b53e11cba0263756b6fd8ea70cc1cf1bbd259bd577e8d4fdb4e27f1461f79baf684e270')
b2sums=('3b88f6c4a12ddad8fd993cbffed23f1cc941a696fceb24ef309c4bc6ede36debc6bcfd0c09807fefdaf15e4fcc70bf925f8caaf4ec806c146e5de98afd27f54c')

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
  python -m install --optimize=1 --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -vDm 644 README.rst \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}

