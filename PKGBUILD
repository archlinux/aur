# Maintainer: Alfredo Ramos <alfredo dot ramos at yandex dot com>
# Contributor: kusakata <shohei atmark kusakata period com>

pkgname=freeminer
pkgver=0.4.12.6
pkgrel=4
pkgdesc="An open source sandbox game inspired by Minecraft."
arch=(
	"${CARCH}"
)
url="http://freeminer.org/"
license=(
	"GPL3"
	"CCPL:cc-by-sa-3.0"
)

depends=(
	"irrlicht"
	"leveldb"
	"libvorbis"
	"openal"
	"sqlite"
	"curl"
	"luajit"
	"msgpack-c-0.5"
	"xdg-utils"
	"hicolor-icon-theme"
)
optdepends=()
makedepends=(
	"cmake"
)
provides=(
	"${pkgname}=${pkgver}"
)
conflicts=(
	"${pkgname}-git"
)
replaces=(
	"${pkgname}-git"
)

install=${pkgname}.install

source=(
	"https://github.com/${pkgname}/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.zip"
	"${pkgname}.install"
)
sha512sums=(
	"046f08088e500c6cc2f454c1b7599a7829b9b865a14240dfa7d0d3ded5dd2daf12f2c9f9bed2c9620f44983b0b4c23e9abaddf10bcd8252eb6593722ea5b87fd"
	"d590345e9b87e4350b7420eebf8f69e4ad65a53415257573b569ed1c85568a40b4f65fc8df5925f7c03af75d340c52a10a4d1389e5d868816aef9711102ebef1"
)

prepare() {
	# Create build directory
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
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DRUN_IN_PLACE=0
	make -j${njobs}
}

package() {
	# Installing package
	cd ${srcdir}/build
	make DESTDIR=${pkgdir} install
}