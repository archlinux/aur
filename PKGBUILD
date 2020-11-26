# Maintainer: David P. <megver83@parabola.nu>

pkgname=linphone-desktop
pkgver=4.2.4
pkgrel=1
pkgdesc='A free VoIP and video softphone based on the SIP protocol'
arch=(x86_64 i686)
url='http://linphone.org'
license=(GPL)
depends=(qt5-quickcontrols qt5-quickcontrols2 qt5-graphicaleffects qt5-svg qt5-tools liblinphone)
makedepends=(cmake python-pystache doxygen nasm yasm python-six)
source=("https://gitlab.linphone.org/BC/public/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz"
        0001-do-not-build-linphone-sdk.patch
        0002-remove-bc_compute_full_version-usage.patch
)
sha512sums=('00b150b547032f2621ba3e31318258ab5c7d087877cbf362e10824da64b21bc227c9fd571ba35874f51d083a753f703abfed883c14988c634274e0cb273d0cb6'
            '1643fcaf4c033125b0cebd7e31a15c87baa62126bbecf12cc599f9ea1aa719ccb76a9d15849e0c7d5d1218445c0e3297771ed152930e14dadaaa87772a4c3ad7'
            'aea52c176474018b0bb05cb0ff370ec63aecbce66b3ed29e25a7be108239b91f33971317bdb3bef01730348cd98d17a2b6f24488854d34f7066371141f7d02f6')

prepare() {
  cd "$pkgname-$pkgver"
  patch -Np1 -i ../0001-do-not-build-linphone-sdk.patch
  patch -Np1 -i ../0002-remove-bc_compute_full_version-usage.patch

  # Fix building out-of-git
  echo '#define LINPHONE_QT_GIT_VERSION "${PROJECT_VERSION}"' >> linphone-app/src/config.h.cmake
  # Hardcode linphoneqt version
  echo "project(linphoneqt VERSION $pkgver)" > linphone-app/linphoneqt_version.cmake
}

build() {   
  mkdir -p build
  cd build

  cmake "../$pkgname-$pkgver"
  make

  sed -i '/linphone-sdk/d' linphone-app/cmake_builder/linphone_package/cmake_install.cmake
  sed -i "s|$srcdir/build/OUTPUT|$pkgdir/usr|" cmake_install.cmake
}

package() {
  make -C build install
  rm "$pkgdir/usr/bin/qt.conf"
}
