# Maintainer: David P. <megver83@parabola.nu>

pkgname=linphone-desktop
pkgver=4.2.2
pkgrel=1
pkgdesc='A free VoIP and video softphone based on the SIP protocol'
arch=(x86_64 i686)
url='http://linphone.org'
license=(GPL)
depends=(qt5-quickcontrols qt5-quickcontrols2 qt5-graphicaleffects qt5-svg qt5-tools liblinphone)
makedepends=(cmake python-pystache doxygen nasm yasm python-six)
source=("https://gitlab.linphone.org/BC/public/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz"
        0001-do-not-build-linphone-sdk.patch
        0002-Fix-building-out-of-git.patch
        0003-remove-bc_compute_full_version-usage.patch
)
sha512sums=('736b3448f309e8286acfdf724b765fcc77cb9d092ba892fd38f88f7af431c50f784c399bf5688cfe6caf45d2e6cc6e7d0c5e01b991be07b237f2f6bda35f338c'
            '7c1d1782d02da7b24ac1b39548a0b995d9abcfd883e3dfc0611f6431542ad7e873d785cf1e15033562818f0ce9ec1021d47d6b8ac5dc64530902b997f051c886'
            '8f90eed36db84369b8b44e7004d67f7634c3ef9549304491b56a1c0b18d676ab46afa0322353d6919f7317b4f0f387972be25dcfd09621d54fe63d74e8a1f52f'
            'c09bce9a5fb51519bde651a6f25187274b2cb561b8590b9cd849f88d0cd35c4a8d4698578fe75d453c8c82135b8f5cf8e0a58093706dcfcb7382d07928c8dba9')

prepare() {
  cd "$pkgname-$pkgver"
  patch -Np1 -i ../0001-do-not-build-linphone-sdk.patch
  patch -Np1 -i ../0002-Fix-building-out-of-git.patch
  patch -Np1 -i ../0003-remove-bc_compute_full_version-usage.patch
}

build() {   
  mkdir -p build
  cd build

  cmake "../$pkgname-$pkgver"
  make

  sed '/linphone-sdk/d' -i linphone-app/cmake_builder/linphone_package/cmake_install.cmake
  sed "s|$srcdir/build/OUTPUT|$pkgdir/usr|" -i cmake_install.cmake
}

package() {
  make -C build install
  rm "$pkgdir/usr/bin/qt.conf"
}
