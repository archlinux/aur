# Maintainer: JD Flamm <superlama01@gmail.com>
pkgname=huion-keydial-mini-driver
pkgver=1.2.0
pkgrel=1
pkgdesc="User space driver for Huion Keydial Mini bluetooth device"
arch=('any')
url="https://github.com/Triforcey/huion-keydial-mini-uinput"
license=('MIT')
depends=(
    'python>=3.8'
    'python-evdev'
    'python-bleak'
    'python-click'
    'python-pyyaml'
    'python-dbus-next'
    'systemd'
    'bluez'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
provides=('huion-keydial-mini')
conflicts=('huion-keydial-mini')
source=("https://github.com/Triforcey/huion-keydial-mini-uinput/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('992203cf9eb2f9bcc274f37a4c796cdd6d260fec0766f5f03c0507f9cebdeb03')
options=(!strip !debug)


prepare() {
    tar -xf "v${pkgver}.tar.gz" -C "$srcdir"
}

build() {
    cd "$srcdir/huion-keydial-mini-uinput-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/huion-keydial-mini-uinput-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 "packaging/systemd/huion-keydial-mini-user.service" \
        "$pkgdir/usr/lib/systemd/user/huion-keydial-mini-user.service"
    install -Dm644 "packaging/udev/99-huion-keydial-mini.rules" \
        "$pkgdir/usr/lib/udev/rules.d/99-huion-keydial-mini.rules"
    install -Dm755 "packaging/udev/unbind-huion.sh" \
        "$pkgdir/usr/local/bin/unbind-huion.sh"
    install -Dm644 "packaging/config.yaml.default" \
        "$pkgdir/etc/huion-keydial-mini/config.yaml"
    install -Dm644 "README.md" \
        "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm755 /dev/stdin "$pkgdir/usr/lib/systemd/user-preset/99-huion-keydial-mini.preset" << 'EOF'
# Enable huion-keydial-mini-user service
enable huion-keydial-mini-user.service
EOF
}

post_install() {
    echo "Huion Keydial Mini Driver installed successfully!"
    echo ""
    echo "Next steps:"
    echo "1. Copy the default config to your user directory:"
    echo "   mkdir -p ~/.config/huion-keydial-mini"
    echo "   cp /etc/huion-keydial-mini/config.yaml ~/.config/huion-keydial-mini/"
    echo "2. Edit your config file:"
    echo "   nano ~/.config/huion-keydial-mini/config.yaml"
    echo "3. Reboot or log out and back in for group changes to take effect"
    echo "4. Start the user service:"
    echo "   systemctl --user enable --now huion-keydial-mini-user.service"
    echo ""
    echo "For more information, see: /usr/share/doc/$pkgname/README.md"
}

post_upgrade() {
    echo "Huion Keydial Mini Driver upgraded successfully!"
    echo "The system service will be restarted automatically."
    echo "You may need to restart the user service:"
    echo "  systemctl --user restart huion-keydial-mini-user.service"
}

