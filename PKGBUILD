# Maintainer: taotieren <admin@taotieren.com>

pkgbase=115-browser-bin
pkgname=115-browser-bin
_pkgname=115br
pkgver=35.17.0
pkgrel=1
arch=('x86_64')
options=(!strip !debug)
depends=(
    dbus
    expat
    gcc-libs
    glib2
    glibc
    libidn2
    sh
    zlib
)
makedepends=(libarchive)
provides=(${pkgname%-bin})
conflicts=(${pkgname%-bin})
replaces=()
pkgdesc="115 Browser / 115 浏览器"
license=('LicenseRef-scancode-commercial-license')
url="https://115.com/product_browser"
install=${pkgname}.install
source_x86_64=(
    "${pkgname}-${pkgver}.deb::https://down.115.com/client/115pc/lin/115br_v${pkgver}.deb"
    "https://115.com/privacy.html"
    "https://115.com/copyright.html"
    "${pkgname}.install"
)
sha256sums_x86_64=('1ad15f38604ee4eadddfd3bcf97629e8a61f3245f50a7b2ad118bd8bf2c1fb46'
                   'e65199037614ec40eae799f013d007a9252d1b870ec9406fffd7f0aaee3951f1'
                   'cfe25e4d5d8236b3b68089fbc4b56aaa7db1d0a560905f1faf004bc5e4534245'
                   'ce0e3cdf98637003986feb9abb198cf04135333116f44e1642ba438d344a6a2e')
noextract=("${pkgname}-${pkgver}.deb")

prepare() {
    if [ -d ${srcdir}/${pkgname}-${pkgver} ]; then
        rm -rf ${srcdir}/${pkgname}-${pkgver}
    fi
    mkdir -pv ${srcdir}/${pkgname}-${pkgver}

    bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.deb" --numeric-owner -C "${srcdir}/${pkgname}-${pkgver}"
}

package() {
    install -dvm755 "${pkgdir}/usr/bin" \
        "${pkgdir}/opt/115"

    bsdtar -xf "${srcdir}/${pkgname}-${pkgver}/data.tar.xz" --numeric-owner -C "${pkgdir}"

    chown -R root:root "${pkgdir}"

    mv "${pkgdir}/usr/local/115Browser" "${pkgdir}/opt/115" && rm -rf "${pkgdir}/usr/local"

    sed -i 's|/usr/local|/opt/115|g' "${pkgdir}/usr/share/applications/115Browser.desktop"
    sed -i 's|/usr/local|/opt/115|g' "${pkgdir}/opt/115/115Browser/115.sh"
    ln -sf "/opt/115/115Browser/115.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"

    chmod 755 ${pkgdir}/usr/share/applications/115Browser.desktop
    install -vDm644 "${srcdir}/privacy.html" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -vDm644 "${srcdir}/copyright.html" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
