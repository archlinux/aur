#Contributor: Urs Wolfer <uwolfer @ fwo.ch>
#Mantaince: Tilo Brueckner <blueperil @ gmx.de>

pkgname=kqrcode
pkgver=0.6.0
pkgrel=3
pkgdesc="A little program that is meant to encode/decode data to/from QR codes."
arch=(i686 x86_64)
url="http://kde-apps.org/content/show.php?content=143544"
license="GPL"
makedepends=('cmake')
depends=('kdelibs' 'qrencode' 'zbar-qt' 'automoc4')
source=(${pkgname}-${pkgver}.tar.gz::http://sourceforge.net/projects/kqrcode/files/${pkgname}-${pkgver}.tar.gz/download
        ${pkgname}-plugins-${pkgver}.tar.gz::http://sourceforge.net/projects/kqrcode/files/${pkgname}-plugins-${pkgver}.tar.gz/download
        ${pkgname}-dev-${pkgver}.tar.gz::http://sourceforge.net/projects/kqrcode/files/${pkgname}-dev-${pkgver}.tar.gz/download
        kqrcode-cmake.patch)
md5sums=('dbd5d951783020a0de6a923c29009781'
         '22d023ab3b86fdd760e5d13ac33b87db'
         'd421dd9cd2d0f3932161a65e18c29e92'
         'e3f158f0512db2620b052d2796c43057')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}/

  patch -Np1 < ${srcdir}/kqrcode-cmake.patch

  rm -rf build
  mkdir -p build
  cd build || return 1

  mv ${srcdir}/${pkgname}-dev-${pkgver}/*.h ${srcdir}/${pkgname}-${pkgver}/
  mv ${srcdir}/${pkgname}-plugins-${pkgver}/qrcontact ${srcdir}/${pkgname}-${pkgver}/
  mv ${srcdir}/${pkgname}-plugins-${pkgver}/qremail ${srcdir}/${pkgname}-${pkgver}/
  mv ${srcdir}/${pkgname}-plugins-${pkgver}/qrsms ${srcdir}/${pkgname}-${pkgver}/
  mv ${srcdir}/${pkgname}-plugins-${pkgver}/qrweblink ${srcdir}/${pkgname}-${pkgver}/
  mv ${srcdir}/${pkgname}-plugins-${pkgver}/qrwifi ${srcdir}/${pkgname}-${pkgver}/

  cmake ../ -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` || return 1
  make || return 1
}

package(){
  cd ${srcdir}/${pkgname}-${pkgver}/build
  make DESTDIR=${pkgdir} install || return 1
}
