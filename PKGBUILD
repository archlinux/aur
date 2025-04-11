# Maintainer: taotieren <admin@taotieren.com>

pkgbase=115-browser-bin
pkgname=115-browser-bin
_pkgname=115br
pkgver=35.15.0.2
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
    "${pkgname}.install"
)
sha256sums_x86_64=('2fc526ed61e435517afc15a01d1a84f4cb04c234f642f7cbf4c7e278c23ca0ee'
                   'ce0e3cdf98637003986feb9abb198cf04135333116f44e1642ba438d344a6a2e')
noextract=("${pkgname}-${pkgver}.deb")

prepare() {
    mkdir -pv ${srcdir}/${pkgname}-${pkgver}
    bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.deb" --numeric-owner -C "${srcdir}/${pkgname}-${pkgver}"
}

package() {
    bsdtar -xf "${srcdir}/${pkgname}-${pkgver}/data.tar.xz" --numeric-owner -C "${pkgdir}"

    chown -R root:root "${pkgdir}"

    cd ${pkgdir}/

    install -dvm755 usr/bin \
        opt/115

    mv usr/local/115Browser opt/115 && rm -rf usr/local

    sed -i 's|/usr/local|/opt/115|g' usr/share/applications/115Browser.desktop
    sed -i 's|/usr/local|/opt/115|g' opt/115/115Browser/115.sh
    ln -sf "/opt/115/115Browser/115.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"

    chmod 755 usr/share/applications/115Browser.desktop
}
