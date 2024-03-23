# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>

pkgname=qt5ct-svn
pkgver=1.9.r690
pkgrel=2
pkgdesc='Qt5 Configuration Tool - svn version.'
arch=(x86_64)
url='https://sourceforge.net/projects/qt5ct/'
license=(BSD-2-Clause)
depends=(gcc-libs
         glibc
         qt5-base
         qt5-svg)
makedepends=(cmake
             qt5-tools
             subversion)
conflicts=("${pkgname%-*}")
provides=("${pkgname%-*}")
source=('qt5ct::svn://svn.code.sf.net/p/qt5ct/code/trunk/qt5ct')
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  major=$(grep 'define QT5CT_VERSION_MAJOR' src/qt5ct-common/qt5ct.h | awk '{print $3}')
  minor=$(grep 'define QT5CT_VERSION_MINOR' src/qt5ct-common/qt5ct.h | awk '{print $3}')
  local ver="$(svnversion)"
  printf "%s.r%s" "$major"."$minor" "${ver//[[:alpha:]]}"
}

build() {
  cmake -B build -S "${pkgname%-*}" \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "${pkgname%-*}"/COPYING "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
