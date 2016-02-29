# Maintainer: vorpalblade77@gmail.com
# Contributor: b.klettbach@gmail.com

pkgname=multimc5
pkgver=0.4.11
__pkgver_libnbtplusplus=2.3.1-alpha
pkgrel=1
pkgdesc="Minecraft launcher with ability to manage multiple instances."
arch=('i686' 'x86_64')
url="http://multimc.org/"
license=('Apache')
depends=('zlib' 'libgl' 'qt5-base' 'qt5-x11extras' 'java-runtime' 'qt5-svg')
makedepends=('git' 'patch' 'cmake' 'qt5-tools' 'qt5-x11extras' 'java-environment')
optdepends=('mcedit: Allows editing of minecraft worlds')
conflicts=('multimc5-git')
source=("https://github.com/MultiMC/MultiMC5/archive/${pkgver}.tar.gz"
  "https://github.com/MultiMC/libnbtplusplus/archive/v${__pkgver_libnbtplusplus}.tar.gz"
  'multimc5.sh'
  'multimc5.desktop'
  'cmake-patch.diff'
)
sha512sums=('b2d2da85e5c61aed41d6be40e20e54a19b7d7b42570e16113c16018954b4b717804aea1e0f7f1a6201cf7e23629a73ba155c10e8b1aabd064068769cbe7097b3'
            '5e7a85275b7452ce1f507273e1ee264df8ba6536c431df8d223f2512b4823417f9699c1403108468c066c0f7f9bd359bce27cd3a33f35726fb6ba1a2d9b8e4de'
            '6f891ba6b1d940297ffd1b6007f65ce64abe4f6c7bd8ce7d5204fe9886f006f5080c2cb26c7adfaf00e281f92342e5280f2c675b74c3e9b6f5a769169d56dd26'
            'a6712d0e84acc719ed1aff740717add44202f88cb42a0b7a3157108b73a1009ac7edd325f75d372e0a63617f40eb614d55fb4e24e5c1fb8957cd280486070675'
            'af4e13cedcf275ca1f95643e88162b741256309f0e6af3629762f204093946cc972a9345f838035777a1e9a64ac0f7893266a43631b9c21967c1b237264ec646')


prepare() {
  cd "${srcdir}/MultiMC5-${pkgver}"
  patch -p1 -i "${srcdir}/cmake-patch.diff"
}

build() {
  rmdir "${srcdir}/MultiMC5-${pkgver}/depends/libnbtplusplus" | echo "libnbtplusplus has data"
  cp --recursive "${srcdir}/libnbtplusplus-${__pkgver_libnbtplusplus}/" "${srcdir}/MultiMC5-${pkgver}/depends/libnbtplusplus"
  cd "${srcdir}/MultiMC5-${pkgver}"
  #sed -i '/add_subdirectory(mmc_updater)/d' CMakeLists.txt
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX="/usr/lib/multimc5" -DNBT_USE_ZLIB=ON $srcdir/MultiMC5-${pkgver}
  make
}

package() {
  cd "$srcdir/MultiMC5-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
  #install -D MultiMC "${pkgdir}/usr/lib/multimc5/MultiMC5"
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
