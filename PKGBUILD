# Maintainer: Your Name <your@email.com>
pkgname=rofi-wifi
pkgver=0.1.0
pkgrel=1
pkgdesc="A rofi-based Wi-Fi manager written in Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/eoc-ic/rofi-rwifi"
license=('MIT')
depends=(
  'rofi'
  'networkmanager' # 提供 nmcli
  'gcc-libs'
  'glibc'
)
optdepends=(
  'libnotify: 桌面通知支持'
  'qrencode: Wi-Fi 二维码分享'
)
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver-alpha.tar.gz")
b2sums=('SKIP') # 发布时替换为真实校验值：b2sum rofi-wifi-0.1.0.tar.gz

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  # 预先下载所有依赖，使 build() 可离线运行
  cargo fetch --locked --target "$(rustc -vV | sed -n 's|host: ||p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"

  # 主二进制
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

  # 默认配置文件
  install -Dm644 "config.toml.example" \
    "$pkgdir/usr/share/$pkgname/config.toml"

  # systemd 用户服务（守护进程，开机自启后台扫描）
  install -Dm644 /dev/stdin \
    "$pkgdir/usr/lib/systemd/user/$pkgname-daemon.service" <<EOF
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

  # man page（若有）
  # install -Dm644 "doc/$pkgname.1" "$pkgdir/usr/share/man/man1/$pkgname.1"

  # LICENSE
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # README
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
