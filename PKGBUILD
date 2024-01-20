# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=libpqmarble
pkgver=1.3.0+12+gf240b2e
pkgrel=4
pkgdesc="Utility library for GNOME apps."
arch=('x86_64')
url="https://gitlab.gnome.org/raggesilver/marble"
license=('GPL-3.0-or-later')
depends=('gtk4')
makedepends=('git' 'gobject-introspection' 'meson' 'vala')
provides=('libpqmarble.so=2')
conflicts=('libmarble')
replaces=('libmarble')
_commit=f240b2ec7d5cdacb8fdcc553703420dc5101ffdb  # branch/master
source=("git+https://gitlab.gnome.org/raggesilver/marble.git#commit=${_commit}"
        "libmarblepq-2.0.0-alt-css-provider-build-fix.patch")
sha256sums=('SKIP'
            'fb176a2a3fb7f0042f454dbd6b24206e108094168666e42c8d94385b90662f7f')

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
