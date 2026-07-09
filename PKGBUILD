pkgname=oranglauncher-bin
pkgver=7.0.0
pkgrel=1
pkgdesc="Orange Launcher for Arch Linux (prebuilt binary)"
arch=(x86_64)
url="https://oranges.lt"
license=('MIT')
depends=(glibc webkit2gtk-4.1 gtk3 python-gobject)
provides=(oranglauncher)
conflicts=(oranglauncher)
source=("https://github.com/Orang-Studio/OrangLaunch/releases/download/7.0.0-Linux/launcher_x64_linux_7.0.0.tar.gz"
        "oranglauncher.desktop"
        "orange.png"
        "LICENSE"
        "oranglauncher-mime.xml")
sha256sums=('dd6d6ff3ac1a2b5d84be533add51aa7f1b44e5345ee4f1e849e5d922c5505e25'
            '23d8bec255eee86f4843603b5e46d1dada47ce30b05efb79fa1dd0ec4e781df0'
            'ddbe0ca155b67fcfc1fecdba1cbc6a3aac5a2011316bbb4a222e1f48f8987968'
            '3c8133c78d2e468f22643e465f8abcf4404742dc1b80c5eb64742039d70c5afa'
            '2d0cdbad857e3b7fe79c41f981a89ad1c595d54e43884b3fd5d89892ec0bf07c')

options=(!debug)

package() {
    install -d "$pkgdir/usr/lib/oranglauncher"
    install -d "$pkgdir/usr/bin"
    install -d "$pkgdir/usr/share/applications"
    install -d "$pkgdir/usr/share/icons/hicolor/256x256/apps"
    tar -xzf "$srcdir/launcher_x64_linux_${pkgver}.tar.gz" -C "$pkgdir/usr/lib/oranglauncher"
    chmod -R a+rX "$pkgdir/usr/lib/oranglauncher"
    find "$pkgdir/usr/lib/oranglauncher" -type d -exec chmod 0755 {} +
    find "$pkgdir/usr/lib/oranglauncher" -type f -perm /111 -exec chmod 0755 {} +
    find "$pkgdir/usr/lib/oranglauncher" -type f ! -perm /111 -exec chmod 0644 {} +
    ln -s /usr/lib/oranglauncher/launcher.bin "$pkgdir/usr/bin/oranglauncher"
    install -Dm644 "$srcdir/oranglauncher.desktop" "$pkgdir/usr/share/applications/oranglauncher.desktop"
    sed -i "s|Exec=.*|Exec=/usr/bin/oranglauncher %f|g" "$pkgdir/usr/share/applications/oranglauncher.desktop"
    sed -i "s|Icon=.*|Icon=/usr/share/icons/hicolor/256x256/apps/oranglauncher.png|g" "$pkgdir/usr/share/applications/oranglauncher.desktop"
    install -Dm644 "$srcdir/orange.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/oranglauncher.png"
    install -Dm644 "$srcdir/oranglauncher-mime.xml" "$pkgdir/usr/share/mime/packages/oranglauncher.xml"

    for user in $(ls /home); do
        desktop_dir="/home/$user/Desktop"
        if [ -d "$desktop_dir" ]; then
            cp -f "$pkgdir/usr/share/applications/oranglauncher.desktop" "$desktop_dir/oranglauncher.desktop"
            chown "$user":"$user" "$desktop_dir/oranglauncher.desktop"
            chmod 644 "$desktop_dir/oranglauncher.desktop"
        fi
    done
}
