# Maintainer: Olivia May <olivia.may@tuta.io>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Alfredo Ramos <alfredo dot ramos at yandex dot com>
# Contributor: Martin C. Doege <mdoege at compuserve dot com>
# Contributor: kusakata <shohei atmark kusakata period com>

_pkgbase=freeminer
pkgbase="${_pkgbase}-git"
pkgname=("${_pkgbase}-git" "${_pkgbase}-server-git" "${_pkgbase}-common-git")
pkgver=0.4.14.8.r911.g5d2f00fa7
pkgrel=1
arch=('i686' 'x86_64')
url='https://freeminer.org/'
license=('GPL3' 'CCPL:cc-by-sa-3.0')


makedepends=(
	'leveldb' 'curl' 'git' 'hiredis' 'sqlite' 'luajit'
	'irrlicht' 'openal' 'enet' 'jsoncpp' 'libvorbis'
	'hicolor-icon-theme' 'freetype2' 'cmake' 'msgpack-c' 'clang'
)

source=(
	"git+https://github.com/${_pkgbase}/${_pkgbase}.git"
	"git+https://github.com/${_pkgbase}/default.git"
	"git+https://github.com/kaadmy/pixture.git"
	'enet_shared_lib.patch'
)
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'ac51ee33df27f9fb3bdf16c50b2a9da602d6c55bba7afe21492d0056cdfefa5f84ccfb306c23bd2bcf22066ca3ef2a952110ba0de350602393754f0466383004')

pkgver() {
	cd "${srcdir}"/${_pkgbase}
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}"/${_pkgbase}

	# Use Arch's enet lib
	patch -Np1 < ../enet_shared_lib.patch

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

	# Create build directory
	mkdir -p "${srcdir}"/build-{client,server}
}

build() {
	# Building client
	cd "${srcdir}"/build-client
	cmake ../${_pkgbase} \
		-DCMAKE_C_COMPILER=clang \
		-DCMAKE_CXX_COMPILER=clang++ \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DBUILD_CLIENT=1 \
		-DBUILD_SERVER=0 \
		-DRUN_IN_PLACE=0 \
		-DENABLE_SYSTEM_JSONCPP=1 \
		-DENABLE_SYSTEM_MSGPACK=1
	make

	# Building server
	cd "${srcdir}"/build-server
	cmake ../${_pkgbase} \
		-DCMAKE_C_COMPILER=clang \
		-DCMAKE_CXX_COMPILER=clang++ \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DBUILD_CLIENT=0 \
		-DBUILD_SERVER=1 \
		-DRUN_IN_PLACE=0 \
		-DENABLE_SYSTEM_JSONCPP=1 \
		-DENABLE_SYSTEM_MSGPACK=1
	make
}

package_freeminer-git() {
	pkgdesc='An open source sandbox game inspired by Minecraft'
	depends=(
		"${_pkgbase}-common-git" 'leveldb' 'curl' 'hiredis' 'sqlite'
		'luajit' 'irrlicht' 'openal' 'enet' 'jsoncpp'
		'libvorbis' 'hicolor-icon-theme' 'freetype2'
	)
	provides=("${_pkgbase}=${pkgver}")
	conflicts=("${_pkgbase}")

	# Installing client
	cd "${srcdir}"/build-client
	make DESTDIR="${pkgdir}" install

	# Translations
	cp -R locale "${pkgdir}"/usr/share/

	# Provided by freeminer-common
	rm -fR "${pkgdir}"/usr/share/{${_pkgbase},doc}

	# Provided by freeminer-server
	rm -f "${pkgdir}"/usr/share/man/man6/${_pkgbase}server.6
}

package_freeminer-server-git() {
	pkgdesc='Server of an open source sandbox game inspired by Minecraft'
	depends=(
		"${_pkgbase}-common-git" 'leveldb' 'curl' 'hiredis' 'sqlite'
		'luajit' 'enet' 'jsoncpp'
	)
	provides=("${_pkgbase}-server=${pkgver}")
	conflicts=("${_pkgbase}-server")

	# Installing server
	cd "${srcdir}"/build-server
	make DESTDIR="${pkgdir}" install

	# Provided by freeminer
	rm -fR "${pkgdir}"/usr/share/{metainfo,appdata,applications,icons}
	rm -f "${pkgdir}"/usr/share/man/man6/${_pkgbase}.6

	# Provided by freeminer-common
	rm -fR "${pkgdir}"/usr/share/{${_pkgbase},doc}
}

package_freeminer-common-git() {
	pkgdesc="Common data files for ${_pkgbase}-git and ${_pkgbase}-server-git"
	arch=('any')
	provides=("${_pkgbase}-common=${pkgver}")
	conflicts=("${_pkgbase}-common")

	# Install common data files
	cd "${srcdir}"/${_pkgbase}
	mkdir -p "${pkgdir}"/usr/share/${_pkgbase}/{,doc}
	cp -R {games,builtin,client,fonts,textures} "${pkgdir}"/usr/share/${_pkgbase}/
	cp doc/*.txt "${pkgdir}"/usr/share/${_pkgbase}/doc/
}
