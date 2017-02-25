# Maintainer: Saleem Rashid <devsaleemrashid.com>
_pkgname='dbb-app'
pkgname="${_pkgname}"
gitname="${_pkgname}"
pkgrel=1
pkgver='2.1.0'
pkgdesc='A QT based application for the Digital Bitbox hardware wallet'
url='https://digitalbitbox.com/'
arch=('i686' 'x86_64')
license=('MIT')
depends=('curl' 'hidapi' 'qrencode' 'qt5-base' 'desktop-file-utils')
source=(
    "git://github.com/digitalbitbox/${gitname}.git#tag=v${pkgver}"
    '51-hid-digitalbitbox.rules'
    'digitalbitbox.desktop'
)
sha256sums=(
    'SKIP'
    'f462058da1a96290bf5435b91ed5bfd73486aa86d265b3ff169da4aba7af3dfe'
    '255065c71b2ad7ab7328518689d800a6284ecf9c445c6004281800420bdc411f'
)

build() {
    cd "${srcdir}/${gitname}"

    ./autogen.sh
    ./configure --prefix=/usr --with-gui=qt5 --enable-shared=no LDFLAGS="-pthread"
    make
}

package() {
    cd "${srcdir}/${gitname}"

    make DESTDIR="${pkgdir}" install

    install -Dm0644 src/qt/res/dbb.png "${pkgdir}/usr/share/pixmaps/digitalbitbox.png"
    install -Dm0644 "${srcdir}/digitalbitbox.desktop" "${pkgdir}/usr/share/applications/digitalbitbox.desktop"
    install -Dm0644 "${srcdir}/51-hid-digitalbitbox.rules" "${pkgdir}/usr/lib/udev/rules.d/51-hid-digitalbitbox.rules"
}
