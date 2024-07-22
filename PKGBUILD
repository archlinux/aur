# Maintainer: Your Name <your.email@example.com>

pkgname=vbox-office-launcher-git
pkgver=0.1.1
pkgrel=1
pkgdesc="A tool for launching Microsoft Office applications in a VirtualBox environment"
arch=('any')
url="https://github.com/Gunther-Schulz/vbox-office-launcher"
license=('unknown')
depends=('bash' 'virtualbox')
optdepends=('dunst: for desktop notifications'
            'wmctrl: for window management')
makedepends=('git')
source=("git+https://github.com/Gunther-Schulz/vbox-office-launcher.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --long --tags 2>/dev/null || printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/vbox-office-launcher"
    
    # Install the main script
    install -Dm755 vbox_office_launcher.sh "$pkgdir/usr/bin/vbox-office-launcher"
    
    # Install the sample config file
    install -Dm644 vbox_office_launcher.conf.sample "$pkgdir/etc/vbox_office_launcher.conf.sample"
    
    # Install and update the desktop file
    sed -i 's|Exec=.*|Exec=/usr/bin/vbox-office-launcher %f|' open-office-in-vm.desktop
    install -Dm644 open-office-in-vm.desktop "$pkgdir/usr/share/applications/open-office-in-vm.desktop"
    
    # Install README
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}