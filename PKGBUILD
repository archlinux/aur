# Maintainer: xiota / aur.chaotic.cx

: ${_ftn2xml_ver:=0.2.0}

_pkgname='geany-plugin-preview'
pkgname="$_pkgname"
pkgdesc="Plugin for Geany to preview markdown and other markup languages"
url="https://github.com/xiota/geany-preview"
pkgver=0.2.3
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
  'git'
  'meson'
  'tomlplusplus'
)
optdepends=(
  'asciidoctor: For AsciiDoc'
  'pandoc: For many other file formats'
  'ttf-courier-prime: To export Fountain to PDF' # AUR
)

options=('!debug' '!lto' '!strip')

_pkgsrc="geany-preview"
source=(
  "$_pkgsrc"::"git+$url.git#tag=v$pkgver"
  "ftn2xml"::"git+https://github.com/xiota/ftn2xml.git#tag=v$_ftn2xml_ver"
)
sha256sums=(
  'faa3436ad4ebfc1b21a412c58cf9571987714f50dc016597f5e33b74d5927cb1'
  'f54063c940cb52a35eba78c5bf5fcc44c6963e78135936227e647d22e490c338'
)

prepare() {
  ln -sf "$srcdir/ftn2xml" "$_pkgsrc/subprojects/ftn2xml"
}

build() {
  arch-meson build "$_pkgsrc"
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
