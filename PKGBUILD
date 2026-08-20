# Maintainer: Andreas Baumann <mail@andreasbaumann.cc>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Roman Kyrylych <roman@archlinux.org>
# Contributor: Sarah Hay <sarah@archlinux.org>

pkgname=qgpgme-qt5
_pkgbase=gpgme
pkgver=2.1.0
pkgrel=3
pkgdesc="Qt5 bindings for GPGme"
arch=('x86_64' 'i686' 'pentium4')
url='https://gnupg.org/software/gpgme/index.html'
license=(GPL-2.0-or-later)
makedepends=(cmake
             git)
# i686/pentium4's system Qt5Core.so links against the legacy icu76
# soname (undefined reference to u_errorName_76 otherwise) while the
# chroot's default icu package is newer (78.3) -- icu76 is available
# via archlinux32's own official repo for both, just wasn't declared.
makedepends_i686=(icu76)
makedepends_pentium4=(icu76)
depends=(gcc-libs
         glibc
         gpgmepp
         qt5-base)
validpgpkeys=('6DAA6E64A76D2840571B4902528897B826403ADA'  # Werner Koch (dist signing 2020)
              'AC8E115BF73E2D8D47FA9908E98E9B2D19C6C8BD') # Niibe Yutaka (GnuPG Release Key)
source=(git+https://github.com/gpg/gpgmeqt#tag=gpgmeqt-$pkgver)
sha256sums=('2601b9fafa0b974768d24112613d839e1b6828ec5a7f2fb8b02fb601fcef6e39')

build() {
  cmake -B build -S gpgmeqt \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_WITH_QT5=ON \
    -DBUILD_WITH_QT6=OFF
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  mv "${pkgdir}"/usr/lib/cmake/QGpgme "${pkgdir}"/usr/lib/cmake/QGpgmeQt5
  mv "${pkgdir}"/usr/lib/cmake/QGpgmeQt5/QGpgmeConfig.cmake "${pkgdir}"/usr/lib/cmake/QGpgmeQt5/QGpgmeQt5Config.cmake
  mv "${pkgdir}"/usr/lib/cmake/QGpgmeQt5/QGpgmeConfigVersion.cmake "${pkgdir}"/usr/lib/cmake/QGpgmeQt5/QGpgmeQt5ConfigVersion.cmake
}
