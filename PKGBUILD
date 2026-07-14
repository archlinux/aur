# Maintainer: Rohit Goswami (HaoZeke) <rohit.goswami@aol.com>
pkgname=pp-git
_pkgname=pp
pkgver=r198.2708b25
pkgrel=1
pkgdesc="PP is a text preprocessor designed for Pandoc (and more generally Markdown and reStructuredText)"
arch=('x86_64')
url="https://cdelord.fr/pp"
license=('GPL-3.0-or-later')
depends=('gmp')
makedepends=('git' 'stack' 'wget')
optdepends=(
  'asymptote: vector graphics support'
  'graphviz: GraphViz/dot diagrams'
  'r: R figures and scripts'
  'java-runtime: PlantUML/ditaa diagrams (jars embedded in binary)'
  'blockdiag: blockdiag diagrams'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
# LTO flags break stack's GHC bindist configure (SIZEOF_VOID_P / ld.lld main)
options=(!lto)
source=("${_pkgname}::git+https://github.com/CDSoft/pp.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "${_pkgname}"
  # makepkg injects hardened CFLAGS/LDFLAGS; GHC 9.2 bindist configure fails under
  # -flto / -fuse-ld=lld (undefined main in sizeof conftest). Use a clean toolchain.
  unset LDFLAGS CPPFLAGS
  export CFLAGS="-Wno-implicit-function-declaration"
  export CXXFLAGS="$CFLAGS"
  # Upstream Makefile: stack build + embed plantuml/ditaa jars (network for stack LTS + jars)
  make compile
}

package() {
  cd "${_pkgname}"
  local _bin
  _bin="$(stack path --local-install-root)/bin/pp"
  install -Dm755 "$_bin" "$pkgdir/usr/bin/pp"
}
