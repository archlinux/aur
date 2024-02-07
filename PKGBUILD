# Maintainer: Csubee <csubee@csubee.hu>
# Contributor: Neptune <neptune650@proton.me>
# Contributor: Polarian <polarian@polarian.dev>
# Contributor: Saghm Rossi <aur@saghm.com>

pkgname=curseforge-appimage
pkgver=0.244.4.16117
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
sha256sums=('21a65bc67afe04ef6245a0e7c77b504e3a33afce196c455c3a8ec8a518a392fb'
            '7ab749b52d805e828b3d30276e96ae4ab3bc56c3882b505a7732ee3f6e8eff95'
            '135c7ffeb81f4a7ee95a5879651b679e0d1ef9d13c7aa7c262386ad97b48d62f')

prepare() {
    mv ./build/CurseForge-*.AppImage CurseForge.AppImage
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
