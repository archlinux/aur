# Maintainer: Olivia May <olivia.may@tuta.io>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Alfredo Ramos <alfredo dot ramos at yandex dot com>
# Contributor: Martin C. Doege <mdoege at compuserve dot com>
# Contributor: kusakata <shohei atmark kusakata period com>

_pkgbase=freeminer
pkgbase="${_pkgbase}-git"
pkgname=("${_pkgbase}-git" "${_pkgbase}-server-git" "${_pkgbase}-common-git")
pkgver=0.4.14.8.r5548.g86caf1cfb
pkgrel=1
arch=('i686' 'x86_64')
url='https://freeminer.org/'
license=('GPL3' 'CCPL:cc-by-sa-3.0')


makedepends=(
	'leveldb' 'curl' 'git' 'hiredis' 'sqlite' 'luajit'
	'openal' 'libvorbis' 'hicolor-icon-theme' 'freetype2' 'cmake' 'doxygen'
)

prepare() {
	cd "${srcdir}"
	
	git clone --recursive "https://github.com/${_pkgbase}/${_pkgbase}"

	# Create build directory
	mkdir -p "${srcdir}"/build-{client,server}
}

pkgver() {
	cd "${srcdir}"/${_pkgbase}
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	# Building client
	cd "${srcdir}"/build-client
	cmake ../${_pkgbase} \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DBUILD_CLIENT=1 \
		-DBUILD_SERVER=0 \
		-DRUN_IN_PLACE=0
	
	nice make

	# Building server
	cd "${srcdir}"/build-server
	cmake ../${_pkgbase} \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DBUILD_CLIENT=0 \
		-DBUILD_SERVER=1 \
		-DRUN_IN_PLACE=0

	nice make
}

package_freeminer-git() {
	pkgdesc='An open source sandbox game inspired by Minecraft'
	depends=(
		"${_pkgbase}-common-git" 'leveldb' 'curl' 'hiredis' 'sqlite'
		'luajit' 'openal' 'libvorbis' 'hicolor-icon-theme' 'freetype2' 'doxygen'
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
		'luajit' 'doxygen'
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
