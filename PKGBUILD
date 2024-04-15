# Maintainer: xiota / aur.chaotic.cx

_pkgname='geany-plugin-preview'
pkgname="$_pkgname"
pkgdesc="Geany plugin to preview lightweight markup languages"
url="https://github.com/xiota/geany-preview"
pkgver=0.1.2
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
)
optdepends=(
  'asciidoc: Preview AsciiDoc'
  'asciidoctor: Preview AsciiDoc'
  'pandoc: Preview many other file formats'

  # AUR
  'ttf-courier-prime: Export Fountain screenplays to PDF'
)

_pkgsrc="geany-preview"
source=("$_pkgsrc"::"git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

options=(!lto)

build() {
  cd "$_pkgsrc"
  meson rewrite kwargs set project / version "$pkgver"

  local _meson_args=(
    --buildtype=plain
    --prefix=/usr
    --libexecdir=lib
    --sbindir=bin
    --auto-features=enabled
    -Db_pie=true
    -Db_lto=false
  )
  meson setup "${_meson_args}" ../build
  meson compile -C ../build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
