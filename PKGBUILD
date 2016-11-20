# Maintainer: Adam Reichold <adam.reichold@t-online.de>

pkgname=qpdfview
pkgver=0.4.17beta1
pkgrel=1
pkgdesc='A tabbed PDF viewer using the poppler library.'
arch=('i686' 'x86_64' 'armv7h')
url='https://launchpad.net/qpdfview'
license=('GPL2')
depends=('libcups' 'poppler-qt5' 'qt5-svg' 'desktop-file-utils' 'hicolor-icon-theme')
optdepends=('texlive-bin: for shared SyncTeX parser library (required at build time)'
            'libspectre: for PostScript support (required at build time)'
            'djvulibre: for DjVu support (required at build time)')
makedepends=('qt5-tools')
source=("https://launchpad.net/$pkgname/trunk/$pkgver/+download/$pkgname-$pkgver.tar.gz")
sha256sums=('a3bcc6b455c0640e95b393d6f4eabf05000ceb12f424d96f55bd3143bacc9fca')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  
  if ! pkg-config --exists libspectre; then
    local config="$config without_ps"
  fi
  
  if ! pkg-config --exists ddjvuapi; then
    local config="$config without_djvu"
  fi

  lrelease-qt5 qpdfview.pro
  qmake-qt5 "CONFIG+=$config" qpdfview.pro
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make "INSTALL_ROOT=$pkgdir" install

  if pkg-config --exists synctex; then
    depends=("${depends[@]}" 'texlive-bin')
  fi
}

