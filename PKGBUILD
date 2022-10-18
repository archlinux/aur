# Maintainer: Ersei <contact@ersei.net>
# Contributer: Elijah Gregg <lovetocode999 at tilde dot team>
# Contributor: Lenny McLennington <lennymclennington@protonmail.com>
# Contributor: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: Miko <mikoxyzzz@gmail.com>
# Contributor: Cheru Berhanu <aur attt cheru doot dev>

_pkgname=placeholdermc
pkgname=${_pkgname}-git
pkgver=1.4.0.r356.g0868a5e5
pkgrel=3
pkgdesc="Minecraft launcher with ability to manage multiple instances."
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/PlaceholderMC/PlaceholderMC"
license=('GPL3')
depends=('java-runtime' 'libgl' 'qt6-base' 'qt6-5compat' 'qt6-svg' 'qt6-imageformats' 'zlib' 'hicolor-icon-theme' 'quazip-qt6')
provides=('polymc')
conflicts=('polymc')
makedepends=('cmake' 'extra-cmake-modules' 'git' 'java-environment' 'scdoc' 'tomlplusplus' 'ghc-filesystem')
optdepends=('glfw: to use system GLFW libraries'
            'openal: to use system OpenAL libraries'
            'visualvm: Profiling support'
            'xorg-xrandr: for older minecraft versions'
)
options=(debug)
# Tagged commit to prevent supply chain attack
source=("git+https://github.com/PlaceholderMC/PlaceholderMC"
        "git+https://github.com/PolyMC/libnbtplusplus#commit=2203af7eeb48c45398139b583615134efd8d407f")

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
    -DLauncher_QT_VERSION_MAJOR="6" \
	-DLauncher_APP_BINARY_NAME="PlaceholderMC" \
	-DLauncher_META_URL="https://meta.scrumplex.rocks/v1/" \
	-DLauncher_NEWS_RSS_URL="" \
	-DLauncher_NEWS_OPEN_URL="" \
	-DLauncher_HELP_URL="" \
    -Bbuild -SPlaceholderMC
  cmake --build build
}

check() {
  cd "build"
  ctest .
}

package() {
  cd "build"
  DESTDIR="$pkgdir" cmake --install .
}

