# Maintainer: Julien Virey <julien.virey+aur@gmail.com>

pkgname="termite-git"
pkgver=16.14.r0.gdb0960d
pkgrel=1
pkgdesc='A simple VTE-based terminal'
url="https://github.com/BarbUk/termite"
license=('LGPL-2.0-or-later')
arch=('x86_64')

depends=(
  'gnutls'
  'gtk3'
  'pcre2'
  'vte-common'
)
makedepends=(
  'git'
  'glib2-devel'
  'gperf'
  'meson'
)

provides=("${pkgname%-git}=${pkgver%%.r*}")
conflicts=("${pkgname%-git}")

source=(
  "$pkgname::git+$url.git"
  "$pkgname.vte::git+"${url%/*}"/vte.git"
)
sha256sums=('SKIP'
            'SKIP')

backup=(etc/xdg/termite/config)

prepare() {
  local _vte_hash=$(grep -Po '(?<=revision = )[a-f0-9]+$' "$pkgname/subprojects/vte.wrap")
  ln -s "$srcdir/$pkgname.vte" "$pkgname/subprojects/vte"
  git -c advice.detachedHead=false -C "$pkgname.vte" checkout -f "$_vte_hash"
}

pkgver() {
  cd "$pkgname"
  git describe --long --tags --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  arch-meson --wrap-mode=forcefallback build "$pkgname"
  meson compile -C build
}

package() {
  meson install -C build --skip-subprojects vte --destdir "$pkgdir"
}
