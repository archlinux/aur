# Maintainer: Saleem Rashid <dev@saleemrashid.com>
pkgbase='dbb-app'
pkgname=("${pkgbase}" 'dbb-cli')
gitname="${pkgbase}"
pkgrel=1
pkgver='3.0.0'
url='https://digitalbitbox.com/'
arch=('i686' 'x86_64')
license=('MIT')
source=(
    "git://github.com/digitalbitbox/${gitname}.git#tag=v${pkgver}"
    '51-hid-digitalbitbox.rules'
    'digitalbitbox.desktop'
)
sha256sums=('SKIP'
            'fc8273cb499f6643ebfdf197f7fa00efbed171d65c6eff75f93460a0ec5b41d4'
            '255065c71b2ad7ab7328518689d800a6284ecf9c445c6004281800420bdc411f')

build() {
    cd "${srcdir}/${gitname}"

    ./autogen.sh
    ./configure --prefix=/usr --with-gui=qt5 --enable-shared=no --enable-libusb --disable-udev-check LDFLAGS="-pthread"
    make
}

package_dbb-app() {
    pkgdesc='A QT based application for the Digital Bitbox hardware wallet'
    depends=('curl' 'hidapi' 'qrencode' 'qt5-base' 'desktop-file-utils' 'dbb-cli')

    cd "${srcdir}/${gitname}"

    install -Dm0755 src/dbb-app "${pkgdir}/usr/bin/dbb-app"
    install -Dm0644 src/qt/res/dbb_icon.png "${pkgdir}/usr/share/pixmaps/digitalbitbox.png"

    install -Dm0644 "${srcdir}/digitalbitbox.desktop" "${pkgdir}/usr/share/applications/digitalbitbox.desktop"

    install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_dbb-cli() {
    pkgdesc='A command line application for the Digital Bitbox hardware wallet'
    depends=('hidapi')

    cd "${srcdir}/${gitname}"

    install -Dm0755 src/dbb-cli "${pkgdir}/usr/bin/dbb-cli"

    install -Dm0644 "${srcdir}/51-hid-digitalbitbox.rules" "${pkgdir}/usr/lib/udev/rules.d/51-hid-digitalbitbox.rules"

    install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
