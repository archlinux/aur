# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: Elijah Gregg <lovetocode999 at tilde dot team>
# Contributor: Lenny McLennington <lennymclennington@protonmail.com>
# Contributor: Miko <mikoxyzzz@gmail.com>
# Contributor: Cheru Berhanu <aur attt cheru doot dev>

_pkgname=prismlauncher
pkgname=${_pkgname}-qt5-git
pkgver=1.4.0.r365.gafaef4e8
pkgrel=1
pkgdesc="Minecraft launcher with ability to manage multiple instances."
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/PlaceholderMC/PlaceholderMC"
license=('GPL3')
depends=('java-runtime' 'libgl' 'qt5-base' 'qt5-svg' 'qt5-imageformats' 'zlib' 'hicolor-icon-theme' 'quazip-qt5')
provides=('polymc' 'polymc-qt5')
conflicts=('polymc' 'polymc-qt5')
makedepends=('cmake' 'extra-cmake-modules' 'git' 'java-environment' 'scdoc' 'tomlplusplus' 'ghc-filesystem')
optdepends=('glfw: to use system GLFW libraries'
            'openal: to use system OpenAL libraries'
            'visualvm: Profiling support'
            'xorg-xrandr: for older minecraft versions'
)
source=("PlaceholderMC::git+https://github.com/PlaceholderMC/PrismLauncher.git"
        "libnbtplusplus::git+https://github.com/PlaceholderMC/libnbtplusplus.git")

sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd "PlaceholderMC"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "PlaceholderMC"
  git submodule init
  git config submodule.depends/libnbtplusplus.url "${srcdir}/libnbtplusplus"
  git config submodule.libraries/quazip.active false
  git config submodule.libraries/tomlplusplus.active false
  git config submodule.libraries/filesystem.active false
  git submodule update
}

build() {

  cmake -DCMAKE_BUILD_TYPE= \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DLauncher_APP_BINARY_NAME="${_pkgname}" \
    -DLauncher_QT_VERSION_MAJOR=5 \
    -DBUILD_TESTING=OFF \
    -Bbuild -SPlaceholderMC
  cmake --build build
}

package() {
  cd "build"
  DESTDIR="$pkgdir" cmake --install .
}

