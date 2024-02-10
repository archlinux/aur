# Maintainer: Neptune <neptune650@proton.me>
# Contributor: Polarian <polarian@polarian.dev>
# Contributor: Saghm Rossi <aur@saghm.com>

pkgname=curseforge
pkgver=0.244.4.r16117
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
sha512sums=('SKIP'
            'ef669b9423f685dc50f7d4db487fde5c4708ee3991517c3f6a28c0417368ffd9f0ba982e183471cef27e376bbb4f7c18c80eeb76dd189dc591e994049c421ddb'
            '0d6fbcdaa8366742356118134251cb10dba592282f83dc8cf8ecb755a64622e67af6577300507590245b674e5628cb7bf845a06f5fa65ddf657ebef9c09bed03')

pkgver() {
    find ./build/CurseForge* | sed 's!build/!!g' | sed 's/\.\///g' | sed 's/CurseForge-\(.*\).AppImage/\1/' | sed 's/-/.r/g'
}

package() {
    mv build/CurseForge-*.AppImage CurseForge.AppImage
    chmod +x CurseForge.AppImage
    ./CurseForge.AppImage --appimage-extract >/dev/null
    sed -i 's/Exec=.*/Exec=\/usr\/bin\/curseforge %U/' squashfs-root/curseforge.desktop

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
