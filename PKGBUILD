# Maintainer: Imperator Storm <30777770+ImperatorStorm@users.noreply.github.com>

pkgname=minizip-git
_pkgname=minizip
pkgdesc="Fork of the popular zip manipulation library found in the zlib distribution."
pkgver=3.0.2.r0.gbc93e40
pkgrel=1
arch=('x86_64')
license=('zlib')
url="https://github.com/zlib-ng/minizip-ng"
depends=('glibc' 'libbsd' 'zlib')
makedepends=('git' 'cmake')
conflicts=('minizip' 'minizip-ng' 'minizip-git')
provides=('minizip' 'minizip-ng' 'minizip-git')
source=("git+https://github.com/zlib-ng/minizip-ng")
sha256sums=('SKIP')

pkgver() {
  cd ${srcdir}/${_pkgname}-ng
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd ${srcdir}/${_pkgname}-ng
    if [[ -d build ]]; then
      rm -rf build
    fi
    mkdir build
}

build() {
    cd ${srcdir}/${_pkgname}-ng/build
    cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_SHARED_LIBS=ON \
        -DCMAKE_INSTALL_INCLUDEDIR=/usr/include/minizip \
        -DCMAKE_BUILD_TYPE=Release ..
    make
}

package() {
    cd ${srcdir}/${_pkgname}-ng/build
    make DESTDIR="${pkgdir}" install
    install -D -m644 "${srcdir}/${_pkgname}-ng/LICENSE" "${pkgdir}/usr/share/licenses/minizip/LICENSE"
}

