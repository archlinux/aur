# Maintainer: Your Name <your.email@example.com>

pkgname=vbox-office-launcher-git
pkgver=0.2.0
pkgrel=1
pkgdesc="A tool for launching Windows applications in a VirtualBox environment"
arch=('any')
url="https://github.com/Gunther-Schulz/vbox-app-launcher"
license=('unknown')
depends=('bash' 'virtualbox')
optdepends=('dunst: for desktop notifications'
            'wmctrl: for window management')
makedepends=('git')
source=("git+https://github.com/Gunther-Schulz/vbox-windows-app-launcher.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --long --tags 2>/dev/null || printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/vbox-windows-app-launcher"
    
    # Install the main script
    install -Dm755 vbox_windows_app_launcher.sh "$pkgdir/usr/bin/vbox-windows-app-launcher"
    
    # Install the sample config file to ~/.config/
    install -Dm644 vbox_windows_app_launcher.conf.sample "$pkgdir/etc/skel/.config/vbox_windows_app_launcher/vbox_windows_app_launcher.conf.sample"
    
    # Install and update the desktop file
    sed -i 's|Exec=.*|Exec=/usr/bin/vbox-windows-app-launcher %f|' open-windows-app-in-vm.desktop
    install -Dm644 open-windows-app-in-vm.desktop "$pkgdir/usr/share/applications/open-windows-app-in-vm.desktop"
    
    # Install README
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    }