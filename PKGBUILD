# Maintainer: Andreas Baumann <mail@andreasbaumann.cc>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Roman Kyrylych <roman@archlinux.org>
# Contributor: Sarah Hay <sarah@archlinux.org>

pkgname=qgpgme1-qt5
_pkgbase=gpgme
pkgver=1.24.3
pkgrel=2
pkgdesc="Qt5 bindings for GPGme"
arch=('x86_64')
url='https://gnupg.org/software/gpgme/index.html'
license=(LGPL)
makedepends=(
  'gnupg'
  'libgpg-error'
  'swig'
)
depends=(
  'gpgme-1'
  'qt5-base'
)
conflicts=('qgpgme-qt5')
validpgpkeys=('6DAA6E64A76D2840571B4902528897B826403ADA'  # Werner Koch (dist signing 2020)
              'AC8E115BF73E2D8D47FA9908E98E9B2D19C6C8BD') # Niibe Yutaka (GnuPG Release Key)
source=("https://www.gnupg.org/ftp/gcrypt/${_pkgbase}/${_pkgbase}-${pkgver}.tar.bz2"{,.sig})
sha256sums=('bfc17f5bd1b178c8649fdd918956d277080f33df006a2dc40acdecdce68c50dd'
            'SKIP')

prepare() {
  cd ${_pkgbase}-${pkgver}/

  sed -i 's/-unknown//' autogen.sh
  autoreconf -fi
}

build() {
  cd ${_pkgbase}-${pkgver}

  ./configure \
    --prefix=/usr \
    --disable-fd-passing \
    --disable-static \
    --disable-gpgsm-test \
    --enable-languages=cpp,qt5
  make
}

package() {
  cd ${_pkgbase}-${pkgver}

  # lang/qt's install-time libtool relink of libqgpgme.so needs -lgpgmepp
  # resolvable under $pkgdir/usr/lib. gpgme-1 (a depends= here) ships the
  # runtime libgpgmepp.so.6 but deliberately no unversioned dev symlink
  # (it's a headers-elsewhere runtime-only package), so install lang/cpp
  # into $pkgdir first just to satisfy that relink, then strip it back out
  # below -- gpgme-1 already provides the actual runtime library.
  make -C lang/cpp DESTDIR="${pkgdir}" install

  cd lang/qt
  make DESTDIR="${pkgdir}" install
  cd ..

  rm -rf "${pkgdir}"/usr/include/gpgme++ \
         "${pkgdir}"/usr/lib/libgpgmepp* \
         "${pkgdir}"/usr/lib/cmake/Gpgmepp \
         "${pkgdir}"/usr/lib/pkgconfig/gpgmepp.pc

  mv "${pkgdir}"/usr/lib/cmake/QGpgme "${pkgdir}"/usr/lib/cmake/QGpgmeQt5
  mv "${pkgdir}"/usr/lib/cmake/QGpgmeQt5/QGpgmeConfig.cmake "${pkgdir}"/usr/lib/cmake/QGpgmeQt5/QGpgmeQt5Config.cmake
  mv "${pkgdir}"/usr/lib/cmake/QGpgmeQt5/QGpgmeConfigVersion.cmake "${pkgdir}"/usr/lib/cmake/QGpgmeQt5/QGpgmeQt5ConfigVersion.cmake
}
