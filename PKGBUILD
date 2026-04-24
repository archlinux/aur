# Maintainer: sgtaziz <sgtaziz013 at google dot com>
pkgname=lianli-linux-git
pkgver=0.4.1
pkgrel=1
pkgdesc="Open-source Linux replacement for L-Connect 3 - fan control, RGB, LCD streaming for Lian Li devices"
arch=('x86_64')
url="https://github.com/sgtaziz/lian-li-linux"
license=('MIT')
depends=('libusb' 'ffmpeg' 'fontconfig' 'mesa' 'libxkbcommon' 'wayland' 'libx11' 'libinput' 'libdrm' 'libjpeg-turbo' 'evdi-dkms')
makedepends=('git' 'rust' 'cargo' 'clang' 'cmake' 'pkg-config' 'nasm')
provides=('lianli-linux')
conflicts=('lianli-linux')
source=("git+${url}.git")
sha256sums=('SKIP')
install=lianli-linux.install
options=('!debug' '!lto' 'strip')

pkgver() {
  cd lian-li-linux
  (git describe --tags --abbrev=0 2>/dev/null || git rev-parse --short HEAD) | sed 's/^v//'
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
  install -Dm644 packaging/udev/99-lianli.rules "$pkgdir/usr/lib/udev/rules.d/99-lianli.rules"

  # Systemd user service (enabled globally by the install hook)
  install -Dm644 packaging/systemd/lianli-daemon.service "$pkgdir/usr/lib/systemd/user/lianli-daemon.service"

  # Auto-load the evdi kernel module at boot so udev can grant user access to it
  install -Dm644 packaging/modules-load.d/lianli-evdi.conf "$pkgdir/usr/lib/modules-load.d/lianli-evdi.conf"

  # Desktop entry
  install -Dm644 packaging/desktop/com.sgtaziz.lianlilinux.desktop "$pkgdir/usr/share/applications/com.sgtaziz.lianlilinux.desktop"

  # Icons
  install -Dm644 assets/icons/32x32.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/com.sgtaziz.lianlilinux.png"
  install -Dm644 assets/icons/128x128.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/com.sgtaziz.lianlilinux.png"
  install -Dm644 assets/icons/128x128@2x.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/com.sgtaziz.lianlilinux.png"
  install -Dm644 assets/icons/icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/com.sgtaziz.lianlilinux.svg"

  # License
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
