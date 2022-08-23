# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pdm-pep517
pkgname=python-pdm-pep517
# WARNING: python-pdm may not be compatible with whatever pdm-pep517 can be upgraded to:
# https://github.com/pdm-project/pdm/issues/1165
pkgver=1.0.4
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
  $pkgname-1.0.4-devendor.patch
)
sha512sums=('5d69b7b18dc28ff2dcccee6ecb39e9dda2c7b7cf5a012509593963bfa09dee15c284b971232243f7929d513f290098c9d833a9b61a666c98add8071f90ff9f7e'
            '905c249c87e411890fcaa26203ee42ed30c9fb7b7037196bcc8d3201073c93726beb282a98230e7c9b4ef78be233257c585f603b302e43923db596a869889109')
b2sums=('f1c7697912308091565977dd10958001ba5ede8a894298ff4934c2889cf87088c3efab731500f1e62f23fbfbea02a4aa9ec90c527e47161a00408c9773a42596'
        '9c4ce22ce832b85d4e1a7690bfd1dd7752f1176f6602be1b9c012750ce10d7f4302209d20e0c67061974a82af10babbf9ee158088d4cfe238caad584eef661b2')

prepare() {
  patch -Np1 -d $_name-$pkgver -i ../$pkgname-1.0.4-devendor.patch
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
