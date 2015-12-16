# Maintainer: Bart van Strien <bart.bes@gmail.com>
# Contributor: Linus Sjögren <thelinx@unreliablepollution.net>
# Contributor: Andrzej Giniewicz < gginiu@gmail.com >
pkgname=love-hg
pkgver=r2651.7f6a147e5501
pkgrel=1
pkgdesc="An open-source 2D game engine which uses the versatile Lua scripting language to create dynamic gaming experiences."
arch=(i686 x86_64)
url="http://love2d.org/"
license=('ZLIB')
depends=(
	'luajit' 'physfs' 'freetype2' 'mpg123' 'openal' 'libvorbis' 'libmodplug'
	'sdl2' 'zlib' 'libpng' 'libjpeg-turbo' 'libtheora'
)
source=('hg+https://bitbucket.org/rude/love')
makedepends=('mercurial')
options=(!strip)
sha256sums=('SKIP')

pgkver() {
	cd $srcdir/love

	# As per the wiki the version is r<commit number>.<commit hash>
	printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
	cd $srcdir/love

	# Update version information in configure script
	msg "Updating version information"
	head -c 15 platform/unix/configure.ac > configure.ac.tmp
	echo " [`hg log -l1 --template '{node|short}'`-`date +%Y%m%d`])" >> configure.ac.tmp
	tail -n +2 platform/unix/configure.ac >> configure.ac.tmp
	mv configure.ac.tmp platform/unix/configure.ac

	# Skip installing desktop files, icons, etc
	head -n 4 platform/unix/Makefile.am > Makefile.am.tmp
	mv Makefile.am.tmp platform/unix/Makefile.am

	# Generate a configure script for love-hg (note the suffix), then configure
	msg "Generating makefiles"
	sh platform/unix/automagic -hg
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
