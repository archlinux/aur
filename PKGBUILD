# Maintainer: GordonGR <ntheo1979@gmail.com>
# Contributor: Sebastian Lau <lauseb644@gmail.com>

pkgname=lib32-libx264-stable-git
_pkgbase=x264
_pkgname=libx264
_pkgver=144
pkgver=144.r2533.c8a773e
pkgrel=1
pkgdesc='Free library for encoding H264/AVC video streams, lib32'
arch=('x86_64')
url='http://www.videolan.org/developers/x264.html'
license=('GPL')
makedepends=('git' 'gcc-multilib' 'yasm')
depends=("${_pkgname}")
replaces=('lib32-libx264')
conflicts=('lib32-libx264')
provides=('lib32-libx264')
source=('git://git.videolan.org/x264.git#branch=stable')
md5sums=('SKIP')

pkgver() {
  cd ${srcdir}/${_pkgbase}
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "%s.r%s.%s" "${_pkgver}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
    cd ${srcdir}/${_pkgbase}
    sed -i 's/host_cpu\=\"\${host\%\%-\*}\"/host_cpu\="i386"/' configure


    ./configure --prefix=/usr --libdir=/usr/lib32 --enable-shared

    make
}

package() {
    cd ${srcdir}/${_pkgbase}
  
    make DESTDIR="$pkgdir/" install-lib-dev
    make DESTDIR="$pkgdir/" install-lib-shared

    cd "$pkgdir/usr"
    rm -rf include/

# Modify x264.pc
cd "${pkgdir}/usr/lib32/pkgconfig"
sed -i 's|includedir=${prefix}/include|includedir=${prefix}/include/libx264/|' x264.pc

}