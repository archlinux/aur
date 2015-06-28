# Maintainer: Alfredo Ramos <alfredo dot ramos at yandex dot com>
# Contributor: huiyiqun <huiyiqun@gmail.com>
# Contributor: Thomas Nordenmark <t.nordenmark@gmail.com>

_pkgname=compton-conf
pkgname=${_pkgname}-git
pkgver=0.1.0.r24.g8ae8fbb
pkgrel=1
pkgdesc='A graphical configuration tool for Compton X composite manager. Qt5 UI. Development version.'
arch=('i686' 'x86_64')
url='https://github.com/lxde/compton-conf'
license=('GPL2' 'LGPL2.1')

depends=('qt5-base' 'libconfig')
optdepends=(
	'compton-git: for bleeding-edge compton features'
)
makedepends=('cmake' 'git' 'qt5-tools')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")

source=(
	"git+https://github.com/lxde/${_pkgname}.git"
)
sha512sums=(
	'SKIP'
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
	# Build directory
	mkdir -p ${srcdir}/build
}

build() {
	# Number of jobs
	declare -i njobs=$(nproc)
	
	if [[ ${njobs} -ge 8 ]]; then
		njobs=$(( ${njobs} - 2 ))
	fi

	# Building package
	cd ${srcdir}/build
	cmake ../${_pkgname} \
		-DCMAKE_INSTALL_PREFIX=/usr
	make -j${njobs}
}

package() {
	# Installing package
	cd ${srcdir}/build
	make DESTDIR=${pkgdir} install
}