# Maintainer: taotieren <admin@taotieren.com>

pkgname=uconfig
_pkgname=uConfig
pkgver=0.4
pkgrel=14
pkgdesc="Datasheet pinout extractor from PDF and library Stylizer for KiCad."
arch=($CARCH)
url="https://github.com/Robotips/uConfig"
license=('GPL-3.0-only')
provides=(${pkgname})
conflicts=(${pkgname} ${pkgname}-git)
#replaces=(${pkgname})
depends=(poppler)
makedepends=(qt5-tools
    poppler-qt5)
backup=()
options=()
# install=${pkgname}.install
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8075aac170c7864adfeea355fe6340ae488c52986dbccfde67fce548abd48888')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}/src/
    qmake
    make
}

package() {
    install -dm755 "${pkgdir}/usr/bin/" \
        "${pkgdir}/usr/lib/"

    cd ${srcdir}/${_pkgname}-${pkgver}/
    cp -P --preserve=links bin/lib*.so.* "${pkgdir}/usr/lib/"

    install -Dm0644 "${srcdir}/${_pkgname}-${pkgver}/src/uconfig_gui/img/${_pkgname}.ico" "${pkgdir}/usr/share/pixmaps/${pkgname}_gui.ico"
    install -Dm0755 "${srcdir}/${_pkgname}-${pkgver}/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm0755 "${srcdir}/${_pkgname}-${pkgver}/bin/${pkgname}_gui" "${pkgdir}/usr/bin/${pkgname}_gui"

    install -Dm0644 /dev/stdin "${pkgdir}/usr/share/applications/${pkgname}_gui.desktop" <<EOF
[Desktop Entry]
Name=${pkgname}
Name[zh_CN]=${_pkgname}
Comment=${pkgdesc}
Exec=${pkgname}_gui
Type=Application
StartupNotify=true
Categories=Tool;Electron;PCB;
Terminal=false
Icon=${pkgname}_gui.ico
Version=${pkgver}
EOF

}
