# Maintainer: Cranky Supertoon <crankysupertoon@gmail.com>
pkgname="amulet-map-editor-bin"
pkgver="0.7.0.1"
pkgrel=1
arch=('x86_64')
pkgdesc="A new Minecraft world editor and converter that supports all versions since Java 1.12 and Bedrock 1.7."
url="https://github.com/Amulet-Team/Amulet-Map-Editor"
license=('MIT')
depends=('libpng'
	# by namcap
	libglvnd
	sdl2
	libxcursor
	glib2
	harfbuzz
	python-pillow
	libxdamage
	at-spi2-core
	systemd-libs
	libxkbcommon
	gdk-pixbuf2
	libice
	wayland
	xz
	libxi
	python-numpy
	python
	libxrender
	graphite
	freetype2
	gtk3
	libxext
	webkit2gtk
	cairo
	expat
	libjpeg-turbo
	libxcb
	libxinerama
	gstreamer
	libx11
	libxcomposite
	libxfixes
	pango
	gst-plugins-base-libs
	libgcrypt
	libgpg-error
	python-opengl
	libdatrie
	pixman
	fontconfig
	util-linux-libs
	libepoxy
	dbus
	libthai
	libxrandr
	bzip2
	glibc
	gcc-libs
	bash
	zlib
)
source_x86_64=(
	"Amulet-v${pkgver}-linux.zip::https://github.com/Amulet-Team/Amulet-Map-Editor/releases/download/v${pkgver}/Amulet-v${pkgver}-linux.zip"
	$pkgname.desktop
)

md5sums_x86_64=('40b5bdcc7512606937360e96940a91e2'
                '66235d1ecf166c0fc9cf4b95cd28584d')

prepare() {
	# make executable
	cd "${srcdir}/Amulet/"
	printf '#!/bin/sh
cd "/opt/amulet-map-editor-bin"
./amulet_app "$@"
' | install -Dm755 /dev/stdin amuletlaunch.sh
}

package() {
	# install the main files.
	install -d -m755 "${pkgdir}/opt/${pkgname}"
	cp -Rr "${srcdir}/Amulet/"* "${pkgdir}/opt/${pkgname}"

	# desktop entry
	install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

	# install the icon
	install -d -m755 "${pkgdir}/usr/share/icons"
	cp -Rr "${srcdir}/Amulet/amulet_map_editor/api/image/logo/icon128.png" "${pkgdir}/usr/share/icons/${pkgname}.png"

	# fix file permissions - all files as 644 - directories as 755
	find "${pkgdir}/"{opt,usr} -type d -exec chmod 755 {} \;
	find "${pkgdir}/"{opt,usr} -type f -exec chmod 644 {} \;

	# link the binary
	install -d -m755 "${pkgdir}/usr/bin"
	ln -sr "${pkgdir}/opt/${pkgname}/amuletlaunch.sh" "${pkgdir}/usr/bin/${pkgname}"

	# make sure the main binary has the right permissions
	cd "${pkgdir}/opt/"
	chmod -R 755 "${pkgname}"

}
