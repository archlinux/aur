# Author: mosra <mosra@centrum.cz>
pkgname=magnum-bindings-git
pkgver=2019.10.r34.gf2cba9c
pkgrel=1
pkgdesc="Bindings for the Magnum C++11/C++14 graphics engine (Git version)"
arch=('i686' 'x86_64')
url="https://magnum.graphics"
license=('MIT')
depends=('magnum-git' 'python')
makedepends=('cmake' 'git' 'ninja' 'pybind11')
provides=('magnum-bindings')
conflicts=('magnum-bindings')
source=("git+git://github.com/mosra/magnum-bindings.git")
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
        -DWITH_PYTHON=ON \
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
