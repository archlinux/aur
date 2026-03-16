# Maintainer: MangoChill Contributors

pkgname=mangochill-git
pkgver=0.3.0.r0.gaea3635
pkgrel=1
pkgdesc='Input-based dynamic FPS limiter for Linux using MangoHud control socket'
arch=('x86_64')
url='https://github.com/farnoy/mangochill'
license=('MIT')
depends=('acl')
optdepends=('mangohud-mangochill: MangoHud-based FPS limiting'
            'gamescope: Gamescope-based FPS limiting')
makedepends=('git' 'rust' 'cargo' 'capnproto')
provides=('mangochill')
conflicts=('mangochill')
install="${pkgname}.install"
source=('mangochill::git+https://github.com/farnoy/mangochill.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/mangochill"
  ( set -o pipefail
    git describe --long --abbrev=7 --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

prepare() {
  cd "$srcdir/mangochill"

  cat > "$srcdir/mangochill-server.service" <<'UNIT'
[Unit]
Description=MangoChill FPS limiter server
After=systemd-udev-settle.service

[Service]
ExecStart=/usr/bin/mangochill-server -vv
User=mangochill
Group=mangochill
Type=simple
Restart=on-failure
RestartSec=5

RuntimeDirectory=mangochill
RuntimeDirectoryMode=0755

ProtectSystem=strict
ProtectHome=true
PrivateTmp=true
NoNewPrivileges=true
ProtectKernelTunables=true
ProtectKernelModules=true
ProtectControlGroups=true
DeviceAllow=char-input r

[Install]
WantedBy=multi-user.target
UNIT

  cat > "$srcdir/90-mangochill.rules" <<'RULES'
SUBSYSTEM=="input", KERNEL=="event*", ACTION=="add|change", RUN+="/usr/bin/setfacl -m u:mangochill:r $devnode"
RULES

  cat > "$srcdir/mangochill.conf" <<'SYSUSERS'
u mangochill - "MangoChill system user"
g mangochill -
m mangochill mangochill
SYSUSERS
}

build() {
  cd "$srcdir/mangochill"
  cargo build --release --locked --bin mangochill-server --bin mangochill-client
}

package() {
  cd "$srcdir/mangochill"

  install -Dm755 target/release/mangochill-server "$pkgdir/usr/bin/mangochill-server"
  install -Dm755 target/release/mangochill-client "$pkgdir/usr/bin/mangochill-client"

  install -Dm644 "$srcdir/mangochill-server.service" "$pkgdir/usr/lib/systemd/system/mangochill-server.service"
  install -Dm644 "$srcdir/90-mangochill.rules" "$pkgdir/usr/lib/udev/rules.d/90-mangochill.rules"
  install -Dm644 "$srcdir/mangochill.conf" "$pkgdir/usr/lib/sysusers.d/mangochill.conf"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
