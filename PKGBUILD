# Maintainer: Alfonso de la Guarda <alfonsodg at gmail dot com>
pkgname=marker-enhanced-git
pkgver=2026.04.25
pkgrel=1
pkgdesc="Markdown editor for Linux with Mermaid 10.9, batch PDF export, dark mode, and security fixes"
arch=('x86_64')
url="https://github.com/alfonsodg/Marker"
license=('GPL-3.0-or-later')
depends=(
  'gtk3'
  'gtksourceview3'
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
  'pandoc: export to HTML, PDF, RTF, OTF, DOCX, LaTeX'
  'yelp: in-app help'
)
provides=('marker')
conflicts=('marker' 'marker-git')
source=('git+https://github.com/alfonsodg/Marker.git'
        'git+https://github.com/Mandarancio/scidown.git'
        'git+https://github.com/Mandarancio/charter.git'
        'git+https://github.com/codeplea/tinyexpr.git')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd Marker
  git describe --long --tags --abbrev=7 2>/dev/null | sed -r 's/([^-]*-g)/r\1/;s/-/./g' || \
    printf "%s.r%s.%s" "2020.04.04" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd Marker
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
  arch-meson Marker build
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
