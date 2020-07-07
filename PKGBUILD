# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
# Contributor: Davide Depau <davide@depau.eu>
_pkgname="obs-xdg-portal"
pkgname="${_pkgname}-git"
pkgver=0.1.2.r0.gfc5876a
pkgrel=2
pkgdesc="OBS Studio plugin using the Desktop portal for Wayland & X11 screencasting"
arch=(x86_64)
url="https://gitlab.gnome.org/feaneron/$_pkgname"
license=('GPL')
depends=('obs-studio' 'gst-plugins-base-libs' 'xdg-desktop-portal')
makedepends=('meson' 'git')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("git+$url"
        'fix-timestamp.patch')
sha256sums=('SKIP'
            'e7fd7d3455a4b73cf750328d47ea3667d576106207a784ab2ce62c99eeb48813')

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  # https://gitlab.gnome.org/feaneron/obs-xdg-portal/-/merge_requests/4
  git apply "$srcdir/fix-timestamp.patch"
}

build() {
  arch-meson "${_pkgname}" build
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
