# Maintainer: vorpalblade77@gmail.com
# Contributor: b.klettbach@gmail.com

pkgname=multimc5
pkgver=0.5.2
pkgrel=1
__pkgver_libnbtplusplus=multimc-0.5.0
__install_dir="/usr/lib/multimc5"
pkgdesc="Minecraft launcher with ability to manage multiple instances."
arch=('i686' 'x86_64')
url="http://multimc.org/"
license=('Apache')
depends=('zlib' 'libgl' 'qt5-base' 'qt5-x11extras' 'java-runtime' 'qt5-svg')
makedepends=('git' 'patch' 'cmake' 'qt5-tools' 'qt5-x11extras' 'java-environment>=8')
optdepends=('mcedit: Allows editing of minecraft worlds')
conflicts=('multimc5-git' 'multimc-git')
source=("https://github.com/MultiMC/MultiMC5/archive/${pkgver}.tar.gz"
  "https://github.com/MultiMC/libnbtplusplus/archive/${__pkgver_libnbtplusplus}.tar.gz"
  'multimc5.sh'
  'multimc5.desktop'
  'cmake-patch.diff'
  'https://github.com/MultiMC/MultiMC5/commit/88041783e6a8c8f4b1e9bda55e6defe9feb7d93b.patch'
)
sha512sums=('9ebd46519520f355ad2ec735a7d9f2a4e8273b66c0c13948dcf9e950358eaee90c53bb0aedfd1083323e01417de410c60fbd554fcbf14c0be35764a47152f66d'
            '333aa110a399a5061aba306912b6e9af18f824920a778afeb6b5714d91af64cb6135e2801a6271a38896a36db733308cbfade79830ca08bfca8a9d79fef69e68'
            '6d5982ef93ffdf2910c9005d8d647523a7e225f95f6f9e45f2efbb690767a580bfd059804d891ba4507fde97432da73594d202970514476b764dd0cdb50e537c'
            'a6712d0e84acc719ed1aff740717add44202f88cb42a0b7a3157108b73a1009ac7edd325f75d372e0a63617f40eb614d55fb4e24e5c1fb8957cd280486070675'
            'af4e13cedcf275ca1f95643e88162b741256309f0e6af3629762f204093946cc972a9345f838035777a1e9a64ac0f7893266a43631b9c21967c1b237264ec646'
            '645537ff55fee95f3e8361f62f976852159a62a46538d71e4b537e5d54f59f64addef97121a0f2540f142d74d7d612395a3b56144adbc2d2847abe4a90aec0d9')


prepare() {
  cd "${srcdir}/MultiMC5-${pkgver}"
  patch -p1 -i "${srcdir}/cmake-patch.diff"
  patch -p1 -i "${srcdir}/88041783e6a8c8f4b1e9bda55e6defe9feb7d93b.patch"
}

build() {
  rmdir "${srcdir}/MultiMC5-${pkgver}/libraries/libnbtplusplus" | echo "libnbtplusplus has data"
  cp --recursive "${srcdir}/libnbtplusplus-${__pkgver_libnbtplusplus}/" \
    "${srcdir}/MultiMC5-${pkgver}/libraries/libnbtplusplus"
  cd "${srcdir}/MultiMC5-${pkgver}"
  #sed -i '/add_subdirectory(mmc_updater)/d' CMakeLists.txt
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX="${__install_dir}" -DNBT_USE_ZLIB=ON $srcdir/MultiMC5-${pkgver}
  make
}

package() {
  cd "$srcdir/MultiMC5-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
  #install -D MultiMC "${pkgdir}/usr/lib/multimc5/MultiMC5"
  install -D libMultiMC_logic.so \
    "${pkgdir}/usr/lib/multimc5/bin/libMultiMC_logic.so"
  install -D libMultiMC_rainbow.so \
    "${pkgdir}/${__install_dir}/bin/libMultiMC_rainbow.so"
  install -D libMultiMC_gui.so \
    "${pkgdir}/${__install_dir}/bin/libMultiMC_gui.so"
  install -D libMultiMC_nbt++.so \
    "${pkgdir}/${__install_dir}/bin/libMultiMC_nbt++.so"
  install -D "${srcdir}/multimc5.sh" "${pkgdir}/usr/bin/multimc5"
  install -D \
    "${srcdir}/MultiMC5-${pkgver}/application/resources/multimc/scalable/multimc.svg" \
    "${pkgdir}/usr/share/pixmaps/multimc5.svg"
  install -D "${srcdir}/multimc5.desktop" \
    "${pkgdir}/usr/share/applications/multimc5.desktop"
}
