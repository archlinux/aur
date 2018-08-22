# Maintainer: Alejandro Díaz-Caro <alejandro@diaz-caro.info>

pkgname=pdfpc-notimer
pkgver=4.1.2
_pkgver=$pkgver
pkgrel=2
pkgdesc='PDFPC with a patch to not show the timer in the presentations.'
arch=('x86_64')
url='https://pdfpc.github.io/'
license=('GPL')
depends=('gtk3' 'poppler-glib' 'libgee' 'gstreamer' 'gst-plugins-base')
optdepends=('gst-plugins-good: more codecs for video playback support'
            'gst-libav: more codecs for video playback support')
makedepends=('cmake' 'vala')
conflicts=('pdfpc')
source=("pdfpc-$_pkgver.tar.gz::https://github.com/pdfpc/pdfpc/archive/v$_pkgver.tar.gz"
"deb888677.patch::https://github.com/pdfpc/pdfpc/commit/21e4efb3afe325fe7e2f800d1c22fd1bc28bc3d7.patch"
"notimer.patch")

sha256sums=('0fcacd0deac39d93e21fc152b0cb01279b4ba209934fe385be6811236a03c87d'
            '8546c86cbcbf24491c9f44f7fd294de144b3bee57725cea8827e0006239ebcef'
            '79d728ca0d88c6d2007643d6b528d5a5aa4c144008143f3bd00d7b419256860b')

prepare() {
    cd "$srcdir/pdfpc-$_pkgver"
    patch -p1 <../deb888677.patch ## reverse the pr344 to fix video playback
    patch -Np1 -i "$srcdir/notimer.patch" ## do not print the timer
    ## see https://bugs.archlinux.org/task/58786
}

build() {
    cd "$srcdir/pdfpc-$_pkgver"
    cmake  -DCMAKE_INSTALL_PREFIX="/usr/" -DSYSCONFDIR="/etc" .
    make
}

package() {
    cd "$srcdir/pdfpc-$_pkgver"
    make DESTDIR="$pkgdir/" install
}

# vim:set ts=4 sw=4 et:
