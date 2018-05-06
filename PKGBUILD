# Maintainer: Adam Reichold <adam.reichold@t-online.de>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=qpdfview-bzr
pkgver=2070
pkgrel=1
pkgdesc='A tabbed PDF viewer using the poppler library. (development version)'
arch=('i686' 'x86_64' 'armv7h')
url='https://launchpad.net/qpdfview'
license=('GPL2')
depends=('libcups' 'qt5-svg' 'desktop-file-utils' 'hicolor-icon-theme')
optdepends=('texlive-bin: for shared SyncTeX parser library (required at build time)'
            'poppler-qt5: for PDF support (required at build time)'
            'libspectre: for PostScript support (required at build time)'
            'djvulibre: for DjVu support (required at build time)')
makedepends=('bzr' 'qt5-tools')
conflicts=('qpdfview')
source=('qpdfview::bzr+http://bazaar.launchpad.net/~adamreichold/qpdfview/trunk/')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/qpdfview"
  
  bzr revno
}

build() {
  cd "$srcdir/qpdfview"

  local config="with_lto"

  if ! pkg-config --exists poppler-qt5; then
    local config="$config without_pdf"
  fi
  
  if ! pkg-config --exists libspectre; then
    local config="$config without_ps"
  fi
  
  if ! pkg-config --exists ddjvuapi; then
    local config="$config without_djvu"
  fi

  lrelease-qt5 qpdfview.pro qpdfview.pro
  qmake-qt5 "CONFIG+=$config" qpdfview.pro
  make
}

package() {
  cd "$srcdir/qpdfview"

  make "INSTALL_ROOT=$pkgdir" install

  if pkg-config --exists synctex; then
    depends=("${depends[@]}" 'texlive-bin')
  fi
}
