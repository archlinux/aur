# Maintainer: Kemal Ozturk <97kemalozturk at gmail dot com>

pkgname=framework-control-beta
pkgver=0.5.4
pkgrel=2
pkgdesc="Lightweight control surface for Framework laptops (Fan, Battery, Power, LEDs) - beta/pre-release"
arch=('x86_64')
url="https://github.com/ozturkkl/framework-control"
license=('MIT')
depends=('xdg-utils' 'hicolor-icon-theme')
optdepends=('framework-system: Framework CLI on PATH; otherwise auto-downloaded on first run')
makedepends=('rust' 'nodejs')
conflicts=('framework-control')
provides=('framework-control')
install=framework-control-beta.install
_pkgname=framework-control
source=("$_pkgname-$pkgver.tar.gz::https://github.com/ozturkkl/framework-control/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('be16ad19c3653213c711e8581bcc0e85e3a3fff96b2e494947262745098f176f')

_port=30912

prepare() {
    cd "$srcdir/$_pkgname-$pkgver"

    cd web
    npm ci

    cd ../service
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/$_pkgname-$pkgver"

    cd web
    GITHUB_PAGES=false \
    VITE_BASE="/" \
        npm run build

    cd ../service
    FRAMEWORK_CONTROL_PORT=$_port \
    FRAMEWORK_CONTROL_ALLOWED_ORIGINS="http://127.0.0.1:$_port" \
        cargo build --release --locked --features embed-ui
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"

    install -Dm755 service/target/release/framework-control-service "$pkgdir/usr/bin/framework-control"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

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
