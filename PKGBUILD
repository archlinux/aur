# Maintainer: Iliya Aghamajidi <dozheiny@gmail.com>
pkgname=barghman-git
pkgver=v1.0.0
pkgrel=1
pkgdesc="A service that fetches Iran electricity blackout schedules and emails it as calendar (ICS) files."
arch=('x86_64' 'aarch64')
url="https://github.com/dozheiny/barghman"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')
#install=$pkgname.install

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"
    make build
}

package() {
    cd "$pkgname"
    
    make install \
        BIN_PATH="$pkgdir/usr/bin" \
        MAN_PATH="$pkgdir/usr/share/man/man1" \
        CONFIG_PATH="$pkgdir/usr/share/$pkgname" \
        SYSTEMD_PATH="$pkgdir/usr/lib/systemd/user" \
        CACHE_PATH="$pkgdir/usr/share/$pkgname"
    
    mv "$pkgdir/usr/share/$pkgname/config.toml" "$pkgdir/usr/share/$pkgname/config.toml.example" 2>/dev/null || true
}

post_install() {
    echo "==> barghman has been installed!"
    echo ""
    echo "To set up barghman for your user account, run the following commands:"
    echo ""
    echo "  # Create directories"
    echo "  mkdir -p ~/.config/barghman ~/.config/systemd/user ~/.cache/barghman"
    echo ""
    echo "  # Copy example config"
    echo "  cp /usr/share/barghman/config.toml.example ~/.config/barghman/config.toml"
    echo ""
    echo "  # Install systemd service"
    echo "  cp /usr/lib/systemd/user/barghman.service ~/.config/systemd/user/"
    echo "  systemctl --user daemon-reload"
    echo "  systemctl --user enable barghman.service"
    echo ""
}

post_upgrade() {
    echo "==> barghman has been upgraded!"
    echo ""
    echo "If you have the systemd service running, restart it:"
    echo "  systemctl --user restart barghman.service"
    echo ""
    echo "Check /usr/share/barghman/config.toml.example for new configuration options."
    echo ""
}

pre_remove() {
    if command -v systemctl >/dev/null 2>&1; then
        if systemctl --user is-active --quiet barghman.service 2>/dev/null; then
            systemctl --user stop barghman.service
        fi
        
        if systemctl --user is-enabled --quiet barghman.service 2>/dev/null; then
            systemctl --user disable barghman.service
        fi
        
        systemctl --user daemon-reload 2>/dev/null || true
    fi
}

post_remove() {
    echo "==> barghman has been removed."
    echo ""
    echo "User configuration files remain in:"
    echo "  ~/.config/barghman/"
    echo "  ~/.cache/barghman/"
    echo "  ~/.config/systemd/user/barghman.service"
    echo ""
    echo "Remove these manually if desired."
}
