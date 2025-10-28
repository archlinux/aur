# Maintainer: WeeXnes <weexnes@weexnes.dev>
pkgname=checkmate-capture
pkgver=1.3.2
pkgrel=2
pkgdesc="Checkmate Capture Monitoring Tool (built from source)"
arch=('x86_64')
url="https://github.com/bluewave-labs/capture"
license=('AGPL-3.0')
depends=('glibc')
makedepends=('go')
provides=('checkmate-capture')
conflicts=('checkmate-capture-bin')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bluewave-labs/capture/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d0bcdec46605b6f87bd659a648b7b00d18b915db5977fce7d19cd2f893e71d83')
options=('!strip')

build() {
    cd "capture-${pkgver}"

    export CGO_ENABLED=0
    export GOFLAGS="-trimpath -mod=readonly -buildmode=pie"

    go build -ldflags="-s -w" -o dist/capture ./cmd/capture/
}

package() {
    cd "capture-${pkgver}"

    install -Dm755 "dist/capture" "$pkgdir/usr/bin/capture"

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
After installing, configure API_SECRET and enable service:

    sudo bash -c 'echo "API_SECRET=your-secret-here" > /etc/checkmate-capture.env'
    sudo chmod 600 /etc/checkmate-capture.env
    sudo chown root:root /etc/checkmate-capture.env

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
    sudo bash -c "echo 'API_SECRET=${API_SECRET}' > '$ENV_FILE'"
    sudo chmod 600 "$ENV_FILE"
    sudo chown root:root "$ENV_FILE"
else
    echo "$ENV_FILE already exists."
fi

sudo systemctl daemon-reload
sudo systemctl enable --now "$SERVICE"
echo "Service enabled: $SERVICE"
EOS
}

post_install() {
    cat <<EOF
===================================================================
 checkmate-capture installed (from source).
===================================================================
Run: checkmate-capture-setup
  → Sets up API_SECRET and enables per-user service.

Or manually:
  echo 'API_SECRET=...' | sudo tee /etc/checkmate-capture.env
  sudo systemctl enable --now checkmate-capture@\$(whoami).service
===================================================================
EOF
}

post_upgrade() { post_install; }
