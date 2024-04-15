# Maintainer: xiota / aur.chaotic.cx

## options
: ${_branch:=main}

## basic info
_pkgname='geany-plugin-preview'
pkgname="$_pkgname-git"
pkgdesc="Geany plugin to preview lightweight markup languages"
url="https://github.com/xiota/geany-preview"
pkgver=0.1.2.r0.gfffc62a
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

provides+=("$_pkgname")
conflicts+=("$_pkgname")

options=(!lto)

_pkgsrc="geany-preview"
source=("$_pkgsrc"::"git+$url.git#branch=$_branch")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"

  local _pkgver=$(
    git describe --long --tags --abbrev=7 \
      | sed 's/^[^0-9]*//;s/\([^-]*-g\)/r\1/;s/-/./g'
  )

  [[ "$_branch" != "main" ]] && _pkgver+=".$_branch"

  echo "$_pkgver"
}

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
