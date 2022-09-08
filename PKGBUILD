# Maintainer: Sergii Fesenko <sergii underscore f dot at outlook dot com>

pkgname=lite-xl-git
_pkgname=${pkgname%-git}
pkgver=v2.1.0.r1970.334ef427
pkgrel=1
pkgdesc='A lightweight text editor written in Lua (master branch)'
arch=('x86_64')
url="https://lite-xl.github.io/"
license=('MIT')
depends=(
  'lua'
  'sdl2'
  'freetype2'
  'pcre2'
  'hicolor-icon-theme'
)
makedepends=('meson>=0.58' 'jq')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("${_pkgname}::git+https://github.com/lite-xl/lite-xl")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"

  # git describe --tags --long --exclude 'testing*' | sed 's/^v//; s/\([^-]*-g\)/r\1/; s/-/./g'

  V=$(meson introspect --projectinfo _build | jq -r '.version')
  CNT=$(git rev-list --count HEAD)
  H=$(git rev-parse --short HEAD)
  echo v${V}.r${CNT}.${H}
}

prepare() {
  cd "${_pkgname}"
  arch-meson _build
}

build() {
  cd "${_pkgname}"
  meson compile -C _build
}

package() {
  cd "${_pkgname}"
  DESTDIR="$pkgdir" meson install --skip-subprojects -C _build

  mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
  ln -s "/usr/share/doc/lite-xl/licenses.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
