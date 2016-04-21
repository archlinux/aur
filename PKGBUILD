# Maintainer: Alfredo Ramos <alfredo dot ramos at yandex dot com>
# Contributor: Arthur Țițeică arthur.titeica/gmail/com
# Contributor: Thomas Laube <tomx3@tomtomtom.org>

_pkgname=vokoscreen
pkgname=${_pkgname}-git
pkgver=2.4.21.beta.3.gd2d38f3
pkgrel=2
pkgdesc='An easy to use screencast creator. Qt5 UI. Development version.'
arch=('i686' 'x86_64')
url='http://linuxecke.volkoh.de/vokoscreen/vokoscreen.html'
license=('GPL2')

depends=(
	'qt5-x11extras' 'ffmpeg' 'lame'
	'desktop-file-utils' 'xdg-utils' 'lsof'
)
optdepends=(
	'pulseaudio-alsa: for PulseAudio support'
)
makedepends=('git' 'qt5-tools')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")

install=${pkgname}.install

source=(
	"git+https://github.com/vkohaupt/${_pkgname}.git"
	'fix_lrelease.patch'
	'desktop_file.patch'
)
sha512sums=(
	'SKIP'
	'9e4b70ccca8fd3b2abb5e21a379334fcb79c41383e6362e6f6c984a7c0f52aacbf419524b062c8905bf46846d1ba8a38056e37bb7dc1b139e6a5b6982be9e296'
	'3ddc567f831b9f6e2672997a77a099cf8fdd5a6a1d79157738c1670c9106fd6c4e09d74287a770c19bac23dcb73a19ce69cc1ac893d4988f75c7ac35668f7a90'
)

pkgver() {
	# Updating package version
	cd "${srcdir}"/${_pkgname}
	git describe --long --tags 2>/dev/null | sed -r 's/-/./g'
}

prepare() {
	cd "${srcdir}"/${_pkgname}

	# Fix lrelease path
	patch -Np1 < ../fix_lrelease.patch

	# Desktop entry
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
	qmake-qt5 ../${_pkgname} \
		CONFIG+=release \
		CONFIG+=c++14

	make -j${njobs}
}

package() {
	# Installing package
	cd "${srcdir}"/build
	make INSTALL_ROOT="${pkgdir}" install
}
