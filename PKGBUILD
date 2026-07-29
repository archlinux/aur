# Maintainer: CosmicHeron <dev cosmicheron com>

pkgname='yquake2remaster'
pkgver='8.71RR15'
pkgrel='1'
pkgdesc='Experimental fork of Yamagi Quake II to add support for Quake II Enhanced/Remaster(ed)'
url="https://github.com/yquake2/${pkgname}"
arch=('i686' 'x86_64' 'aarch64')
license=('Info-ZIP' 'GPL-2.0-only')
depends=('curl' 'glibc' 'glu' 'libglvnd' 'openal' 'sdl3')
makedepends=('vulkan-headers')
optdepends=('quake2-data' 'quake2-demo' 'vulkan-driver')
source=(
	"${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
	"${pkgname}.desktop"
)
b2sums=('1b35be970546168045820b6347395236e2abeab0529845ed261ff761615f0034591e38af3259facca1637efc8eff49180d6f55ccf8a8bcacf2c89078bfc6cf5c'
	'3c3927d7687c65d0155ac1c327e4ef3cf0bea0b5eea771965a6acf126e59d1deb46517750737ca12eef5d4d3034a32b3ccd03d0535b5468a6fc5bef302fdec6a')

prepare() {
	cmake -S "${srcdir}/${pkgname}-${pkgver}" "${srcdir}/${pkgname}-${pkgver}/build"
}

build() {
	make -C "${srcdir}/${pkgname}-${pkgver}/build" WITH_RPATH=no WITH_SYSTEMWIDE=yes
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	# install game executables and libraries
	install -Dm755 -t "${pkgdir}/usr/lib/${pkgname}" build/release/{quake2,q2ded}
	install -Dm644 -t "${pkgdir}/usr/lib/${pkgname}" build/release/*.so
	install -Dm644 -t "${pkgdir}/usr/lib/${pkgname}/baseq2" 'build/release/baseq2/game.so'

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
}
