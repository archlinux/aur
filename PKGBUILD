# Maintainer: Miko <mikoxyzzz@gmail.com>
# Contributor: Cheru Berhanu <aur attt cheru doot dev>

pkgname=multimc-git
pkgver=0.6.13.r0.ge2355eb2
pkgrel=1
pkgdesc="Minecraft launcher with ability to manage multiple instances."
arch=('i686' 'x86_64')
url="https://multimc.org/"
license=('Apache')
depends=('java-runtime' 'libgl' 'qt5-base' 'zlib')
provides=('multimc')
conflicts=('multimc' 'multimc5' 'multimc5-bin')
makedepends=('cmake' 'java-environment')
optdepends=('glfw: to use system GLFW libraries'
            'openal: to use system OpenAL libraries'
            'visualvm: Profiling support'
            'xorg-xrandr: for older minecraft versions'
)
source=("git+https://github.com/MultiMC/MultiMC5"
        "git+https://github.com/MultiMC/libnbtplusplus"
        "git+https://github.com/MultiMC/quazip"
        modern-java.patch
)

sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            '0005a23628afbecb40591e9ef0fd2fc63367ca1be71a874de6791fb19ae112b5907e19975b40b770122e9e34cc3297b14d2a9d72c42f3fbfac221e41cbc67890')

pkgver() {
  cd MultiMC5
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/MultiMC5"
  patch -p1 < "${srcdir}/modern-java.patch"

  git submodule init
  git config submodule.libnbtplusplus.url "${srcdir}/libnbtplusplus"
  git config submodule.quazip.url "${srcdir}/quazip"
  git submodule update
}

build() {
  cd "${srcdir}/MultiMC5"
  mkdir -p build

  cd build
  cmake -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DMultiMC_LAYOUT=lin-system \
    ..
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

