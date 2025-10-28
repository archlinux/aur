# Maintainer: WeeXnes <weexnes@weexnes.dev>
pkgname=checkmate-capture-bin
pkgver=1.3.2
pkgrel=2
pkgdesc="Checkmate Capture Monitoring Tool (binary release)"
arch=('x86_64')
url="https://github.com/bluewave-labs/capture"
license=('AGPL-3.0')
provides=('checkmate-capture')
conflicts=('checkmate-capture')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bluewave-labs/capture/releases/download/v${pkgver}/capture_${pkgver}_linux_amd64.tar.gz")
sha256sums=('aa7ea22d35eedd3be80b69d55899d8a56d10b4d874e8cbb114ebad8be923dd2a')
options=('!strip')

package() {
    cd "$srcdir"

    [[ -f "capture" ]] || { error "capture executable not found in archive."; exit 1; }

    install -Dm755 "capture" "$pkgdir/usr/bin/capture"

    install -Dm644 /dev/stdin "$pkgdir/etc/systemd/system/checkmate-capture@.service" <<EOF
[Unit]
Description=Checkmate Capture System Monitor
After=network.target

[Service]
Type=simple
User=%i
Group=%g
EnvironmentFile=/etc/checkmate-capture.env
ExecStart=/usr/bin/capture
Restart=on-failure
RestartSec=5

[Install]
WantedBy=multi-user.target
EOF

    mkdir -p "$pkgdir/usr/share/doc/$pkgname"
    cat > "$pkgdir/usr/share/doc/$pkgname/POST_INSTALL.md" <<EOF
After installing this package, configure the API secret:

    sudo bash -c 'echo "API_SECRET=your-secret-here" > /etc/checkmate-capture.env'
    sudo chmod 600 /etc/checkmate-capture.env
    sudo chown root:root /etc/checkmate-capture.env

Then enable and start the service for the current user:

    sudo systemctl daemon-reload
    sudo systemctl enable --now checkmate-capture@\$(whoami).service
EOF

    install -Dm755 /dev/stdin "$pkgdir/usr/bin/checkmate-capture-setup" <<'EOS'
#!/usr/bin/env bash
set -euo pipefail

[[ $EUID -eq 0 ]] && { echo "Do not run as root."; exit 1; }

USER=$(whoami)
SERVICE="checkmate-capture@$USER.service"
ENV_FILE="/etc/checkmate-capture.env"

if [[ ! -f "$ENV_FILE" ]]; then
    echo "Enter API_SECRET for Checkmate Capture:"
    read -r API_SECRET
    echo "Creating $ENV_FILE..."
    sudo bash -c "echo 'API_SECRET=${API_SECRET}' > '$ENV_FILE'"
    sudo chmod 600 "$ENV_FILE"
    sudo chown root:root "$ENV_FILE"
else
    echo "$ENV_FILE already exists. Skipping creation."
fi

echo "Reloading systemd and enabling service for user: $USER"
sudo systemctl daemon-reload
sudo systemctl enable --now "$SERVICE"

echo "Service is now running!"
echo "Check status with: systemctl status $SERVICE"
EOS
}

post_install() {
    cat <<EOF
===================================================================
 Checkmate Capture installed.
===================================================================
Run: checkmate-capture-setup
  - Prompts for API_SECRET
  - Enables service for your user

Or manually:
  sudo echo 'API_SECRET=...' > /etc/checkmate-capture.env
  sudo systemctl enable --now checkmate-capture@\$(whoami).service
===================================================================
EOF
}

post_upgrade() { post_install; }