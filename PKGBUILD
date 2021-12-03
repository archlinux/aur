# Maintainer: zhullyb <zhullyb [at] outlook dot com>

pkgname=wolai-bin
_pkgname=wolai
pkgver=1.1.3
pkgrel=2
pkgdesc="wolai"
arch=("x86_64")
url="https://www.wolai.com/"
license=('Custom')
depends=("gconf" "libnotify" "libxss" "libxtst" "electron13")
makedepends=("asar")
provides=('wolai')
options=(!strip)
source=("https://cdn.wostatic.cn/dist/installers/wolai-${pkgver}.AppImage"
        "start.sh")
md5sums=('2009b325318debf120fb99c1019bd117'
         '464b6d4557b2ebc66667f1b8b3f05b57')
_filename=${_pkgname}-${pkgver}.AppImage

prepare() {
    cd "${srcdir}"
    chmod +x ${_filename}
    ./${_filename} --appimage-extract
    sed -i "s|^Exec=AppRun|Exec=wolai %U|g" "squashfs-root/${_pkgname}.desktop"

    asar extract ${srcdir}/squashfs-root/resources/app.asar ${srcdir}/new_app
    mv  ${srcdir}/squashfs-root/resources/app-update.yml ${srcdir}/new_app/dev-app-update.yml
    asar pack ${srcdir}/new_app ${srcdir}/squashfs-root/resources/app.asar
}

package() {
    cd ${srcdir}/squashfs-root
    install -Dm644 ${srcdir}/squashfs-root/${_pkgname}.png ${pkgdir}/usr/share/icons/${_pkgname}.png
    install -Dm644 ${srcdir}/squashfs-root/${_pkgname}.desktop ${pkgdir}/usr/share/applications/${_pkgname}.desktop

    mkdir -p ${pkgdir}/usr/lib/${_pkgname}
    mv ${srcdir}/squashfs-root/usr/lib/{libappindicator.so.1,libindicator.so.7} ${pkgdir}/usr/lib/${_pkgname}/
    install -Dm644 ${srcdir}/squashfs-root/resources/app.asar ${pkgdir}/usr/lib/${_pkgname}/resources/app.asar

    chmod 644 -R ${srcdir}/squashfs-root/resources/assets/
    chmod 755 ${srcdir}/squashfs-root/resources/assets/
    chmod 755 ${srcdir}/squashfs-root/resources/assets/icons/
    mv ${srcdir}/squashfs-root/resources/assets/ ${pkgdir}/usr/lib/${_pkgname}/resources/

    mkdir -p ${pkgdir}/usr/bin
    install -Dm755 ${srcdir}/start.sh ${pkgdir}/usr/bin/wolai
} 
 
