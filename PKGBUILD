# Maintainer: Chris Severance aur.severach AatT spamgourmet.com
# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>

set -u
pkgname=libgxps
pkgname+='-git'
pkgver=0.3.2.r6.g665dc29
pkgrel=1
pkgdesc="XPS Documents library"
url="https://wiki.gnome.org/Projects/libgxps"
arch=(x86_64)
arch+=('i686')
license=(GPL2)
depends=(
  cairo
  freetype2
  glib2
  lcms2
  libarchive
  libjpeg-turbo
  libpng
  libtiff
)
makedepends=(
  git
  gobject-introspection
  gtk-doc
  gtk3
  meson
)
provides=("${pkgname%-git}=${pkgver%.r*}")
conflicts=("${pkgname%-git}")
#_verwatch=("${url}" "/browse/${_pkgname}/snapshot/${_pkgname}-\([0-9\.]\+\)\.tar\.xz" 'l')
_srcdir="${pkgname%-git}"
source=("git+https://gitlab.gnome.org/GNOME/libgxps.git")
md5sums=('SKIP')
sha256sums=('SKIP')
b2sums=('SKIP')

pkgver() {
  set -u
  cd "${_srcdir}"
  git describe --tags --long | sed -E -e 's/([^-]*-g)/r\1/' -e 's/-/./g' #-e 's/v//'
  set +u
}

prepare() {
  set -u
  cd "${_srcdir}"
  set +u
}

build() {
  set -u
  local meson_options=(
    -D enable-man=true
    -D enable-gtk-doc=true
  )

  arch-meson libgxps build "${meson_options[@]}"
  meson compile -C build
  set +u
}

check() {
  set -u
  meson test -C build --print-errorlogs
  set +u
}

package() {
  set -u
  meson install -C build --destdir "$pkgdir"
  set +u
}
set +u

# vim:set sw=2 sts=-1 et:
