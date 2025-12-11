# Maintainer: xiota / aur.chaotic.cx

: ${_ftn2xml_ver:=0.2.0}

_pkgname='geany-plugin-preview'
pkgname="$_pkgname"
pkgdesc="Plugin for Geany to preview markdown and other markup languages"
url="https://github.com/xiota/geany-preview"
pkgver=0.2.4
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
  '5a5a228620e0760bb2dfbf03dbdb89487ca7ac9b5c258f3239b25183b1e7379f'
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
