# Maintainer: Ammon Smith <ammon.i.smith@gmail.com>
# Contributor: Nicole Fontenot <nfontenot27@gmail.com>

pkgname=osu-lazer-git
pkgver=2017.512.0_24_gdced4526
pkgrel=1
pkgdesc='Freeware rhythm video game - lazer development version'
arch=('x86_64' 'i686')
url='http://osu.ppy.sh'
license=('MIT')
makedepends=('nuget'
			 'git')
depends=('ffmpeg'
		 'libgl'
		 'mono')
optdepends=()
options=()
provides=('osu-lazer')
conflicts=('osu-lazer')
source=('git+https://github.com/ppy/osu.git'
		'osu-launcher'
		'osu-lazer.desktop'
		'osu-lazer.png'
		'x-osu-lazer.xml')
sha256sums=('SKIP'
			'c499dbff1d9a8f382e7b3cf4a95b58b9f02fb98e66e50cddb5d7d6c8a5223d2d'
			'13df6b2d9d6d4c6839554ebf55c51f0812890a30dc0b40b7186447265db1f212'
			'3b3a9075f79ca7f2a4fd34eb182a5c1ada6eb118a95e49c1526df516365bbfe5'
			'd22f0d922856639c7cc5f71bdd620cc8b3eb54af923b1a43703faac217b8b13b')

case "$CARCH" in
	x86_64)
		_arch=x64
		;;
	i686)
		_arch=x86
		;;
esac

pkgver() {
	cd "$srcdir/osu"
	git describe --always --tags | sed 's/-/_/g' | cut -c 2-
}

build() {
	cd "$srcdir/osu"

	# Initialize submodules
	git submodule init
	git submodule update --recursive

	# Download dependencies
	nuget restore

	# Build
	xbuild
}

package() {
	# Wrapper script
	cd "$srcdir"
	mkdir -p "$pkgdir/usr/bin"
	install -m755 'osu-launcher' "$pkgdir/usr/bin/osu-lazer"

	# MIME types
	mkdir -p "$pkgdir/usr/share/mime/packages"
	install -m644 "x-${pkgname%-git}.xml" "$pkgdir/usr/share/mime/packages/x-${pkgname%-git}.xml"

	# Add .desktop file
	mkdir -p "$pkgdir/usr/share/applications"
	install -m644 "${pkgname%-git}.desktop" "$pkgdir/usr/share/applications/${pkgname%-git}.desktop"

	# Application icon
	mkdir -p "$pkgdir/usr/share/pixmaps"
	install -m644 "${pkgname%-git}.png" "$pkgdir/usr/share/pixmaps/${pkgname%-git}.png"

	# Compiled binaries
	cd "$srcdir/osu/osu.Desktop/bin/Debug"
	mkdir -p "$pkgdir/usr/lib/${pkgname%-git}"
	for binary in *.exe *.dll; do
		install -m755 "$binary" "$pkgdir/usr/lib/${pkgname%-git}/$binary"
	done

	# Native libraries
	install -m755 "libbass.$_arch.so" "$pkgdir/usr/lib/${pkgname%-git}/libbass.so"
	install -m755 "libbass_fx.$_arch.so" "$pkgdir/usr/lib/${pkgname%-git}/libbass_fx.so"
}

# vim: set sw=4 ts=4 noet:
