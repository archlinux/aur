# Maintainer: Michael Migliore <mcmigliore+aur@gmail.com>

pkgname=f3d-git
pkgver=0.1.ed9b979
pkgrel=1
pkgdesc='A fast and minimalist 3D viewer'
arch=('x86_64')
url="https://gitlab.kitware.com/f3d/f3d"
license=('BSD')
depends=('vtk-raytracing-git')
makedepends=('cmake')

prepare() {
    cd "${srcdir}"
    git clone ${url}.git f3d 2> /dev/null || git -C f3d pull
}

pkgver() {
    cd "${srcdir}/f3d"
    echo "0.1.$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/f3d"
    mkdir -p build && cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr \
          -DCMAKE_BUILD_TYPE=Release \
          -DBUILD_TESTING=OFF \
          ..
    make
}

package() {
    cd "$srcdir/f3d/build"
    make DESTDIR="${pkgdir}" install

    install -dv "${pkgdir}"/usr/share/licenses/f3d
    mv "${pkgdir}"/usr/LICENSE "${pkgdir}"/usr/share/licenses/f3d

    install -dv "${pkgdir}"/usr/share/doc/f3d
    mv "${pkgdir}"/usr/README.md "${pkgdir}"/usr/share/doc/f3d
}
