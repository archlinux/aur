# Maintainer: Rene Hickersberger <r@renehsz.com>
pkgname='visurf-git'
pkgver=3.10.r356.g8f7036e44
pkgrel=1
pkgdesc='Minimalistic frontend for Netsurf with vi-like keybindings (Wayland only)'
url='https://sr.ht/~sircmpwn/visurf/'
license=('GPL2' 'MIT')

depends=('curl' 'libjpeg-turbo' 'libpng' 'zlib' 'openssl' 'expat' 'wayland' 'wayland-protocols' 'cairo' 'pango' 'libxkbcommon')
makedepends=('git' 'gperf' 'perl-html-parser' 'flex' 'bison')
provides=('visurf')
conflicts=('visurf' 'netsurf')

arch=('x86_64')
source=(
    'http://download.netsurf-browser.org/netsurf/releases/source-full/netsurf-all-3.10.tar.gz'
    "visurf::git+https://git.sr.ht/~sircmpwn/visurf"
    'libcss::git+git://git.netsurf-browser.org/libcss.git#commit=f420dd16136de1dc07f18824c6d0f5540d5df6d1'
)
sha256sums=(
    '495adf6b6614ce36fca6c605f7c321f9cb4a3df838043158122678ce2b3325b7'
    'SKIP'
    'SKIP'
)

pkgver() {
	cd "$srcdir/visurf"
	git describe --always | sed -e 's:release/::; s:-\([0-9]\+\)-:.r\1.:'
}

prepare() {
    cd "$srcdir/visurf"
    [ -e "$srcdir/netsurf-all-3.10"/netsurf ] && rm -r "$srcdir/netsurf-all-3.10"/netsurf
    [ -e "$srcdir/netsurf-all-3.10"/libcss ] && rm -r "$srcdir/netsurf-all-3.10"/libcss
    cp -r "$srcdir/visurf" "$srcdir/netsurf-all-3.10/netsurf"
    cp -r "$srcdir/libcss" "$srcdir/netsurf-all-3.10/libcss"
}

build() {
    cd "$srcdir/netsurf-all-3.10"
    export CFLAGS=-w
    make TARGET=visurf PREFIX=/usr LIBDIR=lib INCLUDEDIR=include -j$(nproc)
}

package() {
	cd "$srcdir/netsurf-all-3.10"
    make TARGET=visurf PREFIX=/usr LIBDIR=lib INCLUDEDIR=include DESTDIR="$pkgdir" install
}

