# Maintainer: David Runge <dvzrv@archlinux.org>

_name=calmjs
pkgname=python-calmjs
pkgver=3.4.1
pkgrel=3
pkgdesc="framework for building toolchains and utilities for working with the JavaScript/Node.js ecosystem"
arch=('any')
url="https://github.com/calmjs/calmjs"
license=('GPL2')
depends=('python-calmjs.parse' 'python-calmjs.types' 'python-setuptools')
checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.zip")
sha512sums=('3ac22ee03b0450141376ddcad1ac559e23fc15b7b496937a3b43c7334510ee1b6338b3a21c5ea875c908f4c8bb0c3657f18d83ac77cd9c76cc9f584a330316ca')

prepare() {
  mv -v "${_name}-${pkgver}" "$pkgname-$pkgver"
}

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

check() {
  cd "$pkgname-$pkgver"
  export PYTHONPATH="build:${PYTHONPATH}"
  # direct pytest setup not supported (yet)
  # https://github.com/calmjs/calmjs/issues/58
  python setup.py test
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --skip-build \
    --optimize=1 \
    --prefix=/usr \
    --root="${pkgdir}"
  install -vDm 644 {CHANGES,README}.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}
