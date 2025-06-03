# Maintainer: Jan Wütherich <jan (at) wuetherich (dot) de>
# Contributor: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Sebastian Krzyszkowiak <dos@dosowisko.net>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
pkgname=libqmi-git
pkgver=1.36.0.r24.g9ad80dc
pkgrel=1
pkgdesc="QMI modem protocol helper library"
url="https://www.freedesktop.org/wiki/Software/libqmi/"
arch=(x86_64)
license=('GPL-2.0-or-later AND LGPL-2.1-or-later')
depends=(
  bash
  gcc-libs
  glib2
  glibc
  libgudev
  libmbim
  libqrtr-glib
)
makedepends=(
  bash-completion
  git
  gobject-introspection
  help2man
  meson
)
source=(git+https://gitlab.freedesktop.org/mobile-broadband/libqmi.git)
b2sums=('SKIP')

pkgver() {
  cd libqmi
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd libqmi
}

build() {
  local meson_options=(
    -D gtk_doc=false
  )

  arch-meson libqmi build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs --no-rebuild
}

package_libqmi-git() {
  provides=(libqmi libqmi-glib.so)
  conflicts=(libqmi)

  meson install -C build --destdir "$pkgdir" --no-rebuild
}
