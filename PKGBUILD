# Maintainer: Alfredo Ramos <alfredo dot ramos at yandex dot com>
# Contributor: Martin C. Doege <mdoege at compuserve dot com>
# Contributor: kusakata <shohei atmark kusakata period com>

_pkgname=freeminer
pkgname=${_pkgname}-git
pkgver=0.4.12.6.r874.gf1085d3
pkgrel=2
pkgdesc='An open source sandbox game inspired by Minecraft. Development version.'
arch=('i686' 'x86_64')
url='http://freeminer.org/'
license=('GPL3' 'CCPL:cc-by-sa-3.0')

depends=('leveldb' 'curl' 'hiredis' 'sqlite' 'luajit' 'xdg-utils' 'irrlicht' 'openal' 'enet' 'libvorbis' 'hicolor-icon-theme')
makedepends=('cmake' 'git' 'msgpack-c')
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
	'abce96de2c2221f1373fc07fc2766de19d1fc2c1339ada0cb98d6b571649413f72ca2ea8c53dc7257f0700dc0509cdfeb0346144f806a626b28d5514b598accd'
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
	cd ${srcdir}/${_pkgname}
	
	# Use Arch's enet lib
	patch ./src/main.cpp ../enet_shared_lib.patch
	
	# Remove src/msgpack-c and src/enet submodule
	git submodule deinit src/{msgpack-c,enet}
	git rm --cached src/{msgpack-c,enet}
	git config -f .gitmodules --remove-section submodule.src/msgpack-c
	git config -f .gitmodules --remove-section submodule.src/enet
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
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DRUN_IN_PLACE=0 \
		-DENABLE_SYSTEM_MSGPACK=1
	make -j${njobs}
}

package() {
	# Installing package
	cd ${srcdir}/build
	make DESTDIR=${pkgdir} install
}