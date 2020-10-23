# Maintainer: David P. <megver83@parabola.nu>

pkgname=linphone-desktop
pkgver=4.2.3
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
sha512sums=('d0f0fbd99bd8ab20d89b525ac4f38774974aefedb36b311b51190682ffdceedaed205e918c3685124497aa14d95dfdf1bd6c1c2675a1dd2452fed44d7b171bce'
            '24f9849692ca1f937661dfaa89695da38d5c1713f42d364446568fdef3fca54cc195bf815111c7bf570e4520f15846ecd5d0cd44cefa380384bf37d74c69e9a9'
            'c41551388e590844b06e0ff23ec079c5a10a67a6ec9b1aec27d2662e5e8b22d8cbceb601e0277365f2e9b0c004af06b6481248b296b7645007d964e16dac197f')

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
