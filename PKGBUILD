# Maintainer: Sergii Fesenko <sergii underscore f dot at outlook dot com>

pkgname=lite-xl-luajit-git
pkgver=2.0.5.luajit.r10.gfb651b69
pkgrel=1
pkgdesc='A lightweight text editor written in Lua (luajit branch)'
arch=('x86_64')
url="https://lite-xl.github.io/"
license=('MIT')
depends=(
  'luajit'
  'sdl2'
  'freetype2'
  'pcre2'
  'hicolor-icon-theme'
)
makedepends=('meson>=0.58')
provides=("lite-xl")
conflicts=("lite-xl")
source=(
  # "${pkgname}::git+https://github.com/jgmdev/lite-xl#branch=build-luajit"            # 2.1.0, rebase over master
  "${pkgname}::git+https://github.com/lite-xl/lite-xl#branch=master-luajit21-2.0"    # 2.0.5
)
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --tags --long  | sed 's/^v//; s/\([^-]*-g\)/r\1/; s/-/./g'
}

build() {
  cd "${pkgname}"
  # meson --prefix=/usr _build -Djit=trur
  meson --prefix=/usr _build
  meson compile -C _build
}

package() {
  cd "${pkgname}"
  meson install --destdir=$pkgdir --skip-subprojects -C _build

  mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
  ln -s "/usr/share/doc/lite-xl/licenses.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
