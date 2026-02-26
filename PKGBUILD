# Maintainer: luoq721@qq.com
pkgname=rofi-rwifi-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="A rofi-based Wi-Fi manager written in Rust (prebuilt binary)"
arch=('x86_64')
url="https://github.com/eon-ic/rofi-rwifi"
license=('MIT')
depends=(
  'rofi'
  'networkmanager'
  'gcc-libs'
  'glibc'
)
optdepends=(
  'libnotify: 桌面通知支持'
  'qrencode: Wi-Fi 二维码分享'
)
provides=("rofi-rwifi=$pkgver")
conflicts=('rofi-rwifi')
options=(!debug)
source=(
  "$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/rofi-rwifi-$pkgver-x86_64.tar.gz"
)
b2sums=('SKIP') # 发布时替换为真实校验值

package() {
  # 预编译包内容：rofi-rwifi（二进制）+ config.toml.example + LICENSE + README.md
  install -Dm755 "rofi-rwifi" "$pkgdir/usr/bin/rofi-rwifi"
  install -Dm644 "config.toml.example" "$pkgdir/usr/share/rofi-rwifi/config.toml"
  # install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"

  install -Dm644 /dev/stdin \
    "$pkgdir/usr/lib/systemd/user/rofi-rwifi-daemon.service" <<EOF
[Unit]
Description=rofi-rwifi background scan daemon
After=network.target

[Service]
Type=simple
ExecStart=/usr/bin/rofi-rwifi daemon
Restart=on-failure
RestartSec=5

[Install]
WantedBy=default.target
EOF
}
