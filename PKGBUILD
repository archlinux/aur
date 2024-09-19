# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Dušan Simić <dusan.simic1810@gmail.com>
pkgname=eyedropper
pkgver=2.0.1
pkgrel=1
pkgdesc="Pick and format colors"
arch=('x86_64')
url="https://apps.gnome.org/Eyedropper"
license=('GPL-3.0-or-later')
depends=('libadwaita')
makedepends=('blueprint-compiler' 'cargo' 'meson')
source=("$pkgname-$pkgver.tar.gz::https://github.com/FineFindus/eyedropper/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9dce8cb994bf1ebedaee1af5792fd793677f8e819c671ece2917f5741ac5df73')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
