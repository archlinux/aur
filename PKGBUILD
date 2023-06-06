# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=impression
pkgver=1.0.0
pkgrel=1
pkgdesc="A straight-forward modern application to create bootable drives."
arch=('x86_64')
url="https://gitlab.com/adhami3310/Impression"
license=('GPL3')
depends=('libadwaita')
makedepends=('blueprint-compiler' 'cargo' 'meson')
checkdepends=('appstream-glib')
source=("https://gitlab.com/adhami3310/Impression/-/archive/v$pkgver/Impression-v$pkgver.tar.gz")
sha256sums=('fc494f3e9d2d7a6bcdaf23743d06c6e2e4d302f3c63b975ab017a347026a4d4f')

prepare() {
  cd "Impression-v$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  arch-meson "Impression-v$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs

  appstream-util validate-relax --nonet build/io.gitlab.adhami3310.Impression.metainfo.xml
}

package() {
  meson install -C build --destdir "$pkgdir"
}
