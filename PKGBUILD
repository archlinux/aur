# Maintainer: taotieren <admin@taotieren.com>

pkgbase=cloud-chromium
pkgname=cloud-chromium
_pkgname=115br
pkgver=35.1.0.5
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
pkgdesc="Chromium 115 Browser"
license=('Commercial')
url="https://115.com/product_browser"
source_x86_64=("${pkgname}-${pkgver}.deb::https://down.115.com/client/115pc/lin/115br_v${pkgver}.deb")
sha256sums_x86_64=('e11bccb33290e589f0ecf161d5f1a3fc5a2e61298d29e200acd8420f71d58bd1')
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
        opt/chromium

    mv usr/local/115Browser opt/chromium && rm -rf usr/local

    sed -i 's|/usr/local|/opt/chromium|g' usr/share/applications/115Browser.desktop
    rm usr/share/applications/115Browser.desktop
    sed -i 's|/usr/local|/opt/chromium|g' opt/chromium/115Browser/115.sh
    ln -sf "/opt/chromium/115Browser/115.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
}
