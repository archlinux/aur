# Maintainer: Riley Trautman <asonix.dev@gmail.com>
# Contributor: Michael Spencer <sonrisesoftware@gmail.com>

_pkgname=papyros-shell
pkgname=$_pkgname-git
pkgver=0.0.5.r126.gd440aef
pkgrel=1
pkgdesc="Wayland and QtQuick based desktop shell for Papyros"
arch=("i686" "x86_64")
url="https://github.com/papyros/papyros-shell"
license=("GPL")
depends=("qt5-base" "qt5-declarative" "qt5-quickcontrols" "qt5-graphicaleffects"
         "greenisland" "qml-material-git" "kdeclarative" "pam"
         "libpulse" "libqtxdg" "solid" "kconfig" "plasma-nm" "qt5-tools")
optdepends=('pulseaudio: audio support' 'sddm: login screen theme')
makedepends=("git" "python" "extra-cmake-modules")
provides=("$pkgname")
conflicts=("$_pkgname")
source=("$pkgname::git+https://github.com/papyros/papyros-shell.git#branch=develop")
sha256sums=("SKIP")

pkgver() {
  cd "$pkgname"
  # cutting off 'foo-' prefix that presents in the git tag
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	mkdir -p build
	cd build
	cmake "$srcdir/$pkgname" \
			-DCMAKE_INSTALL_PREFIX=/usr \
			-DLIB_INSTALL_DIR=lib \
			-DLIBEXEC_INSTALL_DIR=lib \
			-DQML_INSTALL_DIR=lib/qt/qml \
			-DKDE_INSTALL_USE_QT_SYS_PATHS=ON
	make
}

package() {
	cd build
	make DESTDIR="${pkgdir}" install
}

# Additional functions to generate a changelog

changelog() {
    cd "$pkgname"
  	git log $1..HEAD --no-merges --format=" * %s"
}

gitref() {
    cd "$pkgname"
  	git rev-parse HEAD
}
