# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>
pkgname=pods
pkgver=2.1.0
pkgrel=1
pkgdesc="A Podman desktop application"
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
sha256sums=('dba67080ed2a781275126f8660877dc4fad18bd8aadfb181f839c217fd446fd6'
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
