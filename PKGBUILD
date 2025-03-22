# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>
pkgname=pods
pkgver=2.2.0
pkgrel=1
pkgdesc="Manage your Podman containers"
arch=('x86_64' 'aarch64')
url="https://github.com/marhkb/pods"
license=('GPL-3.0-or-later')
depends=(
  'gtksourceview5'
  'libadwaita'
  'podman'
  'vte4'
)
makedepends=(
  'cargo'
  'meson'
)
checkdepends=('appstream-glib')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        'disable-clippy-test.patch')
sha256sums=('ccd81545152637f1789eeb817226929ea43dbc83188450c90e7043c9f8878bae'
            '2f95097a625041cafb85f4f7f837539131ce2c212819e8030ed9623afb172030')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"

  patch -Np1 -i ../disable-clippy-test.patch
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
