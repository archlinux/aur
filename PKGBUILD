# Maintainer: Tim Jefferies <tim.jefferies@gmail.com>
pkgname=ntfy-notify-send-bridge-git
pkgver=0
pkgrel=1
pkgdesc="Bridge messages from ntfy to notify-send using a systemd user service."
arch=('any')
url="https://github.com/tim-projects/ntfy-notify-send-bridge"
license=('MIT')
depends=('python' 'python-requests' 'python-pyyaml' 'python-aiohttp' 'libnotify')
makedepends=('git')
provides=('ntfy-notify-send-bridge')
conflicts=('ntfy-notify-send-bridge')
source=(
    "ntfy-notify-send-bridge.py"
    "ntfy-notify-send-bridge.service"
    "client.yml"
)
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*\)-\([^-]*\)-\(g.*\)/\1.r\2.\3/;s/-/+/g'
}

package() {
    # Remove Restart and RestartSec from the service file, as the Python script handles retries internally.
    sed -i '/^Restart=/d' "${srcdir}/ntfy-notify-send-bridge.service"
    sed -i '/^RestartSec=/d' "${srcdir}/ntfy-notify-send-bridge.service"

    install -D -m 755 "${srcdir}/ntfy-notify-send-bridge.py" "${pkgdir}/usr/bin/ntfy-notify-send-bridge.py"
    install -D -m 644 "${srcdir}/ntfy-notify-send-bridge.service" "${pkgdir}/usr/lib/systemd/user/ntfy-notify-send-bridge.service"
    install -D -m 644 "${srcdir}/client.yml" "${pkgdir}/usr/share/examples/${pkgname}/client.yml.example"
}

pre_install() {
    echo "Stopping and disabling existing ntfy-notify-send-bridge.service (if any)..."
    systemctl --user stop ntfy-notify-send-bridge.service || true
    systemctl --user disable ntfy-notify-send-bridge.service || true
}

post_install() {
    echo "\n-----------------------------------------------------------------------"
    echo "ntfy-notify-send-bridge-git has been installed."
    echo "Automatically enabling and starting ntfy-notify-send-bridge.service..."
    systemctl --user daemon-reload
    systemctl --user enable ntfy-notify-send-bridge.service
    systemctl --user start ntfy-notify-send-bridge.service
    echo "\nTo get started:"
    echo "1. Edit ~/.config/ntfy/client.yml with your ntfy subscriptions."
    echo "   (An example config will be automatically copied there on first run if it doesn't exist.)"
    echo "   The example config is located at /usr/share/examples/${pkgname}/client.yml.example"
    echo "2. Check its status and logs:"
    echo "   systemctl --user status ntfy-notify-send-bridge.service"
    echo "   journalctl --user -u ntfy-notify-send-bridge.service -f"
    echo "-----------------------------------------------------------------------\n"
}
