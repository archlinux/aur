# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=libpqmarble
pkgver=1.3.0+12+gf240b2e
pkgrel=3
pkgdesc="Utility library for GNOME apps."
arch=('x86_64')
url="https://gitlab.gnome.org/raggesilver/marble"
license=('GPL3')
depends=('gtk4')
makedepends=('git' 'gobject-introspection' 'meson' 'vala')
provides=('libpqmarble.so=2')
conflicts=('libmarble')
replaces=('libmarble')
_commit=f240b2ec7d5cdacb8fdcc553703420dc5101ffdb  # branch/master
source=("git+https://gitlab.gnome.org/raggesilver/marble.git#commit=${_commit}"
        "libmarblepq-2.0.0-alt-css-provider-build-fix.patch")
sha256sums=('SKIP'
            '93295c65181128613db23708623b9d9bd6e8a986b017788ac00fb44c81349c05')

pkgver() {
  cd "$srcdir/marble"
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd "$srcdir/marble"

  # https://gitlab.gnome.org/raggesilver/marble/-/issues/12
  patch -Np1 -i ../libmarblepq-2.0.0-alt-css-provider-build-fix.patch
}

build() {
  arch-meson marble build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
