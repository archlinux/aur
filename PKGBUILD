pkgname=oranglauncher-bin
pkgver=5.1
pkgrel=5
pkgdesc="Orange Launcher for Arch Linux"
arch=(x86_64)
url="https://oranges.lt"
license=('MIT')
depends=(glibc webkit2gtk-4.1)
provides=(oranglauncher)
conflicts=(oranglauncher)
source=("https://github.com/Orang-Studio/OrangLaunch/releases/download/${pkgver}-Both/launcher_x64_linux_${pkgver}.tar.gz"
        "oranglauncher.desktop"
        "orange.png"
        "LICENSE")
sha256sums=('0474d65d3a12310aef63c367e4a41a1549ee66fbaf9cd0705f4b92d660e7cca1'
            '8ce3b336dbf9739d9bd5fc0278b19f10c7539e23f05f399e288b2d267ec4e78a'
            'ddbe0ca155b67fcfc1fecdba1cbc6a3aac5a2011316bbb4a222e1f48f8987968'
            '3c8133c78d2e468f22643e465f8abcf4404742dc1b80c5eb64742039d70c5afa')

options=(!debug)

package() {
    install -d "$pkgdir/usr/lib/oranglauncher"
    install -d "$pkgdir/usr/bin"
    install -d "$pkgdir/usr/share/applications"
    install -d "$pkgdir/usr/share/icons/hicolor/256x256/apps"
    tar -xzf "$srcdir/launcher_x64_linux_${pkgver}.tar.gz" -C "$pkgdir/usr/lib/oranglauncher"
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
