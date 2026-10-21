# Maintainer: deddroid <deddo9412@gmail.com>
pkgname=wnvidia-control
_bin=wnvctl
pkgver=0.1.1
pkgrel=1
pkgdesc="Overclock, undervolt, power limit and fan curves for NVIDIA GPUs (Wayland/X11 GUI, CLI and service)"
arch=('x86_64')
url="https://github.com/deddroid/wnvidia-control"
license=('MIT')
depends=('gcc-libs' 'glibc' 'libglvnd' 'libxkbcommon' 'nvidia-utils')
makedepends=('cargo')
optdepends=('wayland: native Wayland window'
            'libx11: X11 window')
provides=("$_bin")
conflicts=("$_bin")
backup=('etc/wnvctl/daemon.toml')
install=wnvidia-control.install
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('b0dcb4e8073138526ae7ba4b85c93d28b61267c0f1b60c63581abab877f48f67')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export RUSTFLAGS="--remap-path-prefix=$srcdir=/build --remap-path-prefix=${CARGO_HOME:-$HOME/.cargo}=/cargo"
  cargo build --frozen --release
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export RUSTFLAGS="--remap-path-prefix=$srcdir=/build --remap-path-prefix=${CARGO_HOME:-$HOME/.cargo}=/cargo"
  cargo test --frozen --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/wnvctl target/release/wnvctl-gui -t "$pkgdir/usr/bin/"
  install -Dm644 packaging/linux/wnvctl.service -t "$pkgdir/usr/lib/systemd/system/"
  install -Dm644 packaging/linux/wnvctl.sysusers "$pkgdir/usr/lib/sysusers.d/wnvctl.conf"
  install -Dm644 packaging/linux/daemon.toml -t "$pkgdir/etc/wnvctl/"
  install -Dm644 packaging/linux/wnvctl.desktop -t "$pkgdir/usr/share/applications/"
  for s in 16 32 48 64 128 256 512; do
    install -Dm644 "assets/icon-$s.png" "$pkgdir/usr/share/icons/hicolor/${s}x${s}/apps/wnvctl.png"
  done
  install -Dm644 assets/icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/wnvctl.svg"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 README.md README.it.md CHANGELOG.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
