# Maintainer: Jefferson Gonzalez <jgmdev@gmail.com>

pkgname=pragtical-git
_pkgname=pragtical
pkgver=latest.r0.g10cecbe
pkgrel=1
pkgdesc='The practical and pragmatic code editor.'
arch=('x86_64')
url="https://github.com/pragtical/pragtical"
license=('MIT')
depends=('luajit' 'sdl2' 'freetype2' 'pcre2' 'uchardet' 'hicolor-icon-theme')
makedepends=('meson>=0.58')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/pragtical/pragtical")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --tags --long | sed 's/^v//; s/\([^-]*-g\)/r\1/; s/-/./g'
}

build() {
  cd "${_pkgname}"
  arch-meson --wrap-mode default --buildtype debugoptimized -Duse_system_lua=true build
  meson compile -C build
}

package() {
  cd "$_pkgname"
  DESTDIR="$pkgdir" meson install --skip-subprojects -C build

  mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
  ln -s "/usr/share/doc/pragtical/licenses.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
