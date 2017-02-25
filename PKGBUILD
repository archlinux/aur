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
depends=('curl' 'hidapi' 'qrencode' 'qt5-base')
source=(
    "git://github.com/digitalbitbox/${gitname}.git#tag=v${pkgver}"
    '51-hid-digitalbitbox.rules'
)
sha256sums=(
    'SKIP'
    'f462058da1a96290bf5435b91ed5bfd73486aa86d265b3ff169da4aba7af3dfe'
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

    install -Dm0644 "${srcdir}/51-hid-digitalbitbox.rules" "${pkgdir}/usr/lib/udev/rules.d/51-hid-digitalbitbox.rules"
}
