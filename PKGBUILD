# Maintainer: Peter Justin <peter.justin@outlook.com>
pkgname=appimage-integrator
pkgver=0.1.0
pkgrel=1
pkgdesc="Integrate AppImages into the desktop"
arch=(x86_64 aarch64)
url="https://github.com/sh4nks/appimage-integrator"
license=(MIT)
depends=(gcc-libs glibc qt6-base qt6-declarative)
makedepends=(cargo)
optdepends=(
  'libnotify: desktop notifications for available updates'
  'qqc2-desktop-style: native look on KDE Plasma'
)
provides=("appimage-integrator-cli=$pkgver")
conflicts=(appimage-integrator-cli)
options=(!lto !debug)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('160c902259bb3545adf030915d45720af927b51b7a66db41a50509dcefcacf03')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export CXXFLAGS+=" -ffile-prefix-map=$srcdir=."
  cargo build --frozen --release -p appimage-integrator -p appimage-integrator-gui
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/appimage-integrator target/release/appimage-integrator-gui -t "$pkgdir/usr/bin"
  install -Dm644 dist/appimage-integrator.service dist/appimage-integrator-update.service \
    dist/appimage-integrator-update.timer -t "$pkgdir/usr/lib/systemd/user"
  install -Dm644 dist/appimage-integrator-gui.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 dist/config.example.toml -t "$pkgdir/usr/share/doc/appimage-integrator"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
