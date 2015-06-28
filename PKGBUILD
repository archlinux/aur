# Maintainer: Alfredo Ramos <alfredo dot ramos at yandex dot com>
# Contributor: Thomas Nordenmark <t.nordenmark@gmail.com>

pkgname=compton-conf
pkgver=0.1.0
pkgrel=1
pkgdesc='A graphical configuration tool for Compton X composite manager. Qt4 UI.'
arch=('i686' 'x86_64')
url="https://github.com/lxde/compton-conf"
license=('GPL2' 'LGPL2.1')

depends=('qt4' 'libconfig')
optdepends=(
	'compton-git: for bleeding-edge compton features'
)
makedepends=('cmake')
provides=("${pkgname}=${pkgver}")
conflicts=("${pkgname}-git")

source=(
	"${pkgname}-${pkgver}.tar.gz::https://github.com/lxde/${pkgname}/archive/${pkgver}.tar.gz"
	'desktop_entry.patch'
)
sha512sums=(
	'863b7a90ba369fa91f943e4b03cec079457ce2f216d79987e7f695274a8249e15677f88bd169cf5bb1aff5f821342b150aa68e139d034321cf35542bd393b77a'
	'793ccb1c39852e5b939a71f651de17ad68e251a1a40d54feceb3cdfc24686ff75b61dd73cd4b1a794bee8e2c15cc09839c1b6c58f15a5d68b999c125455bc23a'
)

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
	cmake ../${pkgname}-${pkgver} \
		-DCMAKE_INSTALL_PREFIX=/usr
	make -j${njobs}
}

package() {
	# Installing package
	cd ${srcdir}/build
	make DESTDIR=${pkgdir} install
	
	# Patch desktop file
	cd ${pkgdir}
	patch ./usr/share/applications/compton-conf.desktop ../../desktop_entry.patch
}