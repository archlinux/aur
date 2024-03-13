# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>
# Contributor: Sahan Fernando <sahan.h.fernando@gmail.com>

_pkgname=libsoundio
pkgname=${_pkgname}-git
pkgver=2.0.0.5.g49a1f78
pkgrel=1
pkgdesc='A C99 library providing cross-platform audio input and output'
arch=('i686' 'x86_64')
url='https://www.github.com/andrewrk/libsoundio'
license=('MIT')
source=('git+https://github.com/andrewrk/libsoundio.git')
depends=('alsa-lib' 'glibc' 'jack')
makedepends=('git' 'cmake')
provides=('libsoundio')
conflicts=('libsoundio')
md5sums=('SKIP')

pkgver() {
    cd $_pkgname
    git describe --long | sed -e 's/-/./g'
}

build() {
    mkdir -p "$_pkgname.build"
    cd "$_pkgname.build"
    cmake \
        -D CMAKE_BUILD_TYPE=Release \
        -D CMAKE_INSTALL_PREFIX=/usr \
        -D CMAKE_INSTALL_LIBDIR=lib \
        -D BUILD_EXAMPLE_PROGRAMS=OFF \
        -D BUILD_TESTS=OFF \
        -D BUILD_STATIC_LIBS=OFF \
        -D ENABLE_JACK=ON \
        "$srcdir/$_pkgname"
    make
}

package() {
    make \
        -C "$_pkgname.build" \
        install DESTDIR="$pkgdir"

    install -Dm644 "$srcdir/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
