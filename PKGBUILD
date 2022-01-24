# Maintainer: taotieren <admin@taotieren.com>

pkgname=uconfig
_pkgname=uConfig
pkgver=0.4
pkgrel=2
pkgdesc="Datasheet pinout extractor from PDF and library Stylizer for Kicad."
arch=('any')
url="https://github.com/Robotips/uConfig"
license=('GPL3')
provides=(${pkgname})
conflicts=(${pkgname}  ${pkgname}-git)
#replaces=(${pkgname})
depends=(poppler)
makedepends=('qt5-tools')
backup=()
options=('!strip')
# install=${pkgname}.install
source=("${_pkgname}-${pkgver}.zip::${url}/archive/refs/tags/v${pkgver}.zip")
sha256sums=('c60c81a0e1f5b1a620733dfbbbfa282480c75dbd8dede1e39126d9900d5925aa')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}/src/
    qmake
    make
}

package() {
    install -dm755 "${pkgdir}/usr/bin/" \
                   "${pkgdir}/usr/lib/"

    cd ${srcdir}/${_pkgname}-${pkgver}/
    cp -P --preserve=links bin/lib*.so.*  "${pkgdir}/usr/lib/"

    install -Dm0644 "${srcdir}/${_pkgname}-${pkgver}/src/uconfig_gui/img/${_pkgname}.ico" "${pkgdir}/usr/share/pixmaps/${pkgname}_gui.ico"
    install -Dm0755 "${srcdir}/${_pkgname}-${pkgver}/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm0755 "${srcdir}/${_pkgname}-${pkgver}/bin/${pkgname}_gui" "${pkgdir}/usr/bin/${pkgname}_gui"

    install -Dm0644 /dev/stdin "${pkgdir}/usr/share/applications/${pkgname}_gui.desktop" << EOF
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
