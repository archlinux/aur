# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Dušan Simić <dusan.simic1810@gmail.com>
pkgname=eyedropper
pkgver=1.0.0
pkgrel=2
pkgdesc="A simple to use color picker and editor"
arch=('x86_64')
url="https://apps.gnome.org/Eyedropper"
license=('GPL-3.0-or-later')
depends=('libadwaita')
makedepends=('blueprint-compiler' 'cargo' 'meson')
checkdepends=('appstream-glib')
source=("$pkgname-$pkgver.tar.gz::https://github.com/FineFindus/eyedropper/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b3ef1ed73a4795e1605c008fc6ef004ba74e029827c5064997229c4838f0095d')

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
