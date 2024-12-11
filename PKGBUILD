# Maintainer: taotieren <admin@taotieren.com>

pkgbase=115-browser-bin
pkgname=115-browser-bin
_pkgname=115br
pkgver=27.0.7.5
pkgrel=2
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
license=('Commercial')
url="https://115.com/product_browser"
source_x86_64=("${pkgname}-${pkgver}.deb::https://down.115.com/client/115pc/lin/115br_v${pkgver}.deb")
sha256sums_x86_64=('5839cde63c90fd1b598d17992cadc481aa5f53bff86ea322a47c3987426b3c2d')
noextract=("${pkgname}-${pkgver}.deb")

prepare() {
    mkdir -pv ${srcdir}/${pkgname}-${pkgver}
    bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.deb" --numeric-owner -C "${srcdir}/${pkgname}-${pkgver}"
}

package() {
    bsdtar -xf "${srcdir}/${pkgname}-${pkgver}/data.tar.xz" --numeric-owner -C "${pkgdir}"

    find "${pkgdir}/usr" -type d -exec chmod 755 {} +
    chown -R root:root "${pkgdir}"

    cd ${pkgdir}/

    install -dvm755 usr/bin \
        opt/115

    mv usr/local/115Browser opt/115 && rm -rf usr/local

    sed -i 's|/usr/local|/opt/115|g' usr/share/applications/115Browser.desktop
    sed -i 's|/usr/local|/opt/115|g' opt/115/115Browser/115.sh
    ln -sf "/opt/115/115Browser/115.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
}
