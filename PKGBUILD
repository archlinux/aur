# Maintainer: Bart van Strien <bart.bes@gmail.com>
# Contributor: Linus Sjögren <thelinx@unreliablepollution.net>
# Contributor: Andrzej Giniewicz < gginiu@gmail.com >
pkgname=love-git
pkgver=20231203.6eb8d546
pkgrel=1
pkgdesc="An open-source 2D game engine which uses the versatile Lua scripting language to create dynamic gaming experiences."
arch=(i686 x86_64 armv6h armv7h)
url="https://love2d.org/"
license=('ZLIB')
depends=(
	'luajit' 'physfs' 'freetype2' 'mpg123' 'openal' 'libvorbis' 'libmodplug'
	'sdl2' 'zlib' 'libpng' 'libjpeg-turbo' 'libtheora'
)
replaces=('love-hg')
source=('git+https://github.com/love2d/love')
makedepends=('git')
options=(!strip)
sha256sums=('SKIP')

pkgver() {
	cd $srcdir/love
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

build() {
	cd $srcdir/love

	# Update version information in configure script
	msg "Updating version information"
	head -c 15 platform/unix/configure.ac > configure.ac.tmp
	echo " [$pkgver])" >> configure.ac.tmp
	tail -n +2 platform/unix/configure.ac >> configure.ac.tmp
	mv configure.ac.tmp platform/unix/configure.ac

	# Skip installing desktop files, icons, etc
	head -n 4 platform/unix/Makefile.am > Makefile.am.tmp
	mv Makefile.am.tmp platform/unix/Makefile.am

	# Generate a configure script for love-git (note the suffix), then configure
	msg "Generating makefiles"
	sh platform/unix/automagic -git
	./configure --enable-silent-rules --prefix=/usr LDFLAGS=""

	# Finally build
	msg "Building"
	make
}

package() {
	cd "$srcdir/love"
	make DESTDIR="$pkgdir" install

	# Install the license file
	install -D -m644 license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=4 sw=4 noet:
