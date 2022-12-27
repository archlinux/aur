# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>
# Maintainer: Lenny McLennington <lennymclennington@protonmail.com>
# Contributor: Elijah Gregg <lovetocode999 at tilde dot team>
# Contributor: Miko <mikoxyzzz@gmail.com>
# Contributor: Cheru Berhanu <aur attt cheru doot dev>

_pkgname=polymc
pkgname=${_pkgname}-qt5-git
pkgver=1.4.0.r390.g7839bd0e
pkgrel=1
pkgdesc="Minecraft launcher with ability to manage multiple instances."
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/PolyMC/PolyMC"
license=('GPL3')
depends=('java-runtime' 'libgl' 'qt5-base' 'qt5-svg' 'qt5-imageformats' 'zlib' 'hicolor-icon-theme' 'quazip-qt5' 'qt5-charts')
provides=('polymc' 'polymc-qt5')
conflicts=('polymc' 'polymc-qt5')
makedepends=('cmake' 'extra-cmake-modules' 'git' 'java-environment' 'scdoc' 'tomlplusplus' 'ghc-filesystem')
optdepends=('glfw: to use system GLFW libraries'
            'openal: to use system OpenAL libraries'
            'visualvm: Profiling support'
            'xorg-xrandr: for older minecraft versions'
)
source=("git+https://github.com/PolyMC/PolyMC"
        "git+https://github.com/PolyMC/libnbtplusplus")

sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd "PolyMC"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "PolyMC"
  git submodule init
  git config submodule.depends/libnbtplusplus.url "${srcdir}/libnbtplusplus"
  git config submodule.libraries/quazip.active false
  git config submodule.libraries/tomlplusplus.active false
  git config submodule.libraries/filesystem.active false
  git -c protocol.file.allow=always submodule update
}

build() {

  cmake -DCMAKE_BUILD_TYPE= \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DLauncher_APP_BINARY_NAME="${_pkgname}" \
    -DLauncher_QT_VERSION_MAJOR=5 \
    -DBUILD_TESTING=OFF \
    -Bbuild -SPolyMC
  cmake --build build
}

package() {
  cd "build"
  DESTDIR="$pkgdir" cmake --install .
}

