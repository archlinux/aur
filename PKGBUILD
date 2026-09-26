# Maintainer: Tillmann Severin <tillmann.zipperer@web.de>
pkgname=polkit-libs
pkgver=127
pkgrel=1
pkgdesc="Application development toolkit for controlling system-wide privileges (libs only)"
url="https://github.com/polkit-org/polkit"
arch=(x86_64)
license=(LGPL-2.0-or-later)
depends=(
  systemd-libs
  glib2
  glibc
)
makedepends=(
  git
  glib2-devel
  gobject-introspection
  meson
)
checkdepends=(python-dbusmock)
provides=(libpolkit-{agent,gobject}-1.so)
source=(
  "git+$url#tag=$pkgver"
)
b2sums=('6744385984906d97f79aedbfeb894ff274769212af44686b90f6c5ab7f3007d0e6db91b5439c95f344621aa447b570686d46eff7fac861854cfcd37fba5e73e5')

prepare() {
  cd polkit
}

build() {
  local meson_options=(
    -D tests=true
    -D libs-only=true
  )

  arch-meson polkit build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs -t 3
}

package() {
  meson install -C build --destdir "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
