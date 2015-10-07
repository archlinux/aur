# Maintainer: Alfredo Ramos <alfredo dot ramos at yandex dot com>
# Contributor: Giacomo <giacomogiorgianni at gmail dot com>

pkgname=vokoscreen
_pkgver=2.4.4-beta
pkgver=${_pkgver/-/.}
pkgrel=1
pkgdesc='An easy to use screencast creator. Qt5 UI.'
arch=('i686' 'x86_64')
url='http://linuxecke.volkoh.de/vokoscreen/vokoscreen.html'
license=('GPL2')

depends=('ffmpeg' 'lame' 'qt5-x11extras')
optdepends=(
	'pulseaudio-alsa: for PulseAudio support'
)
makedepends=('qt5-tools')
provides=("${pkgname}=${pkgver}")
conflicts=("${pkgname}-git")

source=(
	"${pkgname}-${_pkgver}.tar.gz::https://github.com/vkohaupt/${pkgname}/archive/${_pkgver}.tar.gz"
	'desktop_file.patch'
)
sha512sums=(
	'fd0da0bdfbe5baa63fa1bcf8f3d9f629854730835ff6c30b0818c981bda8288bb2581407a6d76f630196985a64898510c3fe96feda1fa2ebd158539bbd503aac'
	'3ddc567f831b9f6e2672997a77a099cf8fdd5a6a1d79157738c1670c9106fd6c4e09d74287a770c19bac23dcb73a19ce69cc1ac893d4988f75c7ac35668f7a90'
)

prepare() {
	cd ${srcdir}/${pkgname}-${_pkgver}
	
	# Desktop file description
	patch applications/${pkgname}.desktop ../desktop_file.patch

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
	qmake-qt5 ../${pkgname}-${_pkgver} \
		CONFIG+=release \
		CONFIG+=c++14 \
		-spec linux-g++

	make -j${njobs}
}

package() {
	# Installing package
	cd ${srcdir}/build
	make INSTALL_ROOT=${pkgdir} install
}