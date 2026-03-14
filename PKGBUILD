# Maintainer: sgtaziz <sgtaziz013 at google dot com>
pkgname=lianli-linux-git
pkgver=r36.5d9c01c
pkgrel=1
pkgdesc="Open-source Linux replacement for L-Connect 3 - fan control, RGB, LCD streaming for Lian Li devices"
arch=('x86_64')
url="https://github.com/sgtaziz/lian-li-linux"
license=('MIT')
depends=('hidapi' 'libusb' 'ffmpeg' 'fontconfig' 'mesa' 'libxkbcommon' 'wayland' 'libx11' 'libinput' 'libdrm')
makedepends=('git' 'rust' 'cargo' 'clang' 'cmake' 'pkg-config')
provides=('lianli-linux')
conflicts=('lianli-linux')
source=("git+${url}.git")
sha256sums=('SKIP')
options=('!debug' '!lto' 'strip')

pkgver() {
  cd lian-li-linux
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd lian-li-linux
  git submodule update --init --recursive
  /usr/bin/cargo fetch --locked --target "$(/usr/bin/rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd lian-li-linux
  export CARGO_PROFILE_RELEASE_STRIP=symbols
  export CARGO_TARGET_DIR=target
  export SLINT_NO_QT=1
  RUSTC=/usr/bin/rustc /usr/bin/cargo build --frozen --release
}

package() {
  cd lian-li-linux

  # Binaries
  install -Dm755 target/release/lianli-daemon "$pkgdir/usr/bin/lianli-daemon"
  install -Dm755 target/release/lianli-gui "$pkgdir/usr/bin/lianli-gui"

  # udev rules
  install -Dm644 udev/99-lianli.rules "$pkgdir/usr/lib/udev/rules.d/99-lianli.rules"

  # Systemd user service
  install -Dm644 /dev/stdin "$pkgdir/usr/lib/systemd/user/lianli-daemon.service" <<EOF
[Unit]
Description=Lian Li Device Daemon
After=default.target

[Service]
Type=simple
ExecStart=/usr/bin/lianli-daemon
Restart=on-failure
RestartSec=5

[Install]
WantedBy=default.target
EOF

  # Desktop entry
  install -Dm644 lianli-gui.desktop "$pkgdir/usr/share/applications/lianli-gui.desktop"

  # Icons
  install -Dm644 assets/icons/32x32.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/lianli-gui.png"
  install -Dm644 assets/icons/128x128.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/lianli-gui.png"
  install -Dm644 assets/icons/128x128@2x.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/lianli-gui.png"
  install -Dm644 assets/icons/icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/lianli-gui.svg"

  # Auto-enable daemon for all users
  install -Dm644 /dev/stdin "$pkgdir/usr/lib/systemd/user-preset/50-lianli.preset" <<EOF
enable lianli-daemon.service
EOF

  # License
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
