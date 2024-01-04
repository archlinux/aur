# Maintainer: tioguda <guda.flavio@gmail.com>

pkgbase=shodo
pkgname=${pkgbase}
pkgver=1.2.0
pkgrel=1
arch=('any')
pkgdesc="Assinador fornecido pela Justiça do Trabalho para realizar assinaturas digitais no PJe"
url="https://pje.csjt.jus.br/manual/index.php/Shodo"
license=('custom')
makedepends=('imagemagick')
depends=('java-runtime=8')
install=${pkgname}.install

source=("${pkgname}-${pkgver}.jar::https://pje.trt8.jus.br/shodo/shodo.jar"
        "${pkgbase}.png"
        "${pkgbase}")
sha256sums=('653fa7dd1e07d941bae7e431675cac44a455b5a285b5ee64f3f8a796371e5c5e'
            '68c1fa6b45b21fd1a8df30338a957b4657257ab9c8bc456a5873f8a589de9f41'
            'cc1f6d2470a6a77044f89b3f1c6d4b67d4e94746682a85851e754dfb0ebd29ed')

noextract=("${pkgname}-${pkgver}.jar")

_shodo_desktop="[Desktop Entry]
Version=1.0
Terminal=false
Type=Application
Name=Shodõ - Assinador Digital
Comment=Assinador fornecido pela Justiça do Trabalho para realizar assinaturas digitais no PJe
Exec=${pkgbase}
Icon=${pkgbase}
Categories=Utility;
StartupWMClass=br-jus-csjt-assinadorjt-Main"

build() {
    cd "${srcdir}"
    echo -e "$_shodo_desktop" | tee "${pkgbase}.desktop"
}

package() {
    mkdir -p "${pkgdir}/opt/${pkgname}"
    cd ${srcdir}

    install -Dm 755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm 755 "${pkgname}-${pkgver}.jar" "${pkgdir}/opt/${pkgname}/${pkgname}.jar"
    install -Dm 644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm 644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    for size in 22 24 32 48 64 128; do
        mkdir -p "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps"
        convert "${srcdir}/${pkgname}.png" -resize "${size}x${size}" \
            "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${pkgname}.png"
    done
}
