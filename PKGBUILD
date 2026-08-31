# Maintainer: taotieren <admin@taotieren.com>

pkgbase=115-life-bin
pkgname=115-life-bin
_pkgname=115Life
pkgver=37.2.3
pkgrel=1
arch=('x86_64')
options=(!strip !debug)
depends=(
    libgcc_s.so
    libstdc++.so
    hicolor-icon-theme
    zlib
)
makedepends=(
    libarchive
)
optdepends=(
    "115-browser: 115 Browser / 115 浏览器"
)
provides=(${pkgname%-bin})
conflicts=(${pkgname%-bin})
replaces=()
pkgdesc="115 Life / 115 生活"
license=('LicenseRef-scancode-commercial-license')
url="https://115.com"
# install=${pkgname}.install
source=(
    "https://115.com/privacy.html"
    "https://115.com/copyright.html"
)
source_x86_64=(
    "${pkgname}-${pkgver}.deb::https://down.115.com/client/115pc/lin/${_pkgname}_${pkgver}.deb"
)
sha256sums=('7a1c438a53cd10ad78b9ea150521f12e6d97e10cf07f07d38d4f0a65f22cafcf'
            'cfe25e4d5d8236b3b68089fbc4b56aaa7db1d0a560905f1faf004bc5e4534245')
sha256sums_x86_64=('922aa851f8b1d3df2fd4cac8b26f99f1635a8542d78f054630f8bdaa579e5487')
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

    mv "${pkgdir}/opt/115life" "${pkgdir}/opt/115"

    sed -i 's|/opt|/opt/115|g' "${pkgdir}/usr/share/applications/life115.desktop"
    ln -sf "/opt/115/115life/Life115" "${pkgdir}/usr/bin/${pkgname%-bin}"

    rm -rf ${pkgdir}/usr/bin/115life
    mv ${pkgdir}/usr/share/doc/115life ${pkgdir}/usr/share/doc/${pkgname}
    chmod 644 ${pkgdir}/usr/share/applications/life115.desktop
    install -vDm644 "${srcdir}/privacy.html" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -vDm644 "${srcdir}/copyright.html" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
