# Maintainer: Your Name <your.email@example.com>

pkgname=vbox-windows-app-launcher-git
pkgver=0.1.7
pkgrel=2
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

    # Install the sample config file to ~/.config/
    install -Dm644 vbox_windows_app_launcher.conf.sample "$pkgdir/etc/skel/.config/${pkgname%-git}/${pkgname%-git}.conf.sample"

    # Install and update the desktop file
    sed -i "s|Exec=.*|Exec=/usr/bin/${pkgname%-git} %f|" open-windows-app-in-vm.desktop
    install -Dm644 open-windows-app-in-vm.desktop "$pkgdir/usr/share/applications/open-windows-app-in-vm.desktop"

    # Install README
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
