# Maintainer: Yamashiro <dev cosmicheron com>

pkgname="yquake2remaster"
pkgver="8.61RR13"
pkgrel="1"
pkgdesc='Experimental fork of Yamagi Quake II to add support for Quake II Enhanced/Remaster(ed)'
url="https://github.com/yquake2/${pkgname}"
arch=('i686' 'x86_64' 'aarch64')
license=('Info-ZIP' 'GPL-2.0-only')
depends=('ffmpeg' 'glibc' 'libglvnd' 'sdl3')
makedepends=('openal' 'vulkan-headers')
optdepends=('curl' 'openal' 'quake2-data' 'quake2-demo' 'vulkan-driver')
source=(
	"${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
	"${pkgname}.desktop"
	"${pkgname}-ctf.desktop"
	"${pkgname}-rogue.desktop"
	"${pkgname}-xatrix.desktop"
)
b2sums=(
	'487977133f3c365ea7de42cea50c81e863cc817d8b37fe7805013e24a31e63766e705d84ffc770793e91567cd7bc24aa5b3263bab1598a385e647df8f13943af'
	'3c3927d7687c65d0155ac1c327e4ef3cf0bea0b5eea771965a6acf126e59d1deb46517750737ca12eef5d4d3034a32b3ccd03d0535b5468a6fc5bef302fdec6a'
	'f0760cd3e48ffc15dca55f0adea4a17a94bfc6127a01ae0d22379192907e4d6ec4870abf7e2d7664bdbf639802ad682c51718f1fc92fa11f6d2596c6cca6718e'
	'1179bec70b7ef46a6b9f8dd9b642fda226e1b1d5a460f03e2475f07582800ca25bf9bf5710a7ff2aaebd9df2144eb9132b7dec596571c6eba9b16f39992d2f10'
	'db424d4a59387fcbd04c9142b830eb6a50627102c036ff9b42ef883daefa07e75d0e848e928874f0cb752d0bbba322365eb98e619701ee42d4890fe975cbba9e'
)

build() {
	make -C "${srcdir}/${pkgname}-${pkgver}" WITH_RPATH=no WITH_SYSTEMWIDE=yes WITH_SDL3=yes
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	# install game executables and libraries
	install -Dm755 -t "${pkgdir}/usr/lib/${pkgname}" release/{quake2,q2ded}
	install -Dm644 -t "${pkgdir}/usr/lib/${pkgname}" release/*.so
	install -Dm644 -t "${pkgdir}/usr/lib/${pkgname}/baseq2" 'release/baseq2/game.so'

	# create symlinks
	install -d "${pkgdir}/usr/bin"
	ln -s "/usr/lib/${pkgname}/quake2" "${pkgdir}/usr/bin/${pkgname}"
	ln -s "/usr/lib/${pkgname}/q2ded" "${pkgdir}/usr/bin/q2ded-remaster"

	# doc
	install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" 'stuff/yq2.cfg'
	install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" doc/*.md

	# license
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" 'LICENSE'

	# icon
	install -Dm644 'stuff/icon/Quake2.svg' "${pkgdir}/usr/share/pixmaps/${pkgname}.svg"

	# desktop entries
	install -Dm644 -t "${pkgdir}/usr/share/applications" "${srcdir}/${pkgname}.desktop"
	install -Dm644 -t "${pkgdir}/usr/share/applications" "${srcdir}/${pkgname}-ctf.desktop"
	install -Dm644 -t "${pkgdir}/usr/share/applications" "${srcdir}/${pkgname}-xatrix.desktop"
	install -Dm644 -t "${pkgdir}/usr/share/applications" "${srcdir}/${pkgname}-rogue.desktop"
}
