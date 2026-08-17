# Author: mosra <mosra@centrum.cz>
pkgname=magnum-bindings-git
pkgver=2020.06.r455.gbcfc4b7
pkgrel=1
pkgdesc="Bindings for the Magnum C++11 graphics engine (Git version)"
arch=('i686' 'x86_64')
url="https://magnum.graphics"
license=('MIT')
depends=('magnum-git' 'python')
makedepends=('cmake' 'git' 'ninja' 'pybind11')
provides=('magnum-bindings')
conflicts=('magnum-bindings')
source=("git+https://github.com/mosra/magnum-bindings.git")
sha1sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/v//g'
}

build() {
    mkdir -p "$srcdir/build"
    cd "$srcdir/build"

    cmake "$srcdir/${pkgname%-git}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DMAGNUM_WITH_PYTHON=ON \
        -G Ninja
    ninja
}

package() {
    # Helper headers
    cd "$srcdir/build"
    DESTDIR="$pkgdir/" ninja install

    # Native and python packages
    cd "$srcdir/build/src/python"
    python setup.py install --root="$pkgdir" --prefix=/usr
}
