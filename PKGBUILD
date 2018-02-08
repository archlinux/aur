# Maintainer: Ammon Smith <ammon.i.smith@gmail.com>
# Contributor: Nicole Fontenot <nfontenot27@gmail.com>
# Contributor: "donaldtrump" [AUR]

pkgname=osu-lazer-git
pkgver=2018.208.0_2_g0ba76bbaa
pkgrel=1
pkgdesc='Freeware rhythm video game - lazer development version'
arch=('x86_64' 'i686')
url='https://osu.ppy.sh'
license=('MIT')
makedepends=('nuget4'
             'git')
depends=('ffmpeg'
         'libgl'
         'mono')
optdepends=()
options=()
provides=('osu-lazer')
conflicts=('osu-lazer')
source=('git+https://github.com/ppy/osu.git'
        'git+https://github.com/ppy/osu-framework'
        'git+https://github.com/ppy/osu-resources'
        'osu-launcher'
        'osu-lazer.desktop'
        'osu-lazer.png'
        'x-osu-lazer.xml')

sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'c499dbff1d9a8f382e7b3cf4a95b58b9f02fb98e66e50cddb5d7d6c8a5223d2d'
            '11d29c2654896607f37bc5c8e558ea245d8e3b1b412dcba03033bf1db6580ebe'
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
	git describe --always --tags | sed -E -e 's/^(v|changelog-)//g' -e 's/-/_/g'
}

prepare() {
	cd "${srcdir}/osu"

	# Prepare submodules
	git submodule init
	git config submodule.osu-framework.url "${srcdir}/osu-framework"
	git config submodule.osu-resources.url "${srcdir}/osu-resources"
	git submodule update --recursive

	# Download dependencies
	nuget restore
}

build() {
	cd "$srcdir/osu"

	# Symlink netstandard for xbuild
	mkdir -p "osu.Game/bin/Release"
	ln -s "/lib/mono/4.5/Facades/netstandard.dll" "osu.Game/bin/Release"

	# Build
	export MONO_IOMAP="case"
	xbuild /property:Configuration=Release

	# Cleanup
	rm "osu.Game/bin/Release/netstandard.dll"
	rm "osu.Desktop/bin/Release/netstandard.dll"
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
	cd "$srcdir/osu/osu.Desktop/bin/Release"
	mkdir -p "$pkgdir/usr/lib/${pkgname%-git}"
	for binary in *.exe *.dll; do
		install -m755 "$binary" "$pkgdir/usr/lib/${pkgname%-git}/$binary"
	done

	# Native libraries
	install -m755 "libbass.$_arch.so" "$pkgdir/usr/lib/${pkgname%-git}/libbass.so"
	install -m755 "libbass_fx.$_arch.so" "$pkgdir/usr/lib/${pkgname%-git}/libbass_fx.so"
	install -m755 "libe_sqlite3.so" "$pkgdir/usr/lib/${pkgname%-git}/libe_sqlite3.so"
}

# vim: set sw=4 ts=4 noet:
