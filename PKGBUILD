# Maintainer: Maki <maki@hotmilk.space>

pkgname=quiet-desktop-bin
pkgver=2.3.0
pkgrel=1
pkgdesc="A private, p2p alternative to Slack and Discord built on Tor & IPFS"
url="https://github.com/TryQuiet/quiet"
arch=("x86_64")
license=("GPL-3.0-only")

# depends=("fuse2") # we're extracting so we don't need this
options=(!strip)

_filename="Quiet-$pkgver.AppImage"

source=(
	"https://github.com/TryQuiet/quiet/releases/download/@quiet/desktop@$pkgver/$_filename"
	"https://raw.githubusercontent.com/TryQuiet/quiet/$pkgver/LICENSE.md"
)

sha512sums=(
    "c0879d6a197ba4cd1db025adb2dea68d2922a39c948f7cafa63676c2e08351b19cd02a3f272c6e149485fd0d739cf66f7854fb0261b204c26abe59f5510b5f33"
    "d361e5e8201481c6346ee6a886592c51265112be550d5224f1a7a6e116255c2f1ab8788df579d9b8372ed7bfd19bac4b6e70e00b472642966ab5b319b99a2686"
)

_install_name="quiet-desktop"
_install_path="/opt/$_install_name"

package() {
    # extract AppImage
    chmod +x "$_filename"
    ./$_filename --appimage-extract &>/dev/null

    # copy files to pkgdir
    mkdir -p "$pkgdir$_install_path"
    cp -r squashfs-root/. "$pkgdir$_install_path"

    # update desktop file
    sed -i -E "s|Exec=AppRun|Exec=env APPDIR=$_install_path $_install_path/AppRun|" "$pkgdir$_install_path/@quietdesktop.desktop"

    # move desktop file
    mkdir -p "$pkgdir/usr/share/applications"
    mv "$pkgdir$_install_path/@quietdesktop.desktop" "$pkgdir/usr/share/applications/$_install_name.desktop"

    # create link to executable
    mkdir -p "$pkgdir/usr/bin"
    ln -s "$_install_path/AppRun" "$pkgdir/usr/bin/$_install_name"

    # move icon
    mv "$pkgdir$_install_path/usr/share/icons" "$pkgdir/usr/share"
    rm -rf "$pkgdir$_install_path/usr/share" # nothing else in here
    rm -f "$pkgdir$_install_path/.DirIcon" # invalid symbolic link
    rm -f "$pkgdir$_install_path/@quietdesktop.png" # invalid symbolic link

    # fix icon
    mv "$pkgdir/usr/share/icons/hicolor/0x0" "$pkgdir/usr/share/icons/hicolor/512x512"

    # move license
    install -Dm644 "LICENSE.md" "$pkgdir/usr/share/licenses/$_install_name/LICENSE"
}
