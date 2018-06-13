# Maintainer: vorpalblade77@gmail.com
# Contributor: b.klettbach@gmail.com

pkgname=multimc5
pkgver=0.6.2
pkgrel=2
__pkgver_libnbtplusplus=multimc-0.5.0
__pkgver_quazip=multimc-2
pkgdesc="Minecraft launcher with ability to manage multiple instances."
arch=('i686' 'x86_64')
url="http://multimc.org/"
license=('Apache')
depends=('zlib' 'libgl' 'qt5-base' 'qt5-x11extras' 'java-runtime' 'qt5-svg' 'xorg-xrandr')
provides=('multimc')
conflicts=('multimc')
makedepends=('cmake' 'java-environment>=8' 'java-environment<10')
optdepends=('mcedit: Allows editing of minecraft worlds')

source=("https://github.com/MultiMC/MultiMC5/archive/${pkgver}.tar.gz"
        "https://github.com/MultiMC/libnbtplusplus/archive/${__pkgver_libnbtplusplus}.tar.gz"
        "https://github.com/MultiMC/quazip/archive/${__pkgver_quazip}.tar.gz"
        "multimc-fix-build-with-qt-511.patch"
        "quazip-fix-build-with-qt-511.patch"
)
sha512sums=('e70e7e02b8e92f7f6edf8f6d84aae1049af0def9018e3c91839838d9f156dc99a784a62f65c449b493694c997444d490517a6413fad1aefa9753a99c585f2d7f'
            '333aa110a399a5061aba306912b6e9af18f824920a778afeb6b5714d91af64cb6135e2801a6271a38896a36db733308cbfade79830ca08bfca8a9d79fef69e68'
            'de5169e46018b61f9d1221e537785c19e62d7de57e9726f65668ee5c265b4db8464cc6f8ac48bd28c0166b186fff31115c11e05451259437f3358e3b2c5fc57f'
            '7c40028655a327503565a3384dc163c0061718a0ec73feb306dcfe298c02573764ae98ae1390e7eab4ef374ceb63f7ecde6c86f6f0f17591b07ae4a27147466f'
            'ca7a350bdeecf65dbca7de8d6912c935c6ba603edcddcd4ffe71d8997e50e4046335dde6d1d7c629d35025073d18be4d112a960d43a8801de979687bc26e46d4')
prepare() {
  cd "${srcdir}/MultiMC5-${pkgver}"

  rmdir "libraries/libnbtplusplus"
  rmdir "libraries/quazip"
  cp --recursive "${srcdir}/libnbtplusplus-${__pkgver_libnbtplusplus}/" \
    "libraries/libnbtplusplus"
  cp --recursive "${srcdir}/quazip-${__pkgver_quazip}/" \
    "libraries/quazip"

  # https://github.com/MultiMC/MultiMC5/pull/2304
  patch -p1 < "${srcdir}/multimc-fix-build-with-qt-511.patch"

  cd "libraries/quazip"
  # https://github.com/MultiMC/quazip/pull/1
  patch -p1 < "${srcdir}/quazip-fix-build-with-qt-511.patch"
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

check() {
  cd "${srcdir}/MultiMC5-${pkgver}/build"
  make test
}

package() {
  cd "${srcdir}/MultiMC5-${pkgver}/build"
  make install DESTDIR="${pkgdir}"
  install -D "${srcdir}/MultiMC5-${pkgver}/application/resources/multimc/scalable/multimc.svg" "${pkgdir}/usr/share/pixmaps/multimc.svg"
  install -D "${srcdir}/MultiMC5-${pkgver}/application/package/linux/multimc.desktop" "${pkgdir}/usr/share/applications/multimc.desktop"
  install -D "${srcdir}/MultiMC5-${pkgver}/build/libMultiMC_quazip.so" "${pkgdir}/usr/lib/libMultiMC_quazip.so"
  install -D "${srcdir}/MultiMC5-${pkgver}/build/libMultiMC_nbt++.so" "${pkgdir}/usr/lib/libMultiMC_nbt++.so"
}
