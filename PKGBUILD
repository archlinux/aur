# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

pkgname=lcms2-cmake
pkgver=2.19.1
_lcms2_release="lcms$pkgver"
_lcms2_release_name="Little-CMS-$_lcms2_release"
pkgrel=1
arch=('any')
pkgdesc="Little CMS configuration files for CMake"
url="https://github.com/mm2/Little-CMS"
license=('MIT')
depends=('cmake' 'lcms2')
makedepends=('glibc' 'libjpeg-turbo' 'libtiff')
source=("$_lcms2_release_name.tar.gz::$url/archive/$_lcms2_release.tar.gz")
b2sums=('834b931ef1bc1c2bd601fd05da5eccb4caeeda653a03a9bbab55d1612fc95f269846e2e84fe8fbfe235a8dd87a6f1cfea1d06d86387903380ae3eda5370527be')

#prepare() {
#  sed -i '/2\.19/ s/9/9.1/' \
#         "$_lcms2_release_name/CMakeLists.txt"
#}

build() {
  cmake $_lcms2_release_name \
        -Bbuild \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DLCMS2_BUILD_STATIC=OFF
  cmake --build build/
}

package() {
  cd build
  make DESTDIR="$pkgdir" install

  for files in \
    'bin' \
    'include' \
    'lib/liblcms*' \
    'lib/pkgconfig' \
    'share/man'
  do
    rm -fr $pkgdir/usr/$files
  done

  # Fix reference to the library filename
  # The version compiled with Autotools has a different version number
  sed -i '/liblcms2/ s/2.19.0/2.0.19/' \
         "$pkgdir/usr/lib/cmake/lcms2/lcms2-targets-release.cmake"

  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 "$srcdir/$_lcms2_release_name/LICENSE" \
          -t "$pkgdir/usr/share/licenses/$pkgname"
}
