# Maintainer: Cheru Berhanu <aur attt cheru doot dev>

pkgname=multimc-git
pkgver=0.4.7.r1347.g23442442
pkgrel=1
pkgdesc="Minecraft launcher with ability to manage multiple instances."
arch=('i686' 'x86_64')
url="https://multimc.org/"
license=('Apache')
depends=('zlib' 'libgl' 'qt5-base' 'java-runtime')
provides=('multimc')
conflicts=('multimc' 'multimc5' 'multimc5-bin')
makedepends=('cmake' 'java-environment')
optdepends=('mcedit: Allows editing of minecraft worlds'
            'visualvm: Profiling support'
            'xorg-xrandr: for older minecraft versions'
            'openal: to use system OpenAL libraries'
            'glfw: to use system GLFW libraries'
)
source=("git+https://github.com/MultiMC/MultiMC5"
"git+https://github.com/MultiMC/libnbtplusplus"
"git+https://github.com/MultiMC/quazip"
)

sha512sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
  cd MultiMC5
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
cd "${srcdir}/MultiMC5"
git submodule init
git config submodule.libnbtplusplus.url "${srcdir}/libnbtplusplus"
git config submodule.quazip.url "${srcdir}/quazip"
git submodule update
}

build() {
  cd "${srcdir}/MultiMC5"
  mkdir -p build

  cd build
  cmake -DCMAKE_INSTALL_PREFIX="/usr" -DMultiMC_LAYOUT=lin-system ..
  make
}

check() {
  cd "${srcdir}/MultiMC5/build"
  make test
}

package() {
  cd "${srcdir}/MultiMC5/build"
  make install DESTDIR="${pkgdir}"
  install -D "${srcdir}/MultiMC5/launcher/resources/multimc/scalable/multimc.svg" "${pkgdir}/usr/share/pixmaps/multimc.svg"
  install -D "${srcdir}/MultiMC5/launcher/package/linux/multimc.desktop" "${pkgdir}/usr/share/applications/multimc.desktop"
  install -D "${srcdir}/MultiMC5/build/libMultiMC_quazip.so" "${pkgdir}/usr/lib/libMultiMC_quazip.so"
  install -D "${srcdir}/MultiMC5/build/libMultiMC_nbt++.so" "${pkgdir}/usr/lib/libMultiMC_nbt++.so"
}

