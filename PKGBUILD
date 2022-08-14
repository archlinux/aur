# Maintainer: Emma Tebibyte <emma@tebibyte.media>
# Contributor: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: Lenny McLennington <lennymclennington@protonmail.com>
# Contributor: Elijah Gregg <lovetocode999 at tilde dot team>
# Contributor: Miko <mikoxyzzz@gmail.com>
# Contributor: Cheru Berhanu <aur attt cheru doot dev>

_pkgname=pollymc
pkgname=${_pkgname}-qt5-git
pkgver=1.1.1.r1135.g49849b75
pkgrel=1
pkgdesc="Fork of PolyMC that adds Ely.by support and allows you to use offline mode without an account."
arch=('i686' 'x86_64')
url="https://github.com/fn2006/PollyMC"
license=('GPL3')
depends=('java-runtime' 'libgl' 'qt5-base' 'qt5-svg' 'qt5-imageformats' 'zlib' 'hicolor-icon-theme')
provides=('pollymc' 'pollymc-qt5')
conflicts=( )
makedepends=('cmake' 'extra-cmake-modules' 'git' 'java-environment' 'scdoc')
optdepends=('glfw: to use system GLFW libraries'
            'openal: to use system OpenAL libraries'
            'visualvm: Profiling support'
            'xorg-xrandr: for older minecraft versions'
)
source=("git+https://github.com/fn2006/PollyMC"
        "git+https://github.com/PolyMC/libnbtplusplus"
        "git+https://github.com/stachenov/quazip")

sha256sums=('SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd "PollyMC"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "PollyMC"
  git submodule init
  git config submodule.libnbtplusplus.url "${srcdir}/libnbtplusplus"
  git config submodule.quazip.url "${srcdir}/quazip"
  git submodule update
}

build() {

  cmake -DCMAKE_BUILD_TYPE= \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DLauncher_APP_BINARY_NAME="${_pkgname}" \
    -DLauncher_QT_VERSION_MAJOR=5 \
    -Bbuild -SPollyMC
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

