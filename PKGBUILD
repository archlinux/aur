# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=regexxer
pkgver=0.10
pkgrel=11
pkgdesc='Interactive search and replace tool for GNOME'
arch=(x86_64)
url='https://regexxer.sourceforge.net/'
license=(GPL-2.0-or-later)
depends=(
  atkmm
  dconf
  gcc-libs
  glib2
  glibc
  glibmm
  gtk3
  gtkmm3
  gtksourceviewmm
  hicolor-icon-theme
  libsigc++
  pangomm
)
makedepends=(
  git
  intltool
)
source=(
  "git+https://gitlab.gnome.org/Archive/$pkgname.git#tag=$pkgname-$pkgver"
  regexxer.appdata.xml
)
b2sums=(
  9192c07e2152d87a2b36fa077981d62dc48138775578fb2c23593a9aa8529b5552138e503be82252904551747dbf4425b50ebcc3b285574977a73c6fe2365318
  1b8878c5fbfaccefd3f1157e9905b8e7cc022c9e5def6aa22b7f9dc06b8cad8b632962bf1aac1da763bedee702e14d373119ac66e2f9c07bde22beb9097086a3
)

prepare() {
  cd $pkgname

  # Port to glib 2.32
  git cherry-pick -n 891327ee82e327314429609aeb5a60faed5487ba

  # Fix deprecations to make it compatible with GTK 3
  git cherry-pick -n 107c71d622c7cfbced8dc23901841dca0f97d505

  # Don't try to compile GSettings schemas when packaging
  sed -i '/GLIB_COMPILE_SCHEMAS/ d' Makefile.am

  autoreconf -fi
}

build() {
  cd $pkgname
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
  install -Dm644 ../regexxer.appdata.xml "$pkgdir/usr/share/metainfo/regexxer.appdata.xml"
}
