# Maintainer: Michael Spencer <sonrisesoftware@gmail.com>

_pkgname=libpapyros
pkgname=${_pkgname}-git
pkgver=0
pkgrel=1
pkgdesc="Library of common classes for Papyros"
arch=("i686" "x86_64")
url="https://github.com/papyros/libpapyros"
license=("GPL")
depends=("qt5-base-git" "qt5-declarative" "kconfig")
makedepends=("git" "python" "extra-cmake-modules")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/papyros/libpapyros.git")
sha256sums=("SKIP")

pkgver() {
  	cd "$srcdir/${_pkgname}"

    ( set -o pipefail
        git describe --long 2>/dev/null | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

prepare() {
	mkdir -p build
	cd build
	cmake "$srcdir/${_pkgname}" \
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
    cd "${_pkgname}"
  	git log $1..HEAD --no-merges --format=" * %s"
}

gitref() {
    cd "${_pkgname}"
  	git rev-parse HEAD
}
