# Maintainer: xiota / aur.chaotic.cx

_pkgname='geany-plugin-preview'
pkgname="$_pkgname-git"
pkgdesc="Plugin for Geany to preview lightweight markup languages"
url="https://github.com/xiota/geany-preview"
pkgver=0.1.0.r2.g514930d
pkgrel=1
license=('GPL-3.0-or-later')
arch=('x86_64')

depends=(
  'cmark-gfm'
  'geany'
  'libpodofo.so' # podofo
  'webkit2gtk-4.1'
)
makedepends=(
  'cmake'
  'git'
  'ninja'
)
optdepends=(
  'asciidoc: Preview AsciiDoc'
  'asciidoctor: Preview AsciiDoc'
  'pandoc: Preview many other file formats'

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

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DCMAKE_INSTALL_LIBDIR='lib'
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
