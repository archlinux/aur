# Maintainer: Elijah Gregg <lovetocode999 at tilde dot team>
# Contributor: Lenny McLennington <lennymclennington@protonmail.com>
# Contributor: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: Miko <mikoxyzzz@gmail.com>
# Contributor: Cheru Berhanu <aur attt cheru doot dev>

_pkgname=polymc
pkgname=${_pkgname}-git
pkgver=1.1.1.r209.g4ff1306e
pkgrel=1
pkgdesc="Minecraft launcher with ability to manage multiple instances."
arch=('i686' 'x86_64')
url="https://github.com/PolyMC/PolyMC"
license=('GPL3')
depends=('java-runtime' 'libgl' 'qt5-base' 'qt5-svg' 'qt5-imageformats' 'zlib' 'hicolor-icon-theme')
provides=('polymc')
conflicts=('polymc')
makedepends=('cmake' 'git' 'java-environment')
optdepends=('glfw: to use system GLFW libraries'
            'openal: to use system OpenAL libraries'
            'visualvm: Profiling support'
            'xorg-xrandr: for older minecraft versions'
)
source=("git+https://github.com/PolyMC/PolyMC"
        "git+https://github.com/MultiMC/libnbtplusplus"
        "git+https://github.com/stachenov/quazip")

sha256sums=('SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd PolyMC
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/PolyMC"
  git submodule init
  git config submodule.libnbtplusplus.url "${srcdir}/libnbtplusplus"
  git config submodule.quazip.url "${srcdir}/quazip"
  git submodule update
}

build() {
  cd "${srcdir}/PolyMC"
  mkdir -p build

  cd build
  cmake -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DLauncher_PORTABLE=OFF \
    -DLauncher_APP_BINARY_NAME="${_pkgname}" \
    ..
  cmake --build .
}

check() {
  cd "${srcdir}/PolyMC/build"
  ctest .
}

package() {
  cd "${srcdir}/PolyMC/build"
  DESTDIR="$pkgdir" cmake --install .
}

