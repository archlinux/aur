# Maintainer: grufo <madmurphy333@gmail.com>

pkgname="popcorntime-ce"
pkgver="0.4.1"
pkgrel="5"
pkgdesc="Stream movies from torrents. Skip the downloads. Launch, click, watch. Repos of the original community edition."
arch=("x86_64" "i686")
url="http://popcorntime.ag/"
license=("GPL3")
depends=("alsa-lib" "desktop-file-utils" "gconf" "gtk2" "libnotify" "libxtst" "nodejs" "nss" "python" "ttf-font")
makedepends=("npm")
optdepends=("net-tools: necessary for the new vpn feature" "ttf-liberation: open source ttf fonts")
provides=("popcorntime" "popcorntime-ce")
conflicts=("popcorntime-ce-bin" "popcorntime-ce-git")
options=("!strip")
install="popcorntime-ce.install"
source=("https://github.com/PopcornTimeCommunity/desktop/archive/${pkgver}-${pkgrel}.tar.gz"
	"popcorntime-ce.install"
	"popcorntime-ce.desktop"
	"r306.a576c24.patch")
sha1sums=("9c376b5b4477ea29112c5217a01eb63932c60f22"
          "2c22a3f1d1335abe8d7ac7dd6a33933720ba30e4"
          "219a9c7033361e1286967452868721302b1d6da7"
          "dd94d1fcbde2ee46a58646268c5e962508ef5484")

_platform=$([ $CARCH = "x86_64" ] && echo "linux64" || echo "linux32")
_execname="Popcorn-Time-CE"
_reldir="desktop-${pkgver}-${pkgrel}"
_bindir="${_reldir}/build/${_execname}/${_platform}"

prepare() {

	# Synchronize with commit `a576c24` (bugs solving)
	patch -p1 < "${srcdir}/r306.a576c24.patch"

	# Prepare
	cd "${srcdir}/${_reldir}"
	npm install --user root

	# Remove all references to ${srcdir}
	find "${srcdir}/${_reldir}" -type f -print0 | xargs -0 sed -i "s|${srcdir}/${_reldir}|/usr/share/${pkgname}|g"

}

build() {

	cd "${srcdir}/${_reldir}"

	"${srcdir}/${_reldir}/node_modules/.bin/gulp" build -p ${_platform}

}

package() {

	cd "${srcdir}/${_bindir}"

	install -dm755 "${pkgdir}/usr/share/${pkgname}"
	install -dm755 "${pkgdir}/usr/bin"

	# Application
	cp -r "${srcdir}/${_bindir}/"* "${pkgdir}/usr/share/${pkgname}/"
	cp -a "${srcdir}/${_reldir}/"{node_modules,src} "${pkgdir}/usr/share/${pkgname}/"
	chmod -R go=u-w "${pkgdir}/usr/share/${pkgname}/"
	install -Dm644 "${srcdir}/${_reldir}/"{CHANGELOG.md,LICENSE.txt,package.json,README.md} "${pkgdir}/usr/share/${pkgname}/"

	# Link to program
	ln -s "/usr/share/${pkgname}/${_execname}" "${pkgdir}/usr/bin/${pkgname}"

	# Desktop file
	install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

	# Icon
	install -Dm644 "${srcdir}/${_reldir}/src/app/images/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

}

