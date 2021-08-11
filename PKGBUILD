# Maintainer: zhullyb <zhullyb [at] outlook dot com>

pkgname=wolai-bin
_pkgname=wolai
pkgver=1.1.2
pkgrel=1
pkgdesc="wolai"
arch=("x86_64")
url="https://www.wolai.com/"
license=('Custom')
depends=("gconf" "libnotify" "libxss" "libxtst")
provides=('wolai')
options=(!strip)
source=("https://static2.wolai.com/dist/installers/wolai-${pkgver}.AppImage"
        "start.sh")
md5sums=('70efc2811c2df5a553f04925335726ee'
         '0a949982a3b76ebe44048559cf382c2f')
_filename=${_pkgname}-${pkgver}.AppImage

prepare() {
    cd "${srcdir}"
    chmod +x ${_filename}
    ./${_filename} --appimage-extract
    sed -i "s|^Exec=AppRun|Exec=wolai %U|g" "squashfs-root/${_pkgname}.desktop"
}

package() {
    cd ${srcdir}/squashfs-root
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.png" "${pkgdir}/usr/share/icons/${_pkgname}.png"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    mkdir ${pkgdir}/usr/lib
    mkdir -p ${pkgdir}/opt/${_pkgname}
    mv usr/lib/libappindicator.so.1 ${pkgdir}/opt/${_pkgname}/
    mv usr/lib/libindicator.so.7 ${pkgdir}/opt/${_pkgname}/
    rm -r usr/ ${_pkgname}.desktop ${_pkgname}.png
    
    mv * ${pkgdir}/opt/${_pkgname}

    chmod 755 ${pkgdir}/opt/${_pkgname}/locales
    chmod 755 ${pkgdir}/opt/${_pkgname}/resources
    chmod 755 ${pkgdir}/opt/${_pkgname}/resources/assets
    chmod 755 ${pkgdir}/opt/${_pkgname}/resources/assets/icons
    chmod 755 ${pkgdir}/opt/${_pkgname}/swiftshader
    
    mkdir ${pkgdir}/usr/bin
    cp ${srcdir}/start.sh ${pkgdir}/usr/bin/${_pkgname}
    chmod a+x ${pkgdir}/usr/bin/${_pkgname}
} 
 
