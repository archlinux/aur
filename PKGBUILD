# Maintainer: Markus Heidelberg <markus.heidelberg@web.de>
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Matthias Maennich <arch@maennich.net>
# Contributor: <boenki@gmx.de>

pkgname=qlandkartegt
pkgver=1.8.1
pkgrel=9
pkgdesc="Use your GPS with Linux"
arch=('i686' 'x86_64')
url="http://www.qlandkarte.org/"
license=('GPL')
depends=('gdal' 'gpsd' 'libdmtx' 'libexif' 'libmariadbclient' 'glu'
         'postgresql-libs' 'shared-mime-info' 'qt5-script' 'qt5-multimedia'
         'qt5-webkit' 'qt5-serialport' 'proj')
makedepends=('cmake' 'garmindev' 'mesa' 'qt5-tools')
optdepends=('garmindev: to connect garmin devices')
changelog=$pkgname.changelog
source=(https://bitbucket.org/maproom/qlandkarte-gt/downloads/$pkgname-$pkgver.tar.gz
        $pkgname-mimetypes.xml
        fix-qt5-build.patch
        fix-ver_str.patch
        fix-qtgui-include.patch)
sha256sums=('9e0605ab8f4cbd27741b507f252f08370e9ccca4e05ec35878256c59b22a9be7'
            'e8d33948831f8a66edd752c71c653085d6c4d9f1969e70dd8c40b9c7ca37fba0'
            'e71d843289f8f1099388a431bf488281232344b9ce6c0a28d1a60f68b6ec3e4b'
            '143a79f7ff17850faf571f65f719db0d68de6e8d2943790431d21776e7b67458'
	    '44da55424a616a74114882a7b4f1bad81d2d9d506b747b7984a5faf493362d17')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -i ../fix-qt5-build.patch
  patch -Np1 -i ../fix-ver_str.patch
  patch -Np1 -i ../fix-qtgui-include.patch

  cd "${srcdir}"
  mkdir build
}

build() {
  cd "${srcdir}"/build

  cmake ../${pkgname}-${pkgver} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DQK_QT5_PORT=ON
  make
}

package(){
  cd "${srcdir}"/build

  make DESTDIR="${pkgdir}" install

  install -Dm644 "${srcdir}"/$pkgname-mimetypes.xml \
    "${pkgdir}"/usr/share/mime/packages/$pkgname-mimetypes.xml
}
