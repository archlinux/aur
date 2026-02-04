# Maintainer: Your Name <your.email@example.com>

pkgname=vbox-windows-app-launcher-git
pkgver=0.1.8
pkgrel=1
pkgdesc="A tool for launching Windows applications in a VirtualBox environment with desktop integration."
arch=('any')
url="https://github.com/Gunther-Schulz/vbox-windows-app-launcher"
license=('unknown')
depends=('bash' 'virtualbox')
optdepends=('dunst: for desktop notifications'
            'wmctrl: for window management')
makedepends=('git')
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --tags --abbrev=0 | sed 's/^v//'
}

package() {
    cd "$srcdir/${pkgname%-git}"

    # Install the main script
    install -Dm755 vbox_windows_app_launcher.sh "$pkgdir/usr/bin/${pkgname%-git}"

    # Sample config in skel; script reads $XDG_CONFIG_HOME/vbox_windows_app_launcher.conf (default ~/.config/) at runtime
    install -Dm600 vbox_windows_app_launcher.conf.sample "$pkgdir/etc/skel/.config/${pkgname%-git}/${pkgname%-git}.conf.sample"

    # Install the desktop file (Exec uses bare command name; script is in /usr/bin on PATH)
    install -Dm644 open-windows-app-in-vm.desktop "$pkgdir/usr/share/applications/open-windows-app-in-vm.desktop"

    # Install README
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
