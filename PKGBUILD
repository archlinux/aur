# Maintainer: vorpalblade77@gmail.com
# Contributor: b.klettbach@gmail.com

pkgname=multimc5
pkgver=0.4.9
__pkgver_libnbtplusplus=2.3.1-alpha
pkgrel=1
pkgdesc="Minecraft launcher with ability to manage multiple instances."
arch=('i686' 'x86_64')
url="http://multimc.org/"
license=('Apache')
depends=('qt5-svg' 'java-environment' 'xdg-utils')
makedepends=('git' 'cmake' 'qt5-tools' 'qt5-x11extras' 'java-environment'
	     'zlib')
optdepends=('mcedit: Allows editing of minecraft worlds')
conflicts=('multimc5-git')
source=("https://github.com/MultiMC/MultiMC5/archive/${pkgver}.tar.gz"
  "https://github.com/MultiMC/libnbtplusplus/archive/v${__pkgver_libnbtplusplus}.tar.gz"
  'multimc5.sh'
  'multimc5.desktop'
)
sha512sums=('0b5fc69c22f0cd762d6c4225078af1e38b00b583a9c231cc680a724394c88624b4d5602573090036ff1198bc656356aaad2f94d0f76c5cbe8f985cf8ba155cde'
            '5e7a85275b7452ce1f507273e1ee264df8ba6536c431df8d223f2512b4823417f9699c1403108468c066c0f7f9bd359bce27cd3a33f35726fb6ba1a2d9b8e4de'
            '6eb9476c8350fb8055238afc4d62f89897ea6d255a13edde88b76a67d021d88266d86236ef9ea9ebe82729b92cb7d8a9a66114de7c6b31666a82654dfe672049'
            'a6712d0e84acc719ed1aff740717add44202f88cb42a0b7a3157108b73a1009ac7edd325f75d372e0a63617f40eb614d55fb4e24e5c1fb8957cd280486070675')



build() {
  rmdir "${srcdir}/MultiMC5-${pkgver}/depends/libnbtplusplus" | echo "libnbtplusplus has data"
  cp --recursive "${srcdir}/libnbtplusplus-${__pkgver_libnbtplusplus}/" "${srcdir}/MultiMC5-${pkgver}/depends/libnbtplusplus"
  cd "${srcdir}/MultiMC5-${pkgver}"
  #sed -i '/add_subdirectory(mmc_updater)/d' CMakeLists.txt
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX="/usr/lib/multimc5" $srcdir/MultiMC5-${pkgver}
  make
}

package() {
  cd "$srcdir/MultiMC5-${pkgver}/build"
  #make DESTDIR="${pkgdir}" install
  install -D MultiMC "${pkgdir}/usr/lib/multimc5/MultiMC5"
  install -D libMultiMC_logic.so \
    "${pkgdir}/usr/lib/multimc5/bin/libMultiMC_logic.so"
  install -D librainbow.so "${pkgdir}/usr/lib/multimc5/bin/librainbow.so"
  install -D "${srcdir}/multimc5.sh" "${pkgdir}/usr/bin/multimc5"
  install -D \
    "${srcdir}/MultiMC5-${pkgver}/application/resources/multimc/scalable/multimc.svg" \
    "${pkgdir}/usr/share/pixmaps/multimc5.svg"
  install -D "${srcdir}/multimc5.desktop" \
    "${pkgdir}/usr/share/applications/multimc5.desktop"
}
