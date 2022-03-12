# Maintainer: Yellow <yellow@example.com>
# Contributor: Elijah Gregg <lovetocode999@tilde.team>
# Contributor: Lenny McLennington <lennymclennington@protonmail.com>
# Contributor: Miko <mikoxyzzz@gmail.com>
# Contributor: Cheru Berhanu <aur attt cheru doot dev>

pkgname=polymc
pkgver=1.1.0
pkgrel=2
pkgdesc="Minecraft launcher with ability to manage multiple instances."
arch=('i686' 'x86_64')
url="https://github.com/PolyMC/PolyMC"
license=('GPL3')
depends=('java-runtime' 'libgl' 'qt5-base' 'zlib')
provides=('polymc')
conflicts=('polymc' 'multimc')
makedepends=('cmake' 'git' 'java-environment')
optdepends=('glfw: to use system GLFW libraries'
            'openal: to use system OpenAL libraries'
            'visualvm: Profiling support'
            'xorg-xrandr: for older minecraft versions'
)
source=("PolyMC::git+https://github.com/PolyMC/PolyMC#tag=${pkgver}"
        "git+https://github.com/MultiMC/libnbtplusplus#commit=dc72a20b7efd304d12af2025223fad07b4b78464"
        "git+https://github.com/PolyMC/quazip#commit=c9ef32de19bceb58d236f5c22382698deaec69fd")

sha256sums=('SKIP'
            'SKIP'
            'SKIP')

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
