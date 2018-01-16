# Maintainer: Michael Straube <straubem@gmx.de>
# Contributor: Seth Schroeder <theking@kingdomofseth.com>
# Contributor: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=leocad
pkgver=18.01
pkgrel=1
pkgdesc="A CAD program for creating virtual LEGO models"
arch=('i686' 'x86_64')
url="http://leocad.org"
license=('GPL' 'CCPL: cc-by-2.0')
depends=('qt5-base' 'hicolor-icon-theme')
makedepends=('qt5-tools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/leozide/leocad/archive/v$pkgver.tar.gz"
        "$pkgname-$pkgver-library.zip::https://github.com/leozide/leocad/releases/download/v$pkgver/Library-Linux-10289.zip")
sha256sums=('9f10b66e8c05a8b559e11d05506d592e7c6eaad222cd6cfeb8a18aa33ee2999c'
            'e71ef2b995be42aa1919eb755b118512105c0dd93d53b7e21c3189818d7ccfb8')

prepare() {
  bsdtar -xf complete.zip
  mkdir -p build
}

build() {
  cd build
  qmake-qt5 ../$pkgname-$pkgver \
    INSTALL_PREFIX=/usr \
    DISABLE_UPDATE_CHECK=1 \
    LDRAW_LIBRARY_PATH=/usr/share/leocad/ldraw
  make
}

package() {
  cd build
  make INSTALL_ROOT="$pkgdir" install
  install -d "$pkgdir"/usr/share/{leocad/ldraw,licenses/leocad}
  cp -r ../ldraw/{models,p,parts,*.ldr} "$pkgdir"/usr/share/leocad/ldraw/
  install -m644 ../ldraw/{CAlicense.txt,CAreadme.txt} "$pkgdir"/usr/share/licenses/leocad/
}
