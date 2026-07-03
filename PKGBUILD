# Maintainer: Kemal Ozturk <97kemalozturk at gmail dot com>

pkgname=framework-control
pkgver=0.5.3
pkgrel=1
pkgdesc="Lightweight control surface for Framework laptops (Fan, Battery, Power, LEDs)"
arch=('x86_64')
url="https://github.com/ozturkkl/framework-control"
license=('MIT')
depends=('xdg-utils' 'hicolor-icon-theme' 'framework-system')
makedepends=('rust' 'cargo' 'nodejs' 'npm')
install=framework-control.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/ozturkkl/framework-control/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('c2a118ea8c3e496fb3956526a0f5b2ad5debb85fcd6f30d4f96bd04dbd498f3c')

_port=30912

prepare() {
    cd "$srcdir/$pkgname-$pkgver"

    cd web
    npm ci

    cd ../service
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"

    # Build web UI (prebuild hook generates icons and OpenAPI TS client)
    cd web
    GITHUB_PAGES=false \
    VITE_BASE="/" \
        npm run build

    # Build service binary with embedded UI
    cd ../service
    FRAMEWORK_CONTROL_PORT=$_port \
    FRAMEWORK_CONTROL_ALLOWED_ORIGINS="http://127.0.0.1:$_port" \
        cargo build --release --locked --features embed-ui
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm755 service/target/release/framework-control-service "$pkgdir/usr/bin/framework-control"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Icon generated during web build (guaranteed 512x512)
    install -Dm644 web/public/assets/generated/icon-512.png \
        "$pkgdir/usr/share/icons/hicolor/512x512/apps/framework-control.png"

    install -Dm644 /dev/stdin "$pkgdir/usr/lib/systemd/system/framework-control.service" <<EOF
[Unit]
Description=Framework Control Service
After=network.target

[Service]
Type=simple
ExecStart=/usr/bin/framework-control
Restart=on-failure
RestartSec=5
PrivateTmp=yes

[Install]
WantedBy=multi-user.target
EOF

    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/framework-control.desktop" <<EOF
[Desktop Entry]
Name=Framework Control
Comment=Configure Framework Laptop battery, fans, and LEDs
Exec=xdg-open http://127.0.0.1:$_port
Icon=framework-control
Terminal=false
Type=Application
Categories=Settings;System;
EOF
}
