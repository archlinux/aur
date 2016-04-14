# Maintainer: Alfredo Ramos <alfredo dot ramos at yandex dot com>
# Contributor: Thomas Nordenmark <t.nordenmark@gmail.com>

pkgname=compton-conf
pkgver=0.1.0
pkgrel=3
pkgdesc='A graphical configuration tool for Compton X composite manager. Qt4 UI.'
arch=('i686' 'x86_64')
url="https://github.com/lxde/compton-conf"
license=('LGPL2.1')

depends=('qt4' 'libconfig')
makedepends=('cmake')
provides=("${pkgname}=${pkgver}")
conflicts=("${pkgname}-git")

source=(
	"${pkgname}-${pkgver}.tar.gz::https://github.com/lxde/${pkgname}/archive/${pkgver}.tar.gz"
	'desktop_entry.patch'
)
sha512sums=(
	'863b7a90ba369fa91f943e4b03cec079457ce2f216d79987e7f695274a8249e15677f88bd169cf5bb1aff5f821342b150aa68e139d034321cf35542bd393b77a'
	'16698ca382bd1eba895a4240756b7b4d03d2edfe69aacb182c984f1fbb6a9b1bf291738ebbe97113a6c588c5954061321feff817e33f70b2b1b1214916fc283a'
)

prepare() {
	# Patch desktop entry
	cd "${srcdir}"/${pkgname}-${pkgver}
	patch -p1 < ../desktop_entry.patch
	
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
	cmake ../${pkgname}-${pkgver} \
		-DCMAKE_INSTALL_PREFIX=/usr
	make -j${njobs}
}

package() {
	# Installing package
	cd "${srcdir}"/build
	make DESTDIR="${pkgdir}" install
}
