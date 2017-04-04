# Maintainer: Ammon Smith <ammon.i.smith@gmail.com>

pkgname=osu-lazer-git
pkgver=2017.329.0_215_gcbb669ad
pkgrel=1
pkgdesc='Freeware rhythm video game - lazer development version'
arch=('x86_64' 'i686')
url='http://osu.ppy.sh'
license=('MIT')
makedepends=('nuget'
             'git')
depends=('ffmpeg'
         'libglvnd'
         'mono')
optdepends=()
provides=('osu-lazer')
conflicts=('osu-lazer')
source=('git+https://github.com/ppy/osu.git'
        'osu-launcher')
sha256sums=('SKIP'
            'c499dbff1d9a8f382e7b3cf4a95b58b9f02fb98e66e50cddb5d7d6c8a5223d2d')

if [[ $CARCH == x86_64 ]]; then
	readonly _arch=x64
elif [[ $CARCH == i686 ]]; then
	readonly _arch=x86
fi

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
	export MONO_IOMAP='case'
	xbuild || xbuild
}

package() {
	cd "$srcdir"
	mkdir -p "$pkgdir/usr/bin"
	install -m755 'osu-launcher' "$pkgdir/usr/bin/osu-lazer"

	cd "$srcdir/osu/osu.Desktop/bin/Debug"
	mkdir -p "$pkgdir/usr/lib/${pkgname%-git}"
	install -m755 *.exe *.dll "$pkgdir/usr/lib/${pkgname%-git}"

	# Install native libraries
	install -m755 "libbass.$_arch.so" "$pkgdir/usr/lib/${pkgname%-git}/libbass.so"
	install -m755 "libbass_fx.$_arch.so" "$pkgdir/usr/lib/${pkgname%-git}/libbass_fx.so"
}

# vim: set sw=4 ts=4 noet:
