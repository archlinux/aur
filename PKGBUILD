# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Alfredo Ramos <alfredo dot ramos at yandex dot com>
# Contributor: Martin C. Doege <mdoege at compuserve dot com>
# Contributor: kusakata <shohei atmark kusakata period com>

_pkgbase=freeminer
pkgbase="${_pkgbase}-git"
pkgname=("${_pkgbase}-git" "${_pkgbase}-server-git" "${_pkgbase}-common-git")
pkgver=0.4.14.8.909.g69b31a173
pkgrel=1
arch=('i686' 'x86_64')
url='http://freeminer.org/'
license=('GPL3' 'CCPL:cc-by-sa-3.0')

makedepends=(
	'leveldb' 'curl' 'hiredis' 'sqlite' 'luajit'
	'irrlicht' 'openal' 'enet' 'jsoncpp' 'libvorbis'
	'hicolor-icon-theme' 'freetype2' 'cmake' 'msgpack-c' 'clang'
	'ccache' 'git'
)

source=(
	"git+https://github.com/${_pkgbase}/${_pkgbase}.git"
	"git+https://github.com/${_pkgbase}/default.git"
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
	cd "${srcdir}"/${_pkgbase}
	git describe --long --tags 2>/dev/null | sed 's/-/./g'
}

prepare() {
	cd "${srcdir}"/${_pkgbase}

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
