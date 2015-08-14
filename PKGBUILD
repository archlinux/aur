# $Id$
#Maintainer: Gaetan Bisson <bisson@archlinux.org>
#Contributor: Tobias Powalowski <tpowa@archlinux.org>

pkgname=unison-240-compat
_pkgname=unison
pkgver=2.40.128
pkgrel=1
pkgdesc='File-synchronization tool'
url='http://www.cis.upenn.edu/~bcpierce/unison/'
arch=('i686' 'x86_64')
license=('GPL2')
optdepends=('gtk2: for gtk2 support')
makedepends=('ocaml' 'lablgtk2' 'imagemagick')
conflicts=('unison')
source=("http://www.cis.upenn.edu/~bcpierce/unison/download/releases/${_pkgname}-${pkgver}/${_pkgname}-${pkgver}.tar.gz"
        'desktop')
sha1sums=('392a573cbf331d71cac8ccb32f5440dceec88470'
          '9dad1737dd8d90e7ee2744a96cf71bd9f802a12a')

options=('!makeflags')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    CFLAGS=""

    for ui in text gtk2; do
        make clean
        make mkProjectInfo 
        make UISTYLE=$ui DEBUGGING=false THREADS=true
        mv unison unison-$ui
    done
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    install -d "${pkgdir}"/usr/bin
    install -m755 unison-* "${pkgdir}"/usr/bin

    install -d "${pkgdir}"/usr/share/{pixmaps,applications}
    convert win32rc/U.ico[1] "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
    install -m644 ../desktop "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    cd "${pkgdir}"/usr/bin
    ln -s unison-text unison
    ln -s unison-gtk2 unison-x11
    ln -s unison unison-${pkgver%.*}
}
