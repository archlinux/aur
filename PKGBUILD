# Maintainer:

_pkgbase="vte"
pkgbase="$_pkgbase-git"
pkgname=(
  "vte-common-git"
  "vte3-git"
  "vte4-git"
  "vte-docs-git"
)
pkgver=0.79.0.r39.gd99a527c
pkgrel=1
pkgdesc="Virtual Terminal Emulator widget"
url="https://gitlab.gnome.org/GNOME/vte"
arch=(x86_64)
license=(
  # Library
  LGPL-3.0-or-later

  # Demo app, some supporting files
  GPL-3.0-or-later

  # COPYING.XTERM (X11 license) only applies to the disabled SIXEL code
)

makedepends=(
  cairo
  fast_float
  gi-docgen
  git
  glib2-devel
  gobject-introspection
  gperf
  gtk3
  gtk4
  meson
  vala
)

options=(!lto)

_pkgsrc="$_pkgbase"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"

  _version=$(
    grep -E "^\s+version:\s+'([0-9]+\.[0-9]+\.[0-9]+)',\$" meson.build \
      | sed -E "s@^\s+version:\s+'([0-9]+\.[0-9]+\.[0-9]+)',\$@\1@"
  )
  _commit=$(
    git log -S "${_version}" -1 --pretty=oneline | sed 's@\ .*$@@'
  )
  _revision=$(
    git rev-list --count "${_commit}..HEAD"
  )
  _hash=$(
    git rev-parse --short HEAD
  )

  echo "${_version}.r${_revision}.g${_hash}"
}

build() {
  local meson_options=(
    -D docs=true
  )

  arch-meson "$_pkgsrc" build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

_pick() {
  local p="$1" f d
  shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

package_vte-common-git() {
  pkgdesc+=" (common files)"
  depends=(glibc)

  provides+=("${pkgname%-git}=${pkgver%%.r*}")
  conflicts+=("${pkgname%-git}")

  meson install -C build --destdir "$pkgdir"

  cd "$pkgdir"

  _pick gtk3 usr/bin/vte-2.91
  _pick gtk3 usr/include/vte-2.91
  _pick gtk3 usr/lib/libvte-2.91.so*
  _pick gtk3 usr/lib/pkgconfig/vte-2.91.pc
  _pick gtk3 usr/lib/girepository-1.0/Vte-2.91.typelib
  _pick gtk3 usr/share/gir-1.0/Vte-2.91.gir
  _pick gtk3 usr/share/glade
  _pick gtk3 usr/share/vala/vapi/vte-2.91.{deps,vapi}

  _pick gtk4 usr/bin/vte-2.91-gtk4
  _pick gtk4 usr/include/vte-2.91-gtk4
  _pick gtk4 usr/lib/libvte-2.91-gtk4.so*
  _pick gtk4 usr/lib/pkgconfig/vte-2.91-gtk4.pc
  _pick gtk4 usr/lib/girepository-1.0/Vte-3.91.typelib
  _pick gtk4 usr/share/gir-1.0/Vte-3.91.gir
  _pick gtk4 usr/share/vala/vapi/vte-2.91-gtk4.{deps,vapi}

  _pick docs usr/share/doc
}

package_vte3-git() {
  pkgdesc+=" (GTK3)"
  depends=(
    cairo
    fribidi
    gnutls
    gtk3
    pcre2
    vte-common
  )

  provides+=(
    "${pkgname%-git}=${pkgver%%.r*}"
    libvte-2.91.so
  )
  conflicts+=("${pkgname%-git}")

  mv gtk3/* "$pkgdir"
}

package_vte4-git() {
  pkgdesc+=" (GTK4)"
  depends=(
    cairo
    fribidi
    gnutls
    gtk4
    pcre2
    vte-common
  )

  provides+=(
    "${pkgname%-git}=${pkgver%%.r*}"
    libvte-2.91-gtk4.so
  )
  conflicts+=("${pkgname%-git}")

  mv gtk4/* "$pkgdir"
}

package_vte-docs-git() {
  pkgdesc+=" (documentation)"
  arch=(any)

  provides+=("${pkgname%-git}=${pkgver%%.r*}")
  conflicts+=("${pkgname%-git}")

  mv docs/* "$pkgdir"
}
