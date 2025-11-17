# Maintainer: Maki <maki@hotmilk.space>

pkgname=quiet-desktop-bin
pkgver=6.3.0
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
    "e5a195a486fb02cc9c31c2f7be7f8dea545ef1fb46a3f74457efb8081f2bcc3e02ce13b9b4d26fd6b587a0f4fa81dfd936bd3a773735156dd200b8786a8ee17f"
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

    # disable updates
    rm -f "$pkgdir$_install_path/resources/app-update.yml"

    # update desktop file
    sed -i -E "s|Exec=.+$|Exec=/usr/bin/quiet-desktop|" "$pkgdir$_install_path/@quietdesktop.desktop"

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
