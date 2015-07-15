# Maintainer: Alfredo Ramos <alfredo dot ramos at yandex dot com>
# Contributor: Giacomo <giacomogiorgianni at gmail dot com>

pkgname=vokoscreen
_pkgver=2.4.3-beta
pkgver=${_pkgver/-/.}
pkgrel=2
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
	'qdatastream_fix.patch'
	'desktop_file.patch'
)
sha512sums=(
	'8a5c5d1f76afd89ca7861a0f498936186a55639c28ce18df880b6606aca7eec9d636f70f82412d7744b702ea9dd889e7ec6b64bb39a5a41ecc052aa45994cdba'
	'301ad97abcb5ad731ee4a95ebf00b6fe47d53cb1e0342df00290f61e8c0316b4e2621c0743212a480bbe0a3699659f2fff1196629de0ebf843dc1b0d2997f889'
	'3ddc567f831b9f6e2672997a77a099cf8fdd5a6a1d79157738c1670c9106fd6c4e09d74287a770c19bac23dcb73a19ce69cc1ac893d4988f75c7ac35668f7a90'
)

prepare() {
	cd ${srcdir}/${pkgname}-${_pkgver}
	
	# Qt 5.5 fix
	patch QtSingleApplicationQt5/qtlocalpeer.h ../qdatastream_fix.patch
	
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