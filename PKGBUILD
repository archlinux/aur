# Maintainer: Alfonso de la Guarda <alfonsodg at gmail dot com>
pkgname=neomarker-git
pkgver=v2026.11.16.r0.g464d187
pkgrel=1
pkgdesc="Markdown editor with Mermaid 12, batch PDF export, dark mode and security fixes"
arch=('x86_64')
url="https://github.com/alfonsodg/NeoMarker"
license=('GPL-3.0-or-later')
depends=(
  'gtk3'
  'gtksourceview4'
  'gtkspell3'
  'webkit2gtk-4.1'
)
makedepends=(
  'git'
  'itstool'
  'meson'
)
optdepends=(
  'mathjax2: alternative backend for rendering formulas'
  'pandoc: export to HTML, PDF, RTF, ODT, DOCX, LaTeX'
  'yelp: in-app help'
)
provides=('neomarker')
conflicts=('neomarker' 'neomarker-bin' 'marker' 'marker-enhanced-bin' 'marker-enhanced-git')
replaces=('marker-enhanced-git')
source=('git+https://github.com/alfonsodg/NeoMarker.git'
        'git+https://github.com/Mandarancio/scidown.git'
        'git+https://github.com/Mandarancio/charter.git'
        'git+https://github.com/codeplea/tinyexpr.git')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd NeoMarker
  git describe --long --tags --abbrev=7 2>/dev/null | sed -r 's/([^-]*-g)/r\1/;s/-/./g' || \
    printf "%s.r%s.%s" "2026.11.15" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd NeoMarker
  git submodule init
  git config submodule.src/scidown.url "$srcdir/scidown"
  git -c protocol.file.allow=always submodule update

  cd src/scidown
  git submodule init
  git config submodule.src/charter.url "$srcdir/charter"
  git -c protocol.file.allow=always submodule update

  cd src/charter
  git submodule init
  git config submodule.src/tinyexpr.url "$srcdir/tinyexpr"
  git -c protocol.file.allow=always submodule update
}

build() {
  export CFLAGS=${CFLAGS/ -O2}
  cd NeoMarker
  meson setup builddir --prefix=/usr --buildtype=plain
  ninja -C builddir
}

package() {
  cd NeoMarker
  DESTDIR="$pkgdir" meson install -C builddir --no-rebuild
}
