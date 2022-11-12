# Maintainer: Sergii Fesenko <sergii underscore f dot at outlook dot com>

pkgname=lite-xl-luajit-git
pkgver=2.1.0.r2054.00f9747
pkgrel=1
pkgdesc='A lightweight text editor written in Lua (luajit build)'
arch=('x86_64')
url="https://github.com/lite-xl/lite-xl/pull/880"
license=('MIT')
depends=(
  'luajit'
  'sdl2'
  'freetype2'
  'pcre2'
  'hicolor-icon-theme'
)
makedepends=('meson>=0.58', 'jq')
provides=("lite-xl")
conflicts=("lite-xl")
source=(
    "${pkgname}::git+https://github.com/jgmdev/lite-xl#branch=build-luajit"           # 2.1.0, rebase over master
#  "${pkgname}::git+https://github.com/lite-xl/lite-xl#branch=master-luajit21-2.0"    # 2.0.5
)
sha256sums=('SKIP')

prepare() {
  arch-meson --prefix=/usr _build "${pkgname}" -Djit=true
}

pkgver() {
  # git describe --tags --long --exclude 'testing*' | sed 's/^v//; s/\([^-]*-g\)/r\1/; s/-/./g'
  V=$(meson introspect --projectinfo _build | jq -r '.version')
  cd ${pkgname}
  CNT=$(git rev-list --count HEAD)
  H=$(git rev-parse --short HEAD)
  echo ${V}.r${CNT}.${H}
}

build() {
  meson compile -C _build
}

package() {
  meson install --destdir=$pkgdir --skip-subprojects -C _build

  mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
  ln -s "/usr/share/doc/lite-xl/licenses.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}

