# Maintainer: cat <aur@plan9.rocks>

_pkgname=polymc-cracked
pkgname=${_pkgname}-git
pkgver=3832.782929c4
pkgrel=1
pkgdesc="The PolyMC launcher, modified to allow the use of offline Minecraft accounts."
arch=('i686' 'x86_64')
url="https://github.com/catfromplan9/PolyMC-Cracked"
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
source=("git+https://github.com/catfromplan9/PolyMC-Cracked"
        "git+https://github.com/PolyMC/libnbtplusplus"
        "git+https://github.com/stachenov/quazip")

sha256sums=('SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd PolyMC-Cracked
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/PolyMC-Cracked"
  git submodule init
  git config submodule.libnbtplusplus.url "${srcdir}/libnbtplusplus"
  git config submodule.quazip.url "${srcdir}/quazip"
  git submodule update
}

build() {
  cd "${srcdir}/PolyMC-Cracked"
  mkdir -p build

  cd build
  cmake -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DLauncher_APP_BINARY_NAME="polymc" \
    ..
  cmake --build .
}

check() {
  cd "${srcdir}/PolyMC-Cracked/build"
  ctest .
}

package() {
  cd "${srcdir}/PolyMC-Cracked/build"
  DESTDIR="$pkgdir" cmake --install .
}
