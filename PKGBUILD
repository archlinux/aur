# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Kyle McLamb <alloyed@tfwno.gf>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Linus Sjögren <thelinx@unreliablepollution.net>
# Contributor: Eric Forgeot < http://anamnese.online.fr >, dreeze
# Contributor: bageljr
pkgname=love10
pkgver=0.10.2
pkgrel=2
pkgdesc="An open-source 2D game engine which uses the versatile Lua scripting language to create dynamic gaming experiences"
arch=(i686 x86_64)
url="http://love2d.org/"
license=('zlib')
depends=('luajit' 'physfs' 'freetype2' 'mpg123' 'openal' 'libvorbis' 'libmodplug' 'sdl2')
source=("https://github.com/love2d/love/releases/download/0.10.2/love-0.10.2-linux-src.tar.gz")
conflicts=('love')
provides=('love')
makedepends=('git')
md5sums=('SKIP')

build() {
  cd "$srcdir"/love-$pkgver
  
	# Update version information in configure script
	echo "Updating version information"
	head -c 15 configure.ac > configure.ac.tmp
	echo " [0.10.2])" >> configure.ac.tmp
	tail -n +2 configure.ac >> configure.ac.tmp
	mv configure.ac.tmp platform/unix/configure.ac

	# Skip installing desktop files, icons, etc
	head -n 4 Makefile.am > Makefile.am.tmp
	mv Makefile.am.tmp platform/unix/Makefile.am

	# Generate a configure script for love-hg (note the suffix), then configure
	echo "Generating makefiles"
	#sh platform/unix/automagic 10
	./configure --enable-silent-rules --prefix=/usr LDFLAGS=""

	# Finally build
	echo "Building"
	make
}

package() {
  cd "$srcdir"/love-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm0644 "license.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
