# Maintainer: Alfredo Ramos <alfredo dot ramos at yandex dot com>

_pkgname=kreogist-mu
pkgname=${_pkgname}-git
pkgver=0.8.r2.gc032f1a
pkgrel=1
pkgdesc='A free and open source cross-platform music manager. Qt5 build. Development version.'
arch=('i686' 'x86_64')
url='https://kreogist.github.io/Mu/en/index.html'
license=('GPL')

depends=('ffmpeg' 'gst-libav' 'phonon-qt5' 'phonon-qt5-gstreamer' 'desktop-file-utils')
optdepends=(
	'gst-plugins-good: good plugin libraries'
	'gst-plugins-bad: bad plugin libraries'
	'gst-plugins-ugly: ugly plugin libraries'
)
makedepends=('git' 'qt5-tools')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")

install=${pkgname}.install

source=(
	"${_pkgname}::git+https://github.com/Kreogist/Mu.git"
	"${pkgname}.install"
	'install_targets.patch'
	'desktop_entry.patch'
)
sha512sums=(
	'SKIP'
	'ac9be39d90d5696142b61e00f74577cec23d379be128965642a92cabefd5ed9c511fedeb7cec068f24224d96aa5ace9992920c5a4dd54f90c59a93442f14079a'
	'864be8c493ed28804a1d60402f5600284ceec588d3888061523617adf1cba5c5252502222f6b687e756007bb99cc8fedfb0cbc30496937f258bc0db4beee4916'
	'323c13503c22107abbe436246ecc24f1c640ba768705c0d14686a994122c90a33160128ca30a5134a4bc5c6e3b017a998a5afda063af937132b59ddf8b35fc05'
)

pkgver() {
	# Updating package version
	cd ${srcdir}/${_pkgname}
	(
		set -o pipefail
		git describe --long --tags 2>/dev/null | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

prepare() {
	# Patching project file
	cd ${srcdir}/${_pkgname}
	patch ./src/src.pro < ../install_targets.patch
	patch ./debian/mu.desktop < ../desktop_entry.patch

	# Create build directory
	mkdir -p ${srcdir}/build
}

build() {
	# Number of jobs
	declare -i njobs=$(nproc)

	if [[ ${njobs} -ge 8 ]]; then
		njobs=$(( $njobs - 2 ))
	fi

	# Building package
	cd ${srcdir}/build
	qmake-qt5 ../${_pkgname} \
		CONFIG+=release \
		-spec linux-g++

	make -j${njobs}
}

package() {
	# Installing package
	cd ${srcdir}/build
	make INSTALL_ROOT=${pkgdir} install
}