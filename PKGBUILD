# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>
pkgname=pods
pkgver=2.1.2
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
checkdepends=(
  'appstream-glib'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        'disable-clippy-test.patch')
sha256sums=('6c7ff17df31b6c27acec83b8342b9a6a4baf7dd12b518923ccfca4e2ebb8aa53'
            '558659ee8959d82236a69d22e977d0cbe8eb28a3799a7aff2c9dd69b9e1ae888')

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
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
