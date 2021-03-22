# Maintainer: zhullyb <zhullyb [at] outlook dot com>

pkgname=wolai-bin
_pkgname=wolai
pkgver=1.0.34
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
md5sums=("16f245da6f00148643a2ce60e49bb29d"
         "711f08ded488ab4572df3cae9715ae14")
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
    mv usr/lib/libappindicator.so.1 ${pkgdir}/usr/lib
    mv usr/lib/libindicator.so.7 ${pkgdir}/usr/lib
    rm -r usr/ ${_pkgname}.desktop ${_pkgname}.png
    
    mkdir -p ${pkgdir}/opt/${_pkgname}
    mv * ${pkgdir}/opt/${_pkgname}
    chmod -R 777 ${pkgdir}/opt/${_pkgname}
    
    mkdir ${pkgdir}/usr/bin
    mv ${srcdir}/start.sh ${pkgdir}/usr/bin/${_pkgname}
    chmod a+x ${pkgdir}/usr/bin/${_pkgname}
} 
 
