# Maintainer:

_pkgname="suil"
pkgname="$_pkgname-optgui"
pkgver=0.10.26
pkgrel=1
pkgdesc="A lightweight C library for loading and wrapping LV2 plugin UIs"
url="https://gitlab.com/lv2/suil"
license=(
  '0BSD'
  'ISC'
)
arch=('x86_64')

depends=('lv2')
makedepends=(
  'gtk3'
  'meson'
  'qt6-base'
)

provides=(
  "$_pkgname"
  'libsuil-0.so'
)
conflicts=("$_pkgname")

_pkgsrc="$_pkgname-v$pkgver"
_pkgext="tar.gz"
source=("$_pkgname-$pkgver.$_pkgext"::"$url/-/archive/v${pkgver}/suil-v${pkgver}.$_pkgext")
sha256sums=('7087e6eb13d4a5ebfd5be6c59277ec068bbcfe60b90db3bb58e58d79c0f2d465')

build() {
  local meson_options=(
    -D cocoa=disabled
    -D docs=disabled
    -D gtk2=disabled
    -D qt5=disabled
  )

  arch-meson "${meson_options[@]}" "$_pkgsrc" build
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  optdepends=(
    'gtk3'
    'qt6-base'
  )

  meson install -C build --destdir "$pkgdir"

  install -vDm 644 "$_pkgsrc"/LICENSES/* -t "$pkgdir/usr/share/licenses/$pkgname/"
}
