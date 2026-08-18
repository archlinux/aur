# Maintainer: sgtaziz <sgtaziz013 at google dot com>
pkgname=lianli-linux-git
pkgver=0.8.5.r0.ga56f6bf
pkgrel=1
pkgdesc="Open-source Linux replacement for L-Connect 3 for Lian Li devices"
arch=('x86_64')
url="https://github.com/sgtaziz/lian-li-linux"
license=('MIT')
depends=('libusb' 'ffmpeg' 'evdi-dkms' 'webkit2gtk-4.1' 'gtk3' 'glib2' 'libsoup3')
makedepends=('git' 'cargo' 'clang' 'cmake' 'nasm' 'npm')
provides=('lianli-linux')
conflicts=('lianli-linux')
source=("git+${url}.git")
sha256sums=('SKIP')
options=('!lto')

pkgver() {
  cd lian-li-linux
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd lian-li-linux
  git submodule update --init --recursive --depth=1
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  cd lian-li-linux

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export CARGO_PROFILE_RELEASE_STRIP=symbols
  cargo build --frozen --release
}

package() {
  cd lian-li-linux

  # Binaries
  install -Dm755 target/release/lianli-daemon "$pkgdir/usr/bin/lianli-daemon"
  install -Dm755 target/release/lianli-gui "$pkgdir/usr/bin/lianli-gui"

  # udev rules
  install -Dm644 packaging/udev/60-lianli.rules "$pkgdir/usr/lib/udev/rules.d/60-lianli.rules"

  # System user/group for the optional system service
  install -Dm644 packaging/sysusers.d/lianli.conf "$pkgdir/usr/lib/sysusers.d/lianli.conf"

  # Shared cross-mode lock file (prevents user + system daemons running at once)
  install -Dm644 packaging/tmpfiles.d/lianli.conf "$pkgdir/usr/lib/tmpfiles.d/lianli.conf"

  # Systemd services: per-user + system service, user enables either
  install -Dm644 packaging/systemd/lianli-daemon.service "$pkgdir/usr/lib/systemd/user/lianli-daemon.service"
  install -Dm644 packaging/systemd/lianli-daemon-system.service "$pkgdir/usr/lib/systemd/system/lianli-daemon-system.service"

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
