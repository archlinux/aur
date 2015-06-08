# Maintainer: Andreas Bilke <andreas@bilke.org>

pkgname=pdfpc-git
pkgrel=1
pkgver=v4.0.0.r0.g0043a4b
pkgdesc='A presenter console with multi-monitor support for PDF files'
arch=('i686' 'x86_64')
license=('GPL')
url='https://github.com/pdfpc/pdfpc.git'
depends=('gtk3' 'poppler-glib' 'libgee' 'gstreamer' 'gst-plugins-base')
optdepends=('gst-plugins-good: more codecs for video playback support')
makedepends=('git' 'sed' 'cmake' 'vala')
conflicts=('pdfpc')
md5sums=('SKIP')

source=("$pkgname::git+https://github.com/pdfpc/pdfpc.git")

pkgver() {
    cd "$srcdir/$pkgname"
    ( set -o pipefail
        git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

prepare() {
    cd "$pkgname"
    git submodule init
    git submodule update
}

build() {
    cd "$pkgname"
    [[ -d build ]] || mkdir build
    cd build/

    cmake -DCMAKE_INSTALL_PREFIX="/usr/" -DSYSCONFDIR="/etc" -DCMAKE_BUILD_TYPE=Release ../ 
    make
}

package() {
    cd "$pkgname/build"
    make DESTDIR="$pkgdir" install
}

# vim: set ts=4 sw=4 tw=0 et :
