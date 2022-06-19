#
#  ________  ___       ________  ________           ________     
#|\   __  \|\  \     |\   __  \|\   ___  \        |\  ___  \    
#\ \  \|\  \ \  \    \ \  \|\  \ \  \\ \  \       \ \____   \   
# \ \   ____\ \  \    \ \   __  \ \  \\ \  \       \|____|\  \  
#  \ \  \___|\ \  \____\ \  \ \  \ \  \\ \  \          __\_\  \ 
#   \ \__\    \ \_______\ \__\ \__\ \__\\ \__\        |\_______\
#    \|__|     \|_______|\|__|\|__|\|__| \|__|        \|_______|
#                                                               
#                                                               
#                                                               
#     ________  ________  ________  ___  __    ________      
#    |\   __  \|\   __  \|\   ____\|\  \|\  \ |\   ____\     
#    \ \  \|\  \ \  \|\  \ \  \___|\ \  \/  /|\ \  \___|_    
#     \ \   _  _\ \  \\\  \ \  \    \ \   ___  \ \_____  \   
#      \ \  \\  \\ \  \\\  \ \  \____\ \  \\ \  \|____|\  \  
#       \ \__\\ _\\ \_______\ \_______\ \__\\ \__\____\_\  \ 
#        \|__|\|__|\|_______|\|_______|\|__| \|__|\_________\
#                                                \|_________|
#


# Maintainer: Elijah Gregg <lovetocode999 at tilde dot team>
# Contributor: Lenny McLennington <lennymclennington@protonmail.com>
# Contributor: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: Miko <mikoxyzzz@gmail.com>
# Contributor: Cheru Berhanu <aur attt cheru doot dev>

_pkgname=polymc-cracked
pkgname=${_pkgname}-git
pkgver=1.2.1.r0.g5adcc261
pkgrel=1
pkgdesc="PolyMC Minecraft launcher, cracked to work without MS/Mojang account."
arch=('i686' 'x86_64')
url="https://github.com/PolyMC/PolyMC"
license=('GPL3')
depends=('java-runtime' 'libgl' 'qt5-base' 'qt5-svg' 'qt5-imageformats' 'zlib' 'hicolor-icon-theme')
provides=('polymc')
conflicts=('polymc')
makedepends=('cmake' 'git' 'java-environment' 'curl')
optdepends=('glfw: to use system GLFW libraries'
            'openal: to use system OpenAL libraries'
            'visualvm: Profiling support'
            'xorg-xrandr: for older minecraft versions'
)
source=("git+https://github.com/PolyMC/PolyMC"
        "git+https://github.com/PolyMC/libnbtplusplus"
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
  curl https://plan9.rocks/polymc/MSAStep.diff > MSAStep.diff
  curl https://plan9.rocks/polymc/AccountListPage.diff > AccountListPage.diff
  patch -p0 < MSAStep.diff
  patch -p0 < AccountListPage.diff
}

build() {
  cd "${srcdir}/PolyMC"
  mkdir -p build

  cd build
  cmake -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
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
