# Maintainer: Ingo Meyer <i.meyer@fz-juelich.de>
# Contributor: Hauke Ingwersen <hauing@pm.me>
# Contributor: Yiyao Yu <yyudevel at protonmail dot com>
# Contributor: GordonGR <ntheo1979@gmail.com>
# Contributor: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani at gmail dot com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=evince-no-gnome
_pkgname=evince
pkgver=48.0
pkgrel=3
pkgdesc="Document viewer, no gnome dependencies"
url="https://apps.gnome.org/Evince"
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
source=("git+https://gitlab.gnome.org/GNOME/evince.git?signed#tag=${pkgver/[a-z]/.&}"
        evince-prgname.patch
        evince-gcc15.patch)
b2sums=('01e7c46f617012fc267a215464773c9c804ea87681237747a3a4581728b2e29bf2a5478cb93ace64b318be6473088020094a5339be24e08c5862272d2f269d47'
        'bd126def7c4f94a0f0278ed712fc995bc8dc2a8644dae54ad931a2daccd2feace6e586dc8377f38ae5c1575764cbd0992f472e71e791bbab65fb5a13cb8f3c66'
        '29cb521e3af1d199e08107b19577266648e63ca520d507bf080712eac615cc9e9817e0a8f7f76314fee60f41ca251c5f3a13375fc8bd3f71b868088f133a62eb')
validpgpkeys=(
  3289FDCF12AC2321BB41E9EF342B349ED9FE78F0 # Germán Poo-Caamaño <gpoo@gnome.org>
)

prepare() {
  cd evince || return

  # Set application ID to match with .desktop
  # https://gitlab.gnome.org/GNOME/evince/-/merge_requests/725
  git apply -3 ../evince-prgname.patch
  git apply -3 ../evince-gcc15.patch
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

  arch-meson evince build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
