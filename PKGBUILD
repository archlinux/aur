# Maintainer: xiota / aur.chaotic.cx

_pkgname='geany-plugin-preview'
pkgname="$_pkgname-git"
pkgdesc="Plugin for Geany to preview markdown and other markup languages"
url="https://github.com/xiota/geany-preview"
pkgver=0.2.4.r4.gcf00e5b
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

provides=("$_pkgname")
conflicts=("$_pkgname")

options=('!debug' '!lto' '!strip')

_pkgsrc="geany-preview"
source=(
  "$_pkgsrc"::"git+$url.git"
  'git+https://github.com/xiota/ftn2xml.git'
)
sha256sums=(
  'SKIP'
  'SKIP'
)

prepare() {
  ln -sf "$srcdir/ftn2xml" "$_pkgsrc/subprojects/ftn2xml"
}

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  printf '%s' "${pkgver/.r/+r}" > "$_pkgsrc/version.txt"

  arch-meson build "$_pkgsrc"
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
