# Maintainer: Alfredo Ramos <alfredo dot ramos at yandex dot com>
# Contributor: huiyiqun <huiyiqun@gmail.com>
# Contributor: Thomas Nordenmark <t.nordenmark@gmail.com>

_pkgname=compton-conf
pkgname=${_pkgname}-git
pkgver=0.1.0.32.gfc667eb
pkgrel=3
pkgdesc='A graphical configuration tool for Compton X composite manager. Qt5 UI. Development version.'
arch=('i686' 'x86_64')
url='https://github.com/lxde/compton-conf'
license=('LGPL2.1')

depends=('qt5-base' 'libconfig')
makedepends=('cmake' 'git' 'qt5-tools')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")

source=(
	"git+https://github.com/lxde/${_pkgname}.git"
	'desktop_entry.patch'
)
sha512sums=(
	'SKIP'
	'1874fd90bb791542440c444d7809a03f651045f2acde7db194d309f67c75d81cacf656912f4b4837fade265994737522a0b51b347fc930296ce6ce70051b020e'
)

pkgver() {
	# Updating package version
	cd "${srcdir}"/${_pkgname}
	git describe --long --tags 2>/dev/null | sed -r 's/-/./g'
}

prepare() {
	# Patch desktop entry
	cd "${srcdir}"/${_pkgname}
	patch -Np1 < ../desktop_entry.patch
	
	# Build directory
	mkdir -p "${srcdir}"/build
}

build() {
	# Number of jobs
	declare -i njobs=$(nproc)
	
	if [[ ${njobs} -ge 8 ]]; then
		njobs=$(( ${njobs} - 2 ))
	fi

	# Building package
	cd "${srcdir}"/build
	cmake ../${_pkgname} \
		-DCMAKE_INSTALL_PREFIX=/usr
	make -j${njobs}
}

package() {
	# Installing package
	cd "${srcdir}"/build
	make DESTDIR="${pkgdir}" install
}
