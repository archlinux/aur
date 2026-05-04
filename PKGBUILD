# Maintainer: Ersin Can Karaca <[canersinkaraca@gmail.com]>
pkgname=lapse-git
pkgver=v0.1.1.r0.g2e2bf60
pkgrel=1
pkgdesc="Native screen recording application in Rust for Wayland/X11"
arch=('x86_64')
url="https://github.com/canersin/lapse"
license=('custom')
depends=('gtk3' 'wayland' 'gpu-screen-recorder' 'libappindicator-gtk3')
makedepends=('cargo' 'git')
options=('!lto')
source=("git+file:///home/corvus/Lapse#branch=main")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/Lapse"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/Lapse"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release
}

package() {
  cd "$srcdir/Lapse"
  install -Dm755 "target/release/Lapse" "$pkgdir/usr/bin/lapse"
  install -Dm644 "assets/lapse.desktop" "$pkgdir/usr/share/applications/lapse.desktop"
  install -Dm644 "assets/icon.png" "$pkgdir/usr/share/pixmaps/lapse.png"
  install -Dm644 "assets/shutter.ogg" "$pkgdir/usr/share/sounds/lapse/shutter.ogg"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
  
  # Install init services
  install -Dm644 "packaging/init/systemd/lapse.service" "$pkgdir/usr/lib/systemd/user/lapse.service"
  install -Dm644 "packaging/init/xdg/lapse-daemon.desktop" "$pkgdir/etc/xdg/autostart/lapse-daemon.desktop"
  install -Dm644 "packaging/init/dinit/lapse" "$pkgdir/usr/share/lapse/init/dinit/lapse"
  install -Dm755 "packaging/init/runit/lapse/run" "$pkgdir/usr/share/lapse/init/runit/lapse/run"
}
