# Maintainer: Ingo Meyer <i.meyer@fz-juelich.de>
# Contributor: Hauke Ingwersen <hauing@pm.me>
# Contributor: Yiyao Yu <yyudevel at protonmail dot com>
# Contributor: GordonGR <ntheo1979@gmail.com>
# Contributor: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani at gmail dot com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=evince-no-gnome
_pkgname=evince
pkgver=48.4
pkgrel=1
pkgdesc="Document viewer, no gnome dependencies"
url="https://gitlab.gnome.org/GNOME/evince"
arch=(x86_64)
license=(GPL-2.0-or-later)
depends=(
  at-spi2-core
  cairo
  dconf
  djvulibre
  exempi
  gcc-libs
  gdk-pixbuf2
  glib2
  glibc
  gsettings-desktop-schemas
  gsfonts
  gspell
  gst-plugins-base-libs
  gstreamer
  gtk3
  hicolor-icon-theme
  libarchive
  libgxps
  libhandy
  libspectre
  libsynctex
  libtiff
  libxml2
  pango
  poppler-glib
)
makedepends=(
  appstream
  gi-docgen
  git
  glib2-devel
  meson
  texlive-bin
  yelp-tools
)
optdepends=(
    'gvfs: for session saving and bookmarking'
    'texlive-bin: DVI support'
)
provides=("$_pkgname" libev{document,view}3.so)
conflicts=("$_pkgname" libev{document,view}3.so)
options=('!emptydirs')
source=(
  "git+https://gitlab.gnome.org/GNOME/evince.git?signed#tag=${pkgver/[a-z]/.&}"
)
b2sums=('8270950b1ee6ed489b2f018a29dde676303a8ac195aae810d09f6a6ff9d3f5f44292eadc4b4d5fe59d82c333f4bdb4e69c938a1e1ff92c808ea373dd7b1d161a')
validpgpkeys=(
  3289FDCF12AC2321BB41E9EF342B349ED9FE78F0 # Germán Poo-Caamaño <gpoo@gnome.org>
)

prepare() {
  cd evince || return
}

build() {
  local meson_options=(
    -D ps=enabled
    -D nautilus=false
    -D introspection=false
    -D thumbnail_cache=disabled
    -D keyring=disabled
    -D gtk_doc=false
  )

  # Work around kpathsea build failure with GCC 15
  CFLAGS+=" -DHAVE_STRING_H -DHAVE_STDLIB_H"

  arch-meson evince build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
