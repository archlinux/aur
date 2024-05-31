# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=fotema
pkgver=1.7.0
pkgrel=1
pkgdesc="Photo gallery for Linux"
arch=('x86_64')
url="https://github.com/blissd/fotema"
license=('CC0-1.0 AND CC-BY-2.0 AND CC-BY-4.0 AND CC-BY-NC-SA-4.0 AND CC-BY-SA-4.0 AND GFDL-1.3-or-later AND GPL-3.0-or-later')
depends=('ffmpeg' 'glycin' 'libadwaita' 'libheif')
makedepends=('cargo' 'clang' 'gtk3' 'meson' 'mold')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6044de5e7acd48b8a67ff5de6b2823a0cd97130c6e5e6fd1dc7d23b5e90ce41e')

prepare() {
  cd "$pkgname-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  RUSTFLAGS="-C link-arg=-fuse-ld=mold"
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"

  cd "$pkgname-$pkgver"
  install -Dm644 LICENSES/* -t "$pkgdir/usr/share/licenses/$pkgname/"
}
