# Maintainer: Alfredo Ramos <alfredo dot ramos at yandex dot com>
# Contributor: Giacomo <giacomogiorgianni at gmail dot com>

pkgname=vokoscreen
_pkgver=2.4.18-beta
pkgver=${_pkgver/-/.}
pkgrel=1
pkgdesc='An easy to use screencast creator. Qt5 UI.'
arch=('i686' 'x86_64')
url='http://linuxecke.volkoh.de/vokoscreen/vokoscreen.html'
license=('GPL2')

depends=('ffmpeg' 'lame' 'qt5-x11extras' 'desktop-file-utils')
optdepends=(
	'pulseaudio-alsa: for PulseAudio support'
)
makedepends=('qt5-tools')
provides=("${pkgname}=${pkgver}")
conflicts=("${pkgname}-git")

install=${pkgname}.install

source=(
	"${pkgname}-${_pkgver}.tar.gz::https://github.com/vkohaupt/${pkgname}/archive/${_pkgver}.tar.gz"
	'lrelease_qt5_fix.patch'
	'desktop_file.patch'
)
sha512sums=(
	'1f0717c34e625cad57141f24369420a2a4fdbb7ebe7a2fb9e6ad1c6e107b546259247c39dd472815161f4942dabde001a6592615339e1016b81b8615d0e9d649'
	'f85d0c1c2fb264ef201870cfc595042b5ef1e5ec8884c46dbc7b1ff19808d934179de3fca23d5b208fa4913f475dd52e7a86cc13d4a62a89bcfd91b5141dd87c'
	'3ddc567f831b9f6e2672997a77a099cf8fdd5a6a1d79157738c1670c9106fd6c4e09d74287a770c19bac23dcb73a19ce69cc1ac893d4988f75c7ac35668f7a90'
)

prepare() {
	cd "${srcdir}"/${pkgname}-${_pkgver}

	# lrelease fix
	patch -Np1 < ../lrelease_qt5_fix.patch
	
	# Desktop file description
	patch -Np1 < ../desktop_file.patch

	# Create build directory
	mkdir -p "${srcdir}"/build
}

build() {
	# Number of jobs
	declare -i njobs=$(nproc)

	if [[ ${njobs} -ge 8 ]]; then
		njobs=$(( $njobs - 2 ))
	fi

	# Building package
	cd "${srcdir}"/build
	qmake-qt5 ../${pkgname}-${_pkgver} \
		CONFIG+=release \
		CONFIG+=c++14 \
		-spec linux-g++

	make -j${njobs}
}

package() {
	# Installing package
	cd "${srcdir}"/build
	make INSTALL_ROOT="${pkgdir}" install
}
