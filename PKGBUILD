# Maintainer: Kyle McLamb <alloyed@tfwno.gf>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Linus Sjögren <thelinx@unreliablepollution.net>
# Contributor: Eric Forgeot < http://anamnese.online.fr >, dreeze
pkgname=love09
pkgver=0.9.2
pkgrel=1
pkgdesc="An open-source 2D game engine which uses the versatile Lua scripting language to create dynamic gaming experiences"
arch=(i686 x86_64)
url="http://love2d.org/"
license=('zlib')
depends=('luajit' 'physfs' 'freetype2' 'devil' 'mpg123' 'openal' 'libvorbis' 'libmodplug' 'sdl2')
source=("hg+https://bitbucket.org/rude/love#tag=0.9.2")
makedepends=('mercurial')
md5sums=('SKIP')

build() {
  cd "$srcdir"/love
  
	# Update version information in configure script
	msg "Updating version information"
	head -c 15 platform/unix/configure.ac > configure.ac.tmp
	echo " [0.9.2])" >> configure.ac.tmp
	tail -n +2 platform/unix/configure.ac >> configure.ac.tmp
	mv configure.ac.tmp platform/unix/configure.ac

	# Skip installing desktop files, icons, etc
	head -n 4 platform/unix/Makefile.am > Makefile.am.tmp
	mv Makefile.am.tmp platform/unix/Makefile.am

	# Generate a configure script for love-hg (note the suffix), then configure
	msg "Generating makefiles"
	sh platform/unix/automagic 09
	./configure --enable-silent-rules --prefix=/usr LDFLAGS=""

	# Finally build
	msg "Building"
	make
}

package() {
  cd "$srcdir"/love

  make DESTDIR="$pkgdir" install

  install -Dm0644 "license.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
