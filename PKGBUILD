# Maintainer: grufo <madmurphy333@gmail.com>

pkgname="popcorntime-ce-git"
_pkgname="popcorntime-ce"
_device="desktop"
pkgver="r306.a576c24"
pkgrel=1
pkgdesc="Stream movies from torrents. Skip the downloads. Launch, click, watch. Repos of the original community edition."
arch=("x86_64" "i686")
url="http://popcorntime.ag/"
license=("GPL3")
depends=("alsa-lib" "desktop-file-utils" "gconf" "gtk2" "libnotify" "libxtst" "nodejs" "nss" "python" "ttf-font")
makedepends=("git" "npm")
optdepends=("net-tools: necessary for the new vpn feature" "ttf-liberation: open source ttf fonts")
provides=("popcorntime" "popcorntime-ce")
conflicts=("popcorntime-ce" "popcorntime-ce-bin")
options=("!strip")
install="popcorntime-ce.install"
source=("git+https://github.com/PopcornTime-CE/${_device}.git"
	"popcorntime-ce.install"
	"popcorntime-ce.desktop")
sha1sums=("SKIP"
	"2c22a3f1d1335abe8d7ac7dd6a33933720ba30e4"
	"219a9c7033361e1286967452868721302b1d6da7")

_platform=$([ $CARCH = "x86_64" ] && echo "linux64" || echo "linux32")
_execname="Popcorn-Time-CE"
_bindir="${_device}/build/${_execname}/${_platform}"

pkgver() {

	cd "${_device}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

prepare() {

	cd "${srcdir}/${_device}"

	npm install --user root

	# Remove all references to ${srcdir}
	find "${srcdir}/${_device}" -type f -print0 | xargs -0 sed -i "s|${srcdir}/${_device}|/usr/share/${_pkgname}|g"

}

build() {

	cd "${srcdir}/${_device}"

	"${srcdir}/${_device}/node_modules/.bin/gulp" build -p ${_platform}

}

package() {

	cd "${srcdir}/${_bindir}"

	install -dm755 "${pkgdir}/usr/share/${_pkgname}"
	install -dm755 "${pkgdir}/usr/bin"

	# Application
	cp -r "${srcdir}/${_bindir}/"* "${pkgdir}/usr/share/${_pkgname}/"
	cp -a "${srcdir}/${_device}/"{node_modules,src} "${pkgdir}/usr/share/${_pkgname}/"
	chmod -R go=u-w "${pkgdir}/usr/share/${_pkgname}/"
	install -Dm644 "${srcdir}/${_device}/"{CHANGELOG.md,LICENSE.txt,package.json,README.md} "${pkgdir}/usr/share/${_pkgname}/"

	# Link to program
	ln -s "/usr/share/${_pkgname}/${_execname}" "${pkgdir}/usr/bin/${_pkgname}"

	# Desktop file
	install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

	# Icon
	install -Dm644 "${srcdir}/${_device}/src/app/images/icon.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"

}

