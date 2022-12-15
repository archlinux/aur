# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>
# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: Elijah Gregg <lovetocode999 at tilde dot team>
# Contributor: Lenny McLennington <lennymclennington@protonmail.com>
# Contributor: Miko <mikoxyzzz@gmail.com>
# Contributor: Cheru Berhanu <aur attt cheru doot dev>

_pkgname=prismlauncher
pkgname=${_pkgname}-qt5-git
pkgver=5.0.r71.g7f441f5b
pkgrel=1
pkgdesc="Minecraft launcher with ability to manage multiple instances."
arch=('i686' 'x86_64' 'aarch64')
url="https://prismlauncher.org"
license=('GPL3')
depends=('java-runtime' 'libgl' 'qt5-base' 'qt5-svg' 'qt5-imageformats' 'zlib' 'hicolor-icon-theme' 'quazip-qt5')
provides=('prismlauncher' 'prismlauncher-qt5')
conflicts=('prismlauncher' 'prismlauncher-qt5')
makedepends=('cmake' 'extra-cmake-modules' 'git' 'java-environment' 'scdoc' 'tomlplusplus' 'ghc-filesystem' 'gamemode')
optdepends=('glfw: to use system GLFW libraries'
            'openal: to use system OpenAL libraries'
            'visualvm: Profiling support'
            'xorg-xrandr: for older minecraft versions'
)
source=("git+https://github.com/PrismLauncher/PrismLauncher.git"
        "git+https://github.com/PrismLauncher/libnbtplusplus.git")

sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd "PrismLauncher"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "PrismLauncher"
  git submodule init
  git config submodule.libraries/libnbtplusplus.url "${srcdir}/libnbtplusplus"
  git config submodule.libraries/quazip.active false
  git config submodule.libraries/tomlplusplus.active false
  git config submodule.libraries/filesystem.active false
  git submodule--helper update
}

build() {

  cmake -DCMAKE_BUILD_TYPE= \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DLauncher_APP_BINARY_NAME="${_pkgname}" \
    -DLauncher_QT_VERSION_MAJOR=5 \
    -DBUILD_TESTING=OFF \
    -Bbuild -SPrismLauncher
  cmake --build build
}

package() {
  cd "build"
  DESTDIR="$pkgdir" cmake --install .
}

