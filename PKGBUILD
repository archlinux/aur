# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=python-halide
_pkgname=${pkgname#python-}
pkgver=18.0.0
pkgrel=2
pkgdesc='A Python interface for Halide language.'
arch=('x86_64')
url='https://github.com/halide/Halide'
license=('MIT')
groups=()
depends=('halide' 'python-imageio' 'python-numpy' 'python-pillow' 'python-scipy')
makedepends=(
    'cmake' 'ninja' 'python-build' 'python-installer' 'python-setuptools'
    'python-scikit-build' 'python-wheel'
)
optdepends=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1176b42a3e2374ab38555d9316c78e39b157044b5a8e765c748bf3afd2edb351')

prepare() {
  sed -Ei '/"cmake|ninja|pybind11/d' $srcdir/${_pkgname^}-$pkgver/pyproject.toml
  sed -i 's/-DHalide_Python_INSTALL_IMPORTED_DEPS=ON/-DHalide_Python_INSTALL_IMPORTED_DEPS=OFF/' $srcdir/${_pkgname^}-$pkgver/setup.py
}

build() {
  python -m build -nw $srcdir/${_pkgname^}-$pkgver
}

package() {
  python -m installer \
    --compile-bytecode 1 \
    --destdir $pkgdir \
    $srcdir/${_pkgname^}-$pkgver/dist/$_pkgname-$pkgver-*-*.whl
}
