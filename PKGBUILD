# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pdm-pep517
pkgname=python-pdm-pep517
# WARNING: python-pdm may not be compatible with whatever pdm-pep517 can be upgraded to:
# https://github.com/pdm-project/pdm/issues/1165
pkgver=1.0.2
pkgrel=1
epoch=1
pkgdesc="A PEP 517 backend for PDM that supports PEP 621 metadata"
arch=(any)
url="https://github.com/pdm-project/pdm-pep517"
license=(MIT)
depends=(python)
# NOTE devendored from sources
depends+=(
  python-cerberus
  python-license-expression
  python-packaging
  python-tomli
  python-tomli-w
)
makedepends=(python-build python-installer)
checkdepends=(git python-pytest python-setuptools)
optdepends=(
  'python-setuptools: for setuptools support'
)
source=(
  https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz
  $pkgname-1.0.2-devendor.patch
)
sha512sums=('c8c7a201dd08e8def56cb133874c3ee0ea6a9d1bf89141db125e9b5426bc00f0fc3eac37c32fef8cb4e2598981c3f764169dd1e55d886124db2e97a5a4ee229a'
            '7ce53fd5e39891aee5a20ad34f6bc55534b5a1a34949885029b1740201049f23235e8f7d18cb427518c5e9d20326f1cdf5f463a82eaec2d442aa7cad3732ff66')
b2sums=('2a7597d706d1d96f9923db7e9c90210180c9da8f643aca18c6c636149d0e5d6c11df060766351b76895003326c1ea171fb085f9c93fe7be5dce9d34fbb1701fa'
        '8025738bd56df56d50e6fc131f30115a345740d8ffc9b07e4a1cc5595ca4984ea47a6aa5549e4b4b85ca2a0ed0372072b66b509481d1450f0f6a4910696a450e')

prepare() {
  patch -Np1 -d $_name-$pkgver -i ../$pkgname-1.0.2-devendor.patch
  rm -frv $_name-$pkgver/pdm/pep517/_vendor
}

build() {
  cd $_name-$pkgver
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd $_name-$pkgver

  # set default git config for test
  git config --global user.email "you@example.com"
  git config --global user.name "Your Name"
  pytest -vv
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
