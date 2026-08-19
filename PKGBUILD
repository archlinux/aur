# Maintainer: taotieren <admin@taotieren.com>

pkgbase=115-browser-bin
pkgname=115-browser-bin
_pkgname=115br
pkgver=36.0.1
pkgrel=1
arch=('x86_64')
options=(!strip !debug)
depends=(
    dbus
    expat
    glib2
    libgcc_s.so
    libidn2
    libstdc++.so
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
source=(
    "https://115.com/privacy.html"
    "https://115.com/copyright.html"
    "${pkgname}.install"
)
source_x86_64=(
    "${pkgname}-${pkgver}.deb::https://down.115.com/client/115pc/lin/115br_v${pkgver}.deb"
)
sha256sums=('7a1c438a53cd10ad78b9ea150521f12e6d97e10cf07f07d38d4f0a65f22cafcf'
            'cfe25e4d5d8236b3b68089fbc4b56aaa7db1d0a560905f1faf004bc5e4534245'
            'ce0e3cdf98637003986feb9abb198cf04135333116f44e1642ba438d344a6a2e')
sha256sums_x86_64=('a26f84625b5c1ca1a7f6e2eb5a89327c49627fb7f04db1b71e27c48904b88d8b')
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
