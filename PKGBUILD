# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>
pkgname=pods
pkgver=2.0.3
pkgrel=1
pkgdesc="A Podman desktop application"
arch=('x86_64' 'aarch64')
url="https://github.com/marhkb/pods"
license=('GPL-3.0-or-later')
depends=(
  'gtksourceview5'
  'libadwaita'
  'libpanel'
  'podman'
  'vte4'
)
makedepends=(
  'cargo'
  'meson'
)
checkdepends=(
  'appstream-glib'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('76d359b60b455de4b3ebfa334fea29ba0f1a90eb597c7cd48bc129bd278ea039')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  export RUSTUP_TOOLCHAIN=stable
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
