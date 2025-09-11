# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Dan Printzell <wild@archlinux.org>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Severen Redwood <severen@shrike.me>
# Contributor: Robert Welin <robert.welin@gmail.com>
# Contributor: dsboger <https://github.com/dsboger>
pkgname=gtkd
pkgver=3.11.0
pkgrel=4
pkgdesc="D bindings for GTK+ and related libraries."
arch=('x86_64')
url="https://gtkd.org"
license=('LGPL-3.0-or-later')
depends=(
  'liblphobos'
  'gtk3'
)
makedepends=('ldc')
optdepends=(
  'atk'
  'gdk-pixbuf2'
  'gstreamer'
  'gtksourceview3'
  'libpeas'
  'pango'
  'vte3'
)
source=("GtkD-$pkgver.tar.gz::https://github.com/gtkd-developers/GtkD/archive/v$pkgver.tar.gz")
sha512sums=('8c2a19fa7d71b0b9341d22e45d8c8804d84db25842b30affaaf62672d93a9173551e420103c30887cd111301999ca12b4148ddf270cb27bf67f4e1e51ea144a9')

prepare() {
  cd GtkD-$pkgver

  # Fix build
  find ./demos/gtkD/TestWindow -type f -exec sed -i 's/debug(1)/debug(trace)/g' {} +
}

build() {
  cd GtkD-$pkgver
  export _ldFlags="$(echo -ne $LDFLAGS | sed -e 's/-Wl,/-L=/g' -e 's/=auto/=full/')"

  make \
    DC='ldc' \
    LDFLAGS="${_ldFlags}" \
    libdir='lib/' \
    shared-{gtkd,gtkdgl,sv,gstreamer,vte,peas}
}

check() {
  cd GtkD-$pkgver
  make LDFLAGS='' test
}

package() {
  cd GtkD-$pkgver
  make \
    prefix='/usr' \
    libdir='lib/' \
    DESTDIR="$pkgdir" \
    install-{shared,headers}-{gtkd,gtkdgl,gtkdsv,gstreamer,vte,peas}
}
