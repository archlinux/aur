# Maintainer: Alfredo Ramos <alfredo dot ramos at yandex dot com>
# Contributor: Arthur Țițeică arthur.titeica/gmail/com
# Contributor: Thomas Laube <tomx3@tomtomtom.org>

_pkgname=vokoscreen
pkgname=${_pkgname}-git
pkgver=2.3.6.beta.r1.g6cf2dee
pkgrel=2
pkgdesc='An easy to use screencast creator. Qt5 UI. Development version.'
arch=('i686' 'x86_64')
url='http://linuxecke.volkoh.de/vokoscreen/vokoscreen.html'
license=('GPL2')

depends=('ffmpeg' 'lame' 'qt5-x11extras')
optdepends=(
	'pulseaudio-alsa: for PulseAudio support'
)
makedepends=('git' 'qt5-tools')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")

source=(
	"git+https://github.com/vkohaupt/${_pkgname}.git"
	'desktop_file.patch'
	'moc_qvkscreenkey_fix.patch'
)
sha512sums=(
	'SKIP'
	'3ddc567f831b9f6e2672997a77a099cf8fdd5a6a1d79157738c1670c9106fd6c4e09d74287a770c19bac23dcb73a19ce69cc1ac893d4988f75c7ac35668f7a90'
	'1cb8bf086d5eb0541dfaa6606fb04a978c280a381e7fa39f562d5e27032642d434362a4e13618a0f8c2b36418aebeabe93264bb35eb97a085e9275a3472d0da0'
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
	# Patching *.desktop file
	cd ${srcdir}/${_pkgname}
	patch ./applications/${_pkgname}.desktop ../desktop_file.patch
	
	# Fix QvkScreenkey.h
	# https://forum.qt.io/topic/41817/expected-unqualified-id-before-int-with-qt5-3-only-for-bool-signal-and-slot/2
	patch ./screenkey/QvkScreenkey.h ../moc_qvkscreenkey_fix.patch

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
		CONFIG+=c++14 \
		-spec linux-g++

	make -j${njobs}
}

package() {
	# Installing package
	cd ${srcdir}/build
	make INSTALL_ROOT=${pkgdir} install
}