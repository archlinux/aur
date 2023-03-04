# Maintainer: Saghm Rossi <aur@saghm.com>
pkgname=curseforge
pkgver=0.218.1_8238
pkgrel=2
pkgdesc="CurseForge desktop client for Linux"
arch=('x86_64')
depends=("fuse2")
url="https://download.curseforge.com/"
source=("$pkgname-$pkgver.zip::https://curseforge.overwolf.com/downloads/curseforge-latest-linux.zip"
        'curseforge'
)
options=(!strip)
sha512sums=('1bcdf7eaf38b133776114bca4d4ae36d41fa578be887191da27fe4d3208f6bda332de7ddbfeb0e025ec69c78ac1f59a9ea8004ea587e4b02a37aa8d35e3104d4'
            'ef669b9423f685dc50f7d4db487fde5c4708ee3991517c3f6a28c0417368ffd9f0ba982e183471cef27e376bbb4f7c18c80eeb76dd189dc591e994049c421ddb')

prepare() {
    mv CurseForge-*.AppImage CurseForge.AppImage
    chmod +x CurseForge.AppImage
    ./CurseForge.AppImage --appimage-extract >/dev/null
    sed -i 's/Exec=.*/Exec=\/usr\/bin\/curseforge %U/' squashfs-root/curseforge.desktop
}

package() {
    install -Dm755 "CurseForge.AppImage" "${pkgdir}/opt/$pkgname/CurseForge.AppImage"
    install -Dm755 "curseforge" "${pkgdir}/usr/bin/curseforge"
    install -dm755 "${pkgdir}/usr/share/applications/"
    install -dm755 "${pkgdir}/usr/share/icons"
    install -dm755 "${pkgdir}/usr/share/licenses"
    install -dm755 "${pkgdir}/usr/share/licenses/curseforge"

    cp -r --no-preserve=mode,ownership "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share"
    cp --no-preserve=mode,ownership "${srcdir}/squashfs-root/curseforge.desktop" "${pkgdir}/usr/share/applications/"
    cp --no-preserve=mode,ownership "${srcdir}/squashfs-root/LICENSE.electron.txt" "${pkgdir}/usr/share/licenses/curseforge"
    cp --no-preserve=mode,ownership "${srcdir}/squashfs-root/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/curseforge"
}
