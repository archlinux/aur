# Maintainer: grufo <madmurphy333@gmail.com>

pkgname="popcorntime-ce"
pkgver="0.4.0"
pkgrel="2"
pkgdesc="Stream movies from torrents. Skip the downloads. Launch, click, watch. Repos of the original community edition."
arch=("x86_64" "i686")
url="http://popcorntime.ag/"
license=("GPL3")
depends=("libnotify" "desktop-file-utils" "ttf-font" "gconf" "nss" "libxtst" "gtk2" "alsa-lib")
makedepends=("npm")
optdepends=("net-tools: necessary for the new vpn feature" "ttf-liberation: open source ttf fonts")
provides=("popcorntime" "popcorntime-ce")
conflicts=("popcorntime-ce-bin" "popcorntime-ce-git" "popcorntime" "popcorntime-bin" "popcorntime-git")
options=("!strip")
install="popcorntime-ce.install"
source=("https://github.com/PopcornTimeCommunity/desktop/archive/v${pkgver}-${pkgrel}.tar.gz"
	"popcorntime-ce.install"
	"popcorntime-ce.desktop")
sha1sums=("c8a1e25fd777180942deb05d7a520f2313d95029"
	"48fe37180e9dfed60da82fc67d023b0004f3f1c7"
	"219a9c7033361e1286967452868721302b1d6da7")

_pkgfullname="Popcorn-Time-CE"
_reldir="desktop-${pkgver}-${pkgrel}"
_bindir="${_reldir}/build/${_pkgfullname}/linux$(if [[ $CARCH = 'x86_64' ]]; then echo '64'; else echo '32'; fi)"

build() {

	cd "${srcdir}/${_reldir}"

	npm install
	"${srcdir}/${_reldir}/node_modules/.bin/gulp" build

}

package() {

	cd "${srcdir}/${_bindir}"

	install -dm755 "${pkgdir}/usr/share/${pkgname}"
	install -dm755 "${pkgdir}/usr/bin"

	# Program
	install -Dm755 "${srcdir}/${_bindir}/${_pkgfullname}" "${pkgdir}/usr/share/${pkgname}/"
	install -Dm644 "${srcdir}/${_reldir}/package.json" "${pkgdir}/usr/share/${pkgname}/"
	install -Dm644 "${srcdir}/${_bindir}/"{icudtl.dat,libffmpegsumo.so,nw.pak} "${pkgdir}/usr/share/${pkgname}/"

	# Directories
	cp -a "${srcdir}/${_reldir}/"{node_modules,src} "${pkgdir}/usr/share/${pkgname}/"

	# Link to program
	ln -s "/usr/share/${pkgname}/${_pkgfullname}" "${pkgdir}/usr/bin/${pkgname}"

	# Desktop file
	install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

	# Icon
	install -Dm644 "${srcdir}/${_reldir}/src/app/images/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

}

