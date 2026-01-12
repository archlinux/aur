pkgname=oranglauncher-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Orange Launcher for Arch Linux"
arch=(x86_64)
url="https://oranges.lt"
license=('MIT')
depends=(glibc)
provides=(oranglauncher)
conflicts=(oranglauncher)
source=("https://github.com/adasjusk/OrangLaunch/releases/download/1.0-Linux/launcher_x64_linux.tar.gz"
        "oranglauncher.desktop"
        "orange.png"
        "LICENSE")
sha256sums=('e197c03e8cb9d5186d584fef735eb41b7258d5e3d722322d773b5d92b76de1ff' '5fbe96d3f3d3d01a91693edf1544701d2da46b7f07d5d037495371e96bae8bf4' 'ddbe0ca155b67fcfc1fecdba1cbc6a3aac5a2011316bbb4a222e1f48f8987968' '3c8133c78d2e468f22643e465f8abcf4404742dc1b80c5eb64742039d70c5afa')

package() {
    install -d "$pkgdir/usr/lib/oranglauncher"
    install -d "$pkgdir/usr/bin"
    install -d "$pkgdir/usr/share/applications"
    install -d "$pkgdir/usr/share/icons/hicolor/256x256/apps"

    tar -xzf "$srcdir/launcher_x64_linux.tar.gz" -C "$pkgdir/usr/lib/oranglauncher"

    ln -s /usr/lib/oranglauncher/launcher.bin "$pkgdir/usr/bin/oranglauncher"

    install -Dm644 "$srcdir/oranglauncher.desktop" "$pkgdir/usr/share/applications/oranglauncher.desktop"
    sed -i "s|Exec=.*|Exec=/usr/bin/oranglauncher|g" "$pkgdir/usr/share/applications/oranglauncher.desktop"
    sed -i "s|Icon=.*|Icon=/usr/share/icons/hicolor/256x256/apps/oranglauncher.png|g" "$pkgdir/usr/share/applications/oranglauncher.desktop"

    install -Dm644 "$srcdir/orange.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/oranglauncher.png"

    for user in $(ls /home); do
        desktop_dir="/home/$user/Desktop"
        if [ -d "$desktop_dir" ]; then
            cp -f "$pkgdir/usr/share/applications/oranglauncher.desktop" "$desktop_dir/oranglauncher.desktop"
            chown "$user":"$user" "$desktop_dir/oranglauncher.desktop"
            chmod 644 "$desktop_dir/oranglauncher.desktop"
        fi
    done
}
