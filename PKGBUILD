# Maintainer: Lex Black <autumn-wind@web.de>

_pkgname=waybox
pkgname=waybox-git
pkgver=0.2.0.r29.g7fb889d
pkgrel=1
pkgdesc='Openbox clone on Wayland (git version)'
url="https://github.com/wizbright/waybox"
arch=('x86_64')
license=('MIT')
depends=('wlroots>=0.16.0' 'wlroots<0.18.0')
makedepends=('git' 'meson' 'wayland-protocols')
conflicts=(waybox)
provides=(waybox)
source=("git+https://github.com/wizbright/${_pkgname}.git"
        0001-missing_libxml2_import.patch)
md5sums=('SKIP'
         'd5c41683ab89c4f6e011ee35fdd52f0e')


pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  patch -Np2 -i "$srcdir"/0001-missing_libxml2_import.patch
}

build() {
  arch-meson "$_pkgname" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"

  mkdir -p "$pkgdir"/usr/share/licenses/$pkgname
  install -m 644 "$_pkgname"/LICENSE "$pkgdir"/usr/share/licenses/$pkgname
}
