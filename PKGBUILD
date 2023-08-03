# Maintainer: Neptune <neptune650@proton.me>
# Contributor: Polarian <polarian@polarian.dev>
# Contributor: Saghm Rossi <aur@saghm.com>

pkgname=curseforge
pkgver=0.230.4.12055
pkgrel=1
pkgdesc="CurseForge desktop client for Linux"
arch=('x86_64')
depends=("fuse2")
url="https://curseforge.com/"
source=("$pkgname-$pkgver.zip::https://curseforge.overwolf.com/downloads/curseforge-latest-linux.zip"
        'curseforge'
        'LICENSE')
license=('custom:overwolf' 'MIT' 'custom:chromium-licenses')
options=(!strip)
# Skip checksum check for the CurseForge binary, to avoid breakage on updates
sha256sums=('SKIP'
            'dbb87d28bb55affc7e442c1b65db5d59d16a8e8322d99092a27c31cfa3eb98c4'
            '135c7ffeb81f4a7ee95a5879651b679e0d1ef9d13c7aa7c262386ad97b48d62f')

prepare() {
    mv CurseForge-*.AppImage CurseForge.AppImage
    chmod +x CurseForge.AppImage
    ./CurseForge.AppImage --appimage-extract >/dev/null
    sed -i 's/Exec=.*/Exec=\/usr\/bin\/curseforge %U/' squashfs-root/curseforge.desktop
}

package() {
    install -Dm755 "CurseForge.AppImage" "${pkgdir}/opt/$pkgname/CurseForge.AppImage"
    install -Dm755 "curseforge" "${pkgdir}/usr/bin/curseforge"
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/CURSEFORGE-LICENSE
    install -dm755 "${pkgdir}/usr/share/applications/"
    install -dm755 "${pkgdir}/usr/share/icons"

    cp -r --no-preserve=mode,ownership "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share"
    cp --no-preserve=mode,ownership "${srcdir}/squashfs-root/curseforge.desktop" "${pkgdir}/usr/share/applications/"
    cp --no-preserve=mode,ownership "${srcdir}/squashfs-root/LICENSE.electron.txt" "${pkgdir}/usr/share/licenses/curseforge"
    cp --no-preserve=mode,ownership "${srcdir}/squashfs-root/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/curseforge"
}
