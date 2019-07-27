#! /bin/bash
# Maintainer: Lars Rustand <rustand dot lars at gmail dot com>
# Contributor: Jorge Barroso <jorge.barroso.11 at gmail dot com>
# Contributor: Paul Bredbury <brebs@sent.com>

pkgname=alienarena-svn
pkgver=r5660
pkgrel=1
pkgdesc="Multiplayer retro sci-fi deathmatch game based on Quake3"
arch=('i686' 'x86_64')
url="http://icculus.org/alienarena/rpa/"
license=('GPL')
groups=('games')
depends=('curl' 'freetype2' 'ode' 'libgl' 'libjpeg' 'libvorbis' 'libxxf86dga' 'libxxf86vm' 'openal')
makedepends=('subversion')
provides=('alienarena')
conflicts=('alienarena')
source=(
  svn://svn.icculus.org/alienarena/trunk
  'alienarena.desktop'
  'alienarena'
  'alienarena-ded'
)
sha512sums=(
  'SKIP'
  "4ceb9b838f689aa0b60cfb761411f1708ed852970cd62b218fd42d33db7d59c003ee52fcbb39cfe3d150e15d887696f26e9dadf60e4c4fca97c5d574a47f1402"
  "9ae4e20628f371c9135aed884247b7929c5d8143f01962a82adc1d8acbfe9999c7684b6a262bad7b6300c95a2efe22eac065db2679694985ba70bcf9d8b6cf55"
  "09f1313975e7891844dccc35b8c38af4f25295a9a5fd4f92379266a0b0c507f63c25546ff0b5a8dfe36a6142f09782ed629f1f5f14193bf8e5e5841aac02d96c"
)

# View at https://svn.icculus.org/alienarena/trunk/
_datadir="/usr/share/${pkgname}"
_libdir="/usr/lib/${pkgname}"

pkgver() {
  cd trunk/
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

build() {

	cd trunk/

	./configure

	make PREFIX=/usr
}

 package() {
	cd trunk

	make DESTDIR=$pkgdir install

	mv $pkgdir/usr/local/share $pkgdir/usr/share
	mv $pkgdir/usr/local/bin/alienarena $pkgdir/usr/share/alienarena
	mv $pkgdir/usr/local/bin/alienarena-ded $pkgdir/usr/share/alienarena
	rmdir $pkgdir/usr/local/bin
	rmdir $pkgdir/usr/local

	install -D -m755 $srcdir/alienarena.desktop $pkgdir/usr/share/applications/alienarena.desktop
	install -D -m755 $srcdir/alienarena $pkgdir/usr/bin/alienarena
	install -D -m755 $srcdir/alienarena-ded $pkgdir/usr/bin/alienarena-ded
}
