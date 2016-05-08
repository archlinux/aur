pkgname=kqrcode
pkgver=0.6.0
pkgrel=4
pkgdesc="A little program that is meant to encode/decode data to/from QR codes."
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php?content=143544"
license=("GPL")
makedepends=('cmake')
depends=('kdelibs' 'qrencode' 'zbar-qt' 'automoc4')
source=(${pkgname}-${pkgver}.tar.gz::http://sourceforge.net/projects/kqrcode/files/${pkgname}-${pkgver}.tar.gz/download
        ${pkgname}-plugins-${pkgver}.tar.gz::http://sourceforge.net/projects/kqrcode/files/${pkgname}-plugins-${pkgver}.tar.gz/download
        ${pkgname}-dev-${pkgver}.tar.gz::http://sourceforge.net/projects/kqrcode/files/${pkgname}-dev-${pkgver}.tar.gz/download
        kqrcode-cmake.patch 
        kqrcode-plugins-cmake.patch)
sha256sums=('c89f4d6efa0a758fa1ce7f5f926f0a3d03348e943d22bfdc0c994152c4ef248b'
            '28bd604b550db4849e261ea146f3eba69b6407398cd0ef6e65c5a04ca1928a5e'
            '7e5100616969291541b7a14530f7445b9af09d2de3d8a7c64b1cfc4c4dc3471f'
            'dd1c9757193456f07a3566b03eadc5a5bcaba8c173cf94c0c069c78c948379ed'
            '108b3cc82d41b875df7da4bed9b88999755e923b9bec5674dc218b3f20a9eb7b')

prepare() {
  cd ${srcdir}/${pkgname}-plugins-${pkgver}

  patch -Np1 < ${srcdir}/kqrcode-plugins-cmake.patch

  cd ${srcdir}/${pkgname}-${pkgver}

  patch -Np1 < ${srcdir}/kqrcode-cmake.patch

  cp -a ${srcdir}/${pkgname}-dev-${pkgver}/*.h ${srcdir}/${pkgname}-${pkgver}/
  cp -a ${srcdir}/${pkgname}-plugins-${pkgver}/{qrcontact,qremail,qrsms,qrweblink,qrwifi} ${srcdir}/${pkgname}-${pkgver}/

  rm -rf build
  mkdir -p build
  cd build || return 1
}

build() {
  cd ${srcdir}/${pkgname}-${pkgver}/build

  cmake ../ -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` || return 1
  make || return 1
}

package(){
  cd ${srcdir}/${pkgname}-${pkgver}/build

  make DESTDIR=${pkgdir} install || return 1
}
