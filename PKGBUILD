# Maintainer: Riley Trautman <asonix.dev@gmail.com>
# Contributor: Michael Spencer <sonrisesoftware@gmail.com>

_pkgname=papyros-shell
pkgname=${_pkgname}-git
pkgver=0.0.5.r177.g3a9a8a6
pkgrel=1
pkgdesc="Wayland and QtQuick based desktop shell for Papyros"
arch=("i686" "x86_64")
url="https://github.com/papyros/papyros-shell"
license=("GPL")
depends=("qt5-base-dev-git" "qt5-declarative" "qt5-quickcontrols" "qt5-wayland-dev-git" "qt5-graphicaleffects" "greenisland" "qml-material-git" "kdeclarative" "pam" "libpulse" "libqtxdg" "solid" "kconfig" "networkmanager-qt" "ttf-dejavu" "ttf-droid" "libpapyros-git" )
optdepends=(
'networkmanager: networking support'
'paper-icon-theme: default icon theme'
'pulseaudio: audio support'
'sddm: login screen theme'
)
makedepends=("git" "qt5-tools" "cmake" "extra-cmake-modules")
provides=("${_pkgname}")
conflicts=("${_pkgname}" )
source=("${_pkgname}::git+https://github.com/papyros/papyros-shell.git#branch=develop")
sha256sums=("SKIP")

pkgver() {
  cd "$srcdir/${_pkgname}"
  (set -o pipefail
  git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake $srcdir/${_pkgname} \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DLIBEXEC_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}

# Additional functions to generate a changelog

changelog() {
  cd "$srcdir/${_pkgname}"
  git log $1..HEAD --no-merges --format=" * %s"
}

gitref() {
  cd "$srcdir/${_pkgname}"
  git rev-parse HEAD
}
