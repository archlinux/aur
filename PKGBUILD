# Maintainer: xiota / aur.chaotic.cx

_pkgname='geany-plugin-preview'
pkgname="$_pkgname-git"
pkgdesc="Plugin for Geany to preview lightweight markup languages"
url="https://github.com/xiota/geany-preview"
pkgver=0.1.0.r0.g70f071a
pkgrel=1
license=('GPL-3.0-or-later')
arch=('x86_64')

depends=(
  'cmark-gfm'
  'geany'
  'libpodofo.so' # podofo
  'webkit2gtk'
)
makedepends=(
  'git'
)
optdepends=(
  # AUR
  'ttf-courier-prime: Export Fountain screenplays to PDF'
)

provides+=("$_pkgname")
conflicts+=("$_pkgname")

: ${_branch:=main}

_pkgsrc="geany-preview"
source=("$_pkgsrc"::"git+$url.git#branch=$_branch")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"

  git describe --long --tags --abbrev=7 \
    | sed 's/^[^0-9]*//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgsrc"
  autoreconf -vfi

  local _configure_options=(
    --prefix='/usr'
  )

  ./configure "${_configure_options[@]}"
}


build() {
  cd "$_pkgsrc"
  make
}

package() {
  cd "$_pkgsrc"
  make install DESTDIR="$pkgdir"
}
