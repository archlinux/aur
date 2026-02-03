# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>
# Contributor: GordonGR <ntheo1979@gmail.com>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

_basename=libdvdread
pkgname=lib32-libdvdread
pkgver=7.0.1
pkgrel=1
pkgdesc='Library for reading DVD video disks'
arch=(x86_64)
url='https://www.videolan.org/developers/libdvdnav.html'
license=(GPL-2.0-or-later)
depends=(
    lib32-glibc
    libdvdread
)
makedepends=(
    git
    meson
)
source=("git+https://code.videolan.org/videolan/libdvdread.git#tag=$pkgver")
b2sums=(9d649778290335ae732f68f24e229a8efc244eb3a4d19300eb9d81290edb9e35057182481b0100168db95d2413b1e83e073d7c068a8a9b7353fd402681742c39)
validpgpkeys=(65F7C6B4206BD057A7EB73787180713BE58D1ADC) # VideoLAN Release Signing Key (2015)

prepare() {
    cd $_basename

  # Fix out of tree build
    sed -i "s|'git', 'log'|'git', '-C', meson.project_source_root(), 'log' |" meson.build
}


build() {
    export CC='gcc -m32'
    export CXX='g++ -m32'
    export PKG_CONFIG='/usr/bin/i686-pc-linux-gnu-pkg-config'

    arch-meson $_basename build \
            --libdir='/usr/lib32' \
            -D libdvdcss=disabled

    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"

    rm -rf "$pkgdir/usr"/{include,share}
}
