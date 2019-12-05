# Maintainer: Husam Bilal <me@husam.dev>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Tobias Kieslich <tobias@justdreams.de>

pkgname=inkscape-gtk3
_pkgname=inkscape
pkgver=0.92.4
pkgrel=9
pkgdesc='Professional vector graphics editor'
url='https://inkscape.org/'
license=('GPL' 'LGPL')
arch=('x86_64')
depends=('gc' 'gsl' 'gdl' 'gtkmm' 'gtkspell' 'libmagick6' 'libxslt' 'poppler-glib' 'popt' 'potrace' 'ttf-dejavu' 'python2' 'libcdr' 'desktop-file-utils' 'hicolor-icon-theme')
makedepends=('boost' 'intltool' 'python')
optdepends=('gvfs: import clip art' 'pstoedit: latex formulas' 'python2-scour: optimized SVG output' 'texlive-core: latex formulas' 'python2-numpy: some extensions' 'python2-lxml: some extensions and filters')
provides=('inkscape')
source=("https://inkscape.org/gallery/item/13330/inkscape-0.92.4_A6N0YOn.tar.bz2")
sha256sums=('57ec2da8177b36614a513e2822efd73af721e690f7ddc6bd0a5fbb1525b4515e')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  ./autogen.sh

  sed -i 's|/usr/bin/python\>|/usr/bin/python2|g' cxxtest/*.py
  sed -i 's|/usr/bin/env python\>|/usr/bin/env python2|g' share/*/{test/,}*.py
  sed -i 's|"python" },|"python2" },|g' src/extension/implementation/script.cpp
  sed -i 's|python -c|python2 -c|g' configure share/extensions/uniconv*.py
  sed -i 's|"python"|"python2"|g' src/main.cpp
  sed -i 's| abs(| std::fabs(|g' src/ui/tools/flood-tool.cpp

  # Fix build with poppler 0.71
  sed -e 's|gTrue|true|g' -e 's|gFalse|false|g' -e 's|GBool|bool|g' -i src/extension/internal/pdfinput/pdf-parser.*
  # Fix build with poppler 0.72
  sed -e 's|getCString|c_str|g' -i src/extension/internal/pdfinput/*
  # Fix build with poppler 0.76
  sed -e 's|new Lexer(xref, obj)|obj|g' -i src/extension/internal/pdfinput/pdf-parser.cpp
  # Fix build with poppler 0.82
  sed -e 's|Unicode \*u|Unicode const *u|g' -i src/extension/internal/pdfinput/*
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  export PKG_CONFIG_PATH='/usr/lib/imagemagick6/pkgconfig'
  export FREETYPE_CONFIG="/usr/bin/pkg-config freetype2"

  ./configure \
    --prefix=/usr \
    --with-python \
    --with-perl \
    --enable-lcms \
    --enable-poppler-cairo \
    --disable-strict-build \
    --disable-dependency-tracking \
    --enable-gtk3-experimental
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
