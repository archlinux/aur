# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-desktop-fixer
pkgver=0.2.0
pkgrel=1
pkgdesc="Automatically fixes Steam game desktop entries on GNOME desktop environments"
arch=('x86_64')
url="https://github.com/PeppoDev/gnome_desktop_fixer"
license=('LicenseRef-unknown')
depends=('libgcc')
makedepends=('cargo')
install="$pkgname.install"
source=("gnome_desktop_fixer-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "$pkgname.service")
sha256sums=('7c99c0e59ead101b7d56045c805b115ef77812e09ae76c1732f23590b19ad1a9'
            'f0bb796fd1528d999d77456cec017b80c87149c89d781fe712324c518e08852f')

prepare() {
  cd "gnome_desktop_fixer-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc --print host-tuple)"
}

build() {
  cd "gnome_desktop_fixer-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release
}

check() {
  cd "gnome_desktop_fixer-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen
}

package() {
  cd "gnome_desktop_fixer-$pkgver"
  install -Dm755 target/release/gnome_desktop_fixer "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname.service" -t "$pkgdir/usr/lib/systemd/user/"
}
