# Maintainer: Peter Blackman <peter at pblackman dot plus dot com>
pkgname=lazbuild
pkgver=4.8
_lazarus_tag=4_8
pkgrel=1
pkgdesc="Build lazarus applications for any widgetset"
arch=('i686' 'x86_64' 'aarch64')
url='http://www.lazarus.freepascal.org/'
license=('GPL-2.0-or-later' 'LGPL-2.1-or-later' 'MPL-1.1')
depends=('bash' 'glibc')
makedepends=('fpc' 'fpc-src')

# Install widget set support as needed
optdepends=('qt4pas' 'qt5pas' 'qt6pas' 'gtk' 'gtk2' 'gtk3')

conflicts=('lazarus' 'lazarus-gtk2' 'lazarus-gtk3' 'lazarus-qt5' 'lazarus-qt6')
provides=( 'lazarus' 'lazarus-gtk2' 'lazarus-gtk3' 'lazarus-qt5' 'lazarus-qt6')
options=(!makeflags libtool staticlibs !strip)
source=("https://gitlab.com/freepascal.org/lazarus/lazarus/-/archive/lazarus_${_lazarus_tag}/lazarus-lazarus_${_lazarus_tag}.tar.bz2")
sha256sums=('fcdaa4b6c2675bc89d1d9ececa549401c8688f99b61650b1b766b9b3528de490')

build() {
    cd "lazarus-lazarus_${_lazarus_tag}"
    make FPC=/usr/bin/fpc OPT='-gl -gw -Crtoi' lazbuild
}

package() {
    cd "lazarus-lazarus_${_lazarus_tag}"
    install -Dm755 lazbuild "$pkgdir"/usr/bin/lazbuild

    mkdir -p "$pkgdir"/usr/lib/lazarus
    mkdir -p "$pkgdir"/usr/share/licenses/$pkgname
    mkdir -p "$pkgdir"/usr/share/man/man1
    
    cp -a lcl        "$pkgdir"/usr/lib/lazarus
    cp -a components "$pkgdir"/usr/lib/lazarus
    cp -a packager   "$pkgdir"/usr/lib/lazarus
    cp -a ide        "$pkgdir"/usr/lib/lazarus
    
    cp -a COPYING.*.*                 "$pkgdir"/usr/share/licenses/$pkgname/
    cp -a install/man/man1/lazbuild.1 "$pkgdir"/usr/share/man/man1
    
    rm -f "$pkgdir"/usr/lib/lazarus/components/chmhelp/lhelp/lhelp.app/Contents/MacOS/lhelp
}
