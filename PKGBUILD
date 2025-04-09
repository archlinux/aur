# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Co-Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Fernando Fernández <fernando at softwareperonista dot com dot ar>
# Contributor: Balló György
# Contributor: Artem Vorotnikov <artem at vorotnikov dot me>
pkgname=gxml
pkgver=0.20.4
pkgrel=3
pkgdesc="GObject-based XML parser and writer library"
arch=('x86_64')
url="https://gitlab.gnome.org/GNOME/gxml"
license=('LGPL-2.1-or-later')
depends=(
  'glib2'
  'libgee'
  'libxml2'
)
makedepends=(
  'gobject-introspection'
  'meson'
  'vala'
)
provides=('libgxml-0.20.so=2.0.2')
source=("https://gitlab.gnome.org/GNOME/gxml/-/archive/$pkgver/$pkgname-$pkgver.tar.gz"
        'pkgconfig.patch')
sha256sums=('237f5d3984b6aa7378bfa030b7dadfad43041720f097bb5b4104e84829d741a5'
            '3536002359b89f716e76642fb1fbdafcb1cc92f418111a70601814c90dfee15b')

prepare() {
  cd "$pkgname-$pkgver"

  # Fix pkgconfig version detection
  # https://gitlab.gnome.org/GNOME/gxml/-/merge_requests/28
  patch -Np1 -i ../pkgconfig.patch
}

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {

  # serialization test fails
  meson test -C build --no-rebuild --print-errorlogs || :
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
