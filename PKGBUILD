# Maintainer: Alfredo Ramos <alfredo dot ramos at yandex dot com>
# Contributor: Martin C. Doege <mdoege at compuserve dot com>
# Contributor: kusakata <shohei atmark kusakata period com>

_pkgname=freeminer
pkgname=${_pkgname}-git
pkgver=0.4.13.7.779.g57d6532
pkgrel=2
pkgdesc='An open source sandbox game inspired by Minecraft. Development version.'
arch=('i686' 'x86_64')
url='http://freeminer.org/'
license=('GPL3' 'CCPL:cc-by-sa-3.0')

depends=('leveldb' 'curl' 'hiredis' 'sqlite' 'luajit' 'xdg-utils' 'irrlicht' 'openal' 'enet' 'jsoncpp' 'libvorbis' 'hicolor-icon-theme' 'freetype2')
makedepends=('cmake' 'git' 'msgpack-c' 'clang')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")

install=${pkgname}.install

source=(
	"git+https://github.com/${_pkgname}/${_pkgname}.git"
	"${pkgname}.install"
	'enet_shared_lib.patch'
)
sha512sums=(
	'SKIP'
	'd590345e9b87e4350b7420eebf8f69e4ad65a53415257573b569ed1c85568a40b4f65fc8df5925f7c03af75d340c52a10a4d1389e5d868816aef9711102ebef1'
	'ac51ee33df27f9fb3bdf16c50b2a9da602d6c55bba7afe21492d0056cdfefa5f84ccfb306c23bd2bcf22066ca3ef2a952110ba0de350602393754f0466383004'
)

pkgver() {
	# Updating package version
	cd ${srcdir}/${_pkgname}
	git describe --long --tags | sed 's/-/./g'
}

prepare() {
	cd ${srcdir}/${_pkgname}
	
	# Use Arch's enet lib
	patch -p1 < ../enet_shared_lib.patch
	
	# Remove src/msgpack-c src/enet and src/jsoncpp submodules
	git submodule deinit src/{msgpack-c,enet,jsoncpp}
	git rm --cached src/{msgpack-c,enet,jsoncpp}
	git config -f .gitmodules --remove-section submodule.src/msgpack-c
	git config -f .gitmodules --remove-section submodule.src/enet
	git config -f .gitmodules --remove-section submodule.src/jsoncpp
	git add .gitmodules
	
	# Cloning with submodules
	git submodule update --init --recursive
	
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
		-DCMAKE_C_COMPILER=clang \
		-DCMAKE_CXX_COMPILER=clang++ \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DRUN_IN_PLACE=0 \
		-DENABLE_SYSTEM_JSONCPP=1 \
		-DENABLE_SYSTEM_MSGPACK=1
	make -j${njobs}
}

package() {
	# Installing package
	cd ${srcdir}/build
	make DESTDIR=${pkgdir} install
}
