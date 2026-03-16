# Maintainer: gogamlg3
pkgname=tg-ws-proxy-git
pkgver=1.1.1
pkgrel=2
pkgdesc="Local SOCKS5 proxy server for partial bypassing of Telegram loading"
arch=('x86_64')
url="https://github.com/Flowseal/tg-ws-proxy"
license=('MIT')
depends=('python')
makedepends=('python' 'python-pip')

source=("https://raw.githubusercontent.com/Flowseal/tg-ws-proxy/refs/heads/main/proxy/tg_ws_proxy.py")
sha256sums=('SKIP')

_binname=tg-ws-proxy

build() {
  cd "$srcdir/"

  python -m venv .venv
  source .venv/bin/activate
  python -m pip install pyinstaller cryptography cffi

  .venv/bin/pyinstaller --clean --noconfirm --onefile  --name "$pkgname" "tg_ws_proxy.py"

  deactivate || true
  rm -rf .venv
}

package() {
  cd "$srcdir"

  install -Dm755 "dist/$pkgname" "$pkgdir/usr/bin/$_binname"

  mkdir -p "$pkgdir/usr/lib/systemd/system"
  cat > "$pkgdir/usr/lib/systemd/system/$_binname.service" <<EOF
[Unit]
Description=Local SOCKS5 proxy server for partial bypassing of Telegram loading
After=network.target

[Service]
Type=simple
ExecStart=/usr/bin/$_binname --port 8888
Restart=on-failure
RestartSec=5s

[Install]
WantedBy=multi-user.target
EOF

}
