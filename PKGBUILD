# Maintainer: milk <milk on freenode>
# modified from the original sequencer64-git pkg
# Contributor: Daniel Appelt <daniel.appelt@gmail.com>
# Contributor: Gimmeapill <gimmeapill at gmail dot com>
_pkgbasename=sequencer64
pkgname=${_pkgbasename}-next-git
pkgver=0.95.0.r29.gbdfb7baf
pkgrel=1
pkgdesc="A live-looping MIDI sequencer. Development branch (unstable)"
arch=('i686' 'x86_64')
url="https://github.com/ahlstromcj/sequencer64.git"
license=('GPL')
depends=('gtkmm' 'jack')
makedepends=('git' 'autoconf-archive')
provides=("${_pkgbasename}")
conflicts=("${_pkgbasename}")
source=("${_pkgbasename}::git://github.com/ahlstromcj/sequencer64.git#branch=qt5_reconcile")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgbasename}"

    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_pkgbasename}"

    ./bootstrap --full-clean
    ./bootstrap -er -qt
    ./configure --enable-silent-rules --enable-qtmidi --prefix=/usr --enable-debug=yes --enable-mainscroll
    make
}

package() {
    cd "${srcdir}/${_pkgbasename}"

    make DESTDIR="${pkgdir}" install

    install -v -D -m 0644 "debian/${_pkgbasename}.xpm" "${pkgdir}/usr/share/pixmaps/${_pkgbasename}.xpm"
    install -v -D -m 0644 "debian/${_pkgbasename}.desktop" "${pkgdir}/usr/share/applications/${_pkgbasename}.desktop"
}
