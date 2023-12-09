# Maintainer: zoorat <zoorat [at] protonmail [dot] com>
# Contributor: Original submitter's  Dimitris Kiziridis <ragouel at outlook dot com>

_pkgname="opencomic"
pkgname="$_pkgname-bin"
pkgver=1.0.0
pkgrel=4

pkgdesc="Comic and Manga reader, written with Node.js and using Electron."
arch=('x86_64')
url="https://github.com/ollm/OpenComic"
license=('GPL3')

depends=("alsa-lib"
	"at-spi2-core"
	"cairo"
	"dbus"
	"expat"
	"gcc-libs"
	"gdk-pixbuf2"
	"glib2"
	"glibc"
	"gtk3"
	"hicolor-icon-theme"
	"libcups"
	"libdrm"
	"libx11"
	"libxcb"
	"libxcomposite"
	"libxdamage"
	"libxext"
	"libxfixes"
	"libxkbcommon"
	"libxrandr"
	"mesa"
	"nodejs"
	"nspr"
	"nss"
	"pango"
	"sh")
provides=("$_pkgname")
conflicts=("$_pkgname")
# replaces=("$_pkgname")
changelog="changelog.md"

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ollm/OpenComic/releases/download/v${pkgver}/opencomic-${pkgver}.${CARCH}.rpm"
	"https://raw.githubusercontent.com/ollm/OpenComic/master/LICENSE")
b2sums=('1e9c625c0d9665532a40d2445df676e7ee02a7276994671885426df0b6b8804cc3c77773f202c5eba249e75ab8d32e9cd6463aee523c3df2be0abf26be90a371'
	'399283bc59e70998486f2ae7b0af9f2f241206dd660e50808be3cef500adef2a9e8d449304f506d93bd2281e6b0729b16145173591deeb105ef545b769453e10')

build() {
	# modifying .desktop file
	sed -i -E "s|Exec=/opt/OpenComic/opencomic|Exec=/usr/bin/${_pkgname}|" "usr/share/applications/${_pkgname}.desktop"
}

package() {
	# copying file
	install -dm 755 "${pkgdir}/usr/share/"
	cp -aR usr/share/* "${pkgdir}/usr/share/"
	install -dm 755 "${pkgdir}/opt/${pkgname}"
	cp -aR opt/OpenComic/* "${pkgdir}/opt/${pkgname}"

	# Fix permissions
	for d in locales resources; do
		chmod 755 "${pkgdir}/opt/${pkgname}/$d"
		find "${pkgdir}/opt/${pkgname}/$d" -type d -exec chmod 755 {} +
	done

	# Link entry point
	install -dm 755 "${pkgdir}/usr/bin"
	ln -sf "/opt/${pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	# Remove unused files
	rm -rf "${pkgdir}/usr/lib"
	rm -rf "${pkgdir}/opt/${pkgname}"/{usr,swiftshader,AppRun,${_pkgname}.{desktop,png}}
	rm -rf "${pkgdir}/opt/${pkgname}"/{libGLESv2.so,libEGL.so,libvk_swiftshader.so,libvulkan.so}
	rm -rf "${pkgdir}/opt/${pkgname}/resources/app.asar.unpacked/unrar"
	rm -rf "${pkgdir}/opt/${pkgname}/resources/app.asar.unpacked/node_modules/7zip-bin/mac"
	rm -rf "${pkgdir}/opt/${pkgname}/resources/app.asar.unpacked/node_modules/7zip-bin/linux/"/{arm64/,arm/,ia32/}
	rm -rf "${pkgdir}/opt/${pkgname}"/{locales,LICENSE*}

	# Install LICENSE file
	install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
