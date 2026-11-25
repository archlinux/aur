# Maintainer: Ethan Stokes <erstokes10@gmail.com>
# Rendered from packaging/aur/blockwork-bin/PKGBUILD.in in Blockworked/Blockwork by .github/workflows/aur.yml.

pkgname=blockwork-bin
pkgver=0.6.5
pkgrel=1
pkgdesc='Build keyboard and mouse macros by snapping blocks together (prebuilt, bundles its own Qt)'
url='https://blockworked.com'
arch=('x86_64' 'aarch64')
license=('GPL-3.0-only')
depends=('glibc' 'gcc-libs' 'fontconfig' 'freetype2' 'libglvnd' 'libxkbcommon' 'dbus' 'hicolor-icon-theme')
optdepends=('tesseract: text recognition blocks'
            'grim: screen blocks on wlroots desktops'
            'kdotool: window blocks on KDE Plasma')
provides=('blockwork' 'macros')
conflicts=('blockwork' 'blockwork-git' 'macros')
options=('!strip' '!debug')
_repo=https://github.com/Blockworked/Blockwork
source=("LICENSE-$pkgver::https://raw.githubusercontent.com/Blockworked/Blockwork/$pkgver/LICENSE"
        "60-blockwork-uinput.rules-$pkgver::https://raw.githubusercontent.com/Blockworked/Blockwork/$pkgver/packaging/linux/60-blockwork-uinput.rules"
        "metainfo-$pkgver.xml::https://raw.githubusercontent.com/Blockworked/Blockwork/$pkgver/res/com.blockworked.Blockwork.metainfo.xml")
source_x86_64=("blockwork-$pkgver-x86_64.AppImage::$_repo/releases/download/$pkgver/blockwork-linux-x86_64.AppImage")
source_aarch64=("blockwork-$pkgver-aarch64.AppImage::$_repo/releases/download/$pkgver/blockwork-linux-arm64.AppImage")
noextract=("blockwork-$pkgver-$CARCH.AppImage")
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            '208792027d8ad6017e501d77bef37b710243178ed434f3d3d5c92e1a25edf200'
            'da86846a4f910166154cb359f00bd2f1e5469dc4c5e28923a9fc606ef8250677')
sha256sums_x86_64=('3f92f56cecf2b1493075b5f3d03931cf0bcd4b119cab5e7c7700090492e1bfe0')
sha256sums_aarch64=('f3f5d79df553af7c05016475164dcf9c666ecf069073c58ace58e689daeff7f1')

prepare() {
    rm -rf squashfs-root
    chmod +x "blockwork-$pkgver-$CARCH.AppImage"
    "./blockwork-$pkgver-$CARCH.AppImage" --appimage-extract >/dev/null
}

package() {
    # The AppImage's own tree (Qt included); its RPATHs are relative.
    install -d "$pkgdir/opt/blockwork"
    cp -a squashfs-root/usr/. "$pkgdir/opt/blockwork/"
    chmod -R u+rwX,go+rX,go-w "$pkgdir/opt/blockwork"
    install -d "$pkgdir/usr/bin"
    ln -s /opt/blockwork/bin/blockwork "$pkgdir/usr/bin/blockwork"

    install -Dm644 squashfs-root/blockwork.desktop "$pkgdir/usr/share/applications/com.blockworked.Blockwork.desktop"
    install -Dm644 "metainfo-$pkgver.xml" "$pkgdir/usr/share/metainfo/com.blockworked.Blockwork.metainfo.xml"
    install -Dm644 squashfs-root/blockwork.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/blockwork.png"
    install -Dm644 "60-blockwork-uinput.rules-$pkgver" "$pkgdir/usr/lib/udev/rules.d/60-blockwork-uinput.rules"
    echo uinput | install -Dm644 /dev/stdin "$pkgdir/usr/lib/modules-load.d/blockwork-uinput.conf"
    install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
