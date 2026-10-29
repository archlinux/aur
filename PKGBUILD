pkgname=pcw-backend
pkgver=0.1.2
pkgrel=1
pkgdesc="Backend for ProxyCoreWrapper"
url='https://github.com/ProxyCoreWrapper/backend'
arch=('x86_64')
license=('MIT OR Apache-2.0')
options=('!debug')

depends=('glibc' 'systemd')
makedepends=('git' 'rust' 'protobuf')

source=("git+https://github.com/ProxyCoreWrapper/backend.git#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/backend"
  git submodule update --init --recursive
}

build() {
  cd "$srcdir/backend"
  cargo build --frozen --release
}

package() {
  install -Dm755 "$srcdir/backend/target/release/pcw-backend" \
    "$pkgdir/usr/bin/pcw-backend"

  install -Dm644 /dev/stdin "$pkgdir/usr/lib/systemd/system/pcw-backend.service" <<EOF
[Unit]
Description=ProxyCoreWrapper backend
After=network.target

[Service]
Type=simple
User=root
Group=pcw
ConfigurationDirectory=pcw
RuntimeDirectory=pcw
StateDirectory=pcw-backend
ExecStart=/usr/bin/pcw-backend
Restart=on-failure
UMask=007

[Install]
WantedBy=multi-user.target
EOF

  install -Dm644 /dev/stdin \
    "$pkgdir/usr/lib/sysusers.d/pcw-backend.conf" <<EOF
g pcw
EOF

  install -Dm644 "$srcdir/backend/LICENSE-MIT" "$srcdir/backend/LICENSE-APACHE" \
    -t "$pkgdir/usr/share/licenses/$pkgname/"
}
