# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgbase=libsoup
pkgname=(libsoup libsoup-docs)
pkgver=2.74.3
pkgrel=2
pkgdesc="HTTP client/server library for GNOME"
url="https://wiki.gnome.org/Projects/libsoup"
arch=(x86_64)
license=(LGPL)
depends=(
  brotli
  glib-networking
  glib2
  krb5
  libpsl
  libsysprof-capture
  libxml2
  sqlite
)
makedepends=(
  git
  glib2-devel
  gobject-introspection
  gtk-doc
  meson
  samba
  vala
)
checkdepends=(
  apache
  php-apache
)
_commit=4a6b9178ded85e269872ffedfb2b18f2754a75d9  # tags/2.74.3^0
source=("git+https://gitlab.gnome.org/GNOME/libsoup.git#commit=$_commit"
        disable-flaky-test.diff)
b2sums=('SKIP'
        '4d71171b26ed107884a22696f9df1609c45c377e27baaaeb4ec5d890f9fbd62f09607ba3da0acdb42b4f86b9e828014471e6731437ec80de3b6ad98d7f0a2f60')

pkgver() {
  cd libsoup
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd libsoup

  # https://gitlab.gnome.org/GNOME/libsoup/-/issues/120
  git apply -3 ../disable-flaky-test.diff
}

build() {
  local meson_options=(
    -D gtk_doc=true
  )
  arch-meson libsoup build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package_libsoup() {
  depends+=(
    libbrotlidec.so
    libgssapi_krb5.so
    libg{lib,object,io}-2.0.so
    libpsl.so
  )
  optdepends=('samba: Windows Domain SSO')
  provides+=(libsoup{,-gnome}-2.4.so)

  meson install -C build --destdir "$pkgdir"

  mkdir -p doc/usr/share
  mv {"$pkgdir",doc}/usr/share/gtk-doc
}

package_libsoup-docs() {
  pkgdesc+=" (documentation)"
  depends=()

  mv doc/* "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
