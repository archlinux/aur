# Maintainer: vorpalblade77@gmail.com
# Contributor: b.klettbach@gmail.com

pkgname=multimc5
pkgver=0.6.2
pkgrel=1
__pkgver_libnbtplusplus=multimc-0.5.0
__pkgver_quazip=multimc-2
pkgdesc="Minecraft launcher with ability to manage multiple instances."
arch=('i686' 'x86_64')
url="http://multimc.org/"
license=('Apache')
depends=('zlib' 'libgl' 'qt5-base' 'qt5-x11extras' 'java-runtime' 'qt5-svg' 'xorg-xrandr')
provides=('multimc')
makedepends=('patch' 'cmake' 'qt5-tools' 'qt5-x11extras' 'java-environment>=8' 'java-environment<10')
optdepends=('mcedit: Allows editing of minecraft worlds')
conflicts=('multimc5-git' 'multimc-git' 'multimc')
source=("https://github.com/MultiMC/MultiMC5/archive/${pkgver}.tar.gz"
  "https://github.com/MultiMC/libnbtplusplus/archive/${__pkgver_libnbtplusplus}.tar.gz"
  "https://github.com/MultiMC/quazip/archive/${__pkgver_quazip}.tar.gz"
)
sha512sums=('e70e7e02b8e92f7f6edf8f6d84aae1049af0def9018e3c91839838d9f156dc99a784a62f65c449b493694c997444d490517a6413fad1aefa9753a99c585f2d7f'
            '333aa110a399a5061aba306912b6e9af18f824920a778afeb6b5714d91af64cb6135e2801a6271a38896a36db733308cbfade79830ca08bfca8a9d79fef69e68'
            'de5169e46018b61f9d1221e537785c19e62d7de57e9726f65668ee5c265b4db8464cc6f8ac48bd28c0166b186fff31115c11e05451259437f3358e3b2c5fc57f')
prepare() {
  rmdir "${srcdir}/MultiMC5-${pkgver}/libraries/libnbtplusplus" | echo "libnbtplusplus has data"
  rmdir "${srcdir}/MultiMC5-${pkgver}/libraries/quazip" | echo "quazip has data"
  cp --recursive "${srcdir}/libnbtplusplus-${__pkgver_libnbtplusplus}/" \
    "${srcdir}/MultiMC5-${pkgver}/libraries/libnbtplusplus"
  cp --recursive "${srcdir}/quazip-${__pkgver_quazip}/" \
    "${srcdir}/MultiMC5-${pkgver}/libraries/quazip"
}
build() {
  cd "${srcdir}/MultiMC5-${pkgver}"
  mkdir -p build

  cd build
  cmake -DCMAKE_BUILD_TYPE=Release \
	  -DMultiMC_UPDATER=OFF \
	  -DCMAKE_INSTALL_PREFIX="/usr" \
	  -DMultiMC_LAYOUT=lin-system \
	  ..
  make
}

package() {
  cd "$srcdir/MultiMC5-${pkgver}/build"
  make install DESTDIR="${pkgdir}"
  install -D "${srcdir}/MultiMC5-${pkgver}/application/resources/multimc/scalable/multimc.svg" "${pkgdir}/usr/share/pixmaps/multimc.svg"
  install -D "${srcdir}/MultiMC5-${pkgver}/application/package/linux/multimc.desktop" "${pkgdir}/usr/share/applications/multimc.desktop"
  install -D "${srcdir}/MultiMC5-${pkgver}/build/libMultiMC_quazip.so" "${pkgdir}/usr/lib/libMultiMC_quazip.so"
  install -D "${srcdir}/MultiMC5-${pkgver}/build/libMultiMC_nbt++.so" "${pkgdir}/usr/lib/libMultiMC_nbt++.so"
}
