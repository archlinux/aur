# Maintainer: Alfredo Ramos <alfredo dot ramos at yandex dot com>
# Contributor: Martin C. Doege <mdoege at compuserve dot com>
# Contributor: kusakata <shohei atmark kusakata period com>

_pkgname=freeminer
pkgname=${_pkgname}-git
pkgver=0.4.14.8.769.ge9e73d7
pkgrel=2
pkgdesc='An open source sandbox game inspired by Minecraft. Development version.'
arch=('i686' 'x86_64')
url='http://freeminer.org/'
license=('GPL3' 'CCPL:cc-by-sa-3.0')

depends=(
	'leveldb' 'curl' 'hiredis' 'sqlite' 'luajit' 'xdg-utils' 'irrlicht'
	'openal' 'enet' 'jsoncpp' 'libvorbis' 'hicolor-icon-theme' 'freetype2'
)
makedepends=('cmake' 'git' 'msgpack-c' 'clang')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")

source=(
	"git+https://github.com/${_pkgname}/${_pkgname}.git"
	"git+https://github.com/${_pkgname}/default.git"
	"git+https://github.com/kaadmy/pixture.git"
	'fix_enet_lib.patch'
)
sha512sums=(
	'SKIP'
	'SKIP'
	'SKIP'
	'8bdd0226cce1a8773feb840f90c392481d5486ef2bca5b144c1626df33a0bda861d93ccfb451eb5013aa42ab6fe2b029f44c02e9b85b32ed80a6668985deeb62'
)

pkgver() {
	# Updating package version
	cd "${srcdir}"/${_pkgname}
	git describe --long --tags 2>/dev/null | sed 's/-/./g'
}

prepare() {
	cd "${srcdir}"/${_pkgname}
	
	# Use Arch's enet lib
	patch -Np1 < ../fix_enet_lib.patch
	
	# Remove msgpack-c, enet and jsoncpp submodules
	git submodule deinit src/external/{msgpack-c,enet,jsoncpp}
	git rm --cached src/external/{msgpack-c,enet,jsoncpp}
	git config -f .gitmodules --remove-section submodule.src/external/msgpack-c
	git config -f .gitmodules --remove-section submodule.src/external/enet
	git config -f .gitmodules --remove-section submodule.src/external/jsoncpp
	git add .gitmodules
	
	# Configure submodules
	git config submodule.games/default.url "${srcdir}"/default
	git config submodule.games/pixture.url "${srcdir}"/pixture
	git submodule update --init
	
	# Build directory
	mkdir -p "${srcdir}"/build
}

build() {
	# Building package
	cd "${srcdir}"/build
	cmake ../${_pkgname} \
		-DCMAKE_C_COMPILER=clang \
		-DCMAKE_CXX_COMPILER=clang++ \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DRUN_IN_PLACE=0 \
		-DENABLE_SYSTEM_JSONCPP=1 \
		-DENABLE_SYSTEM_MSGPACK=1
	make
}

package() {
	# Installing package
	cd "${srcdir}"/build
	make DESTDIR="${pkgdir}" install
}
