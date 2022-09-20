# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

# shellcheck disable=SC2034
_pkg="libsoup"
_pkgbase="${_pkg}3"
pkgbase="${_pkgbase}-git"
pkgname=("${pkgbase}" "${_pkgbase}-docs-git")
pkgver=3.2.0+r1+g3be74a58
pkgrel=1
pkgdesc="HTTP client/server library for GNOME"
url="https://wiki.gnome.org/Projects/${_pkg}"
arch=(x86_64)
license=(LGPL)
depends=(
  brotli
  glib-networking 
  glib2 
  krb5
  libnghttp2
  libpsl
  libsysprof-capture
  sqlite
)
makedepends=(
  gi-docgen
  git
  gobject-introspection
  meson
  python-quart
  samba
  vala
)
checkdepends=(
  apache
  php-apache
)
options=(debug)
source=("git+https://gitlab.gnome.org/GNOME/${_pkg}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkg}" || exit
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd "${_pkg}" || exit
}

build() {
  local meson_options=(
    -D autobahn=disabled
  )
  arch-meson "${_pkg}" build "${meson_options[@]}"
  meson compile -C build
}

check() {
  # Python's output buffering messes with the tests reading stdout lines from
  # http2-server.py through a pipe
  PYTHONUNBUFFERED=1 meson test -C build --print-errorlogs
}

package_libsoup3-git() {
  depends+=(
    libbrotlidec.so
    libgssapi_krb5.so
    libg{lib,object,io}-2.0.so
    libpsl.so
  )
  optdepends=('samba: Windows Domain SSO')
  provides+=("${_pkg}-3.0.so"
             "${_pkgbase}")
  conflicts+=("${_pkgbase}")

  # shellcheck disable=SC2154
  meson install -C build --destdir "${pkgdir}"

  mkdir -p doc/usr/share
  mv {"${pkgdir}",doc}/usr/share/doc
}

package_libsoup3-docs-git() {
  pkgdesc+=" (documentation)"
  depends=()
  conflicts+=("${_pkgbase}-docs-git")

  mv doc/* "${pkgdir}"
}

# vim:set sw=2 sts=-1 et:
