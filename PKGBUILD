# Maintainer: Mikael Eriksson <mikael_eriksson@miffe.org>
# Original PKGBUILD by: berkus [berkus_at_madfire_dot_net]

pkgname=ocp
pkgver=0.2.2
pkgrel=1
pkgdesc="Open Cubic Player"
arch=('i686' 'x86_64')
url="https://github.com/mywave82/opencubicplayer"
depends=('libxxf86vm' 'libvorbis' 'libxpm' 'alsa-lib' 'libmad' 'flac' 'sdl2' 'adplug' 'libjpeg-turbo' 'libpng' 'freetype2' 'ttf-unifont')
makedepends=('desktop-file-utils' 'git' 'xa' 'patch')
license=('GPL')
source=(git+https://github.com/mywave82/opencubicplayer.git#tag=v${pkgver}
        git+https://github.com/mywave82/timidity.git
		git+https://github.com/mywave82/sidplay-residfp-ocp
		fix-unifont.diff)
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         '98a6ab1b11da171b118e0cf7b0485e7c')

prepare() {
	cd opencubicplayer
	git submodule init
	git config submodule.playgmi/timidity-git.url $srcdir/timidity
	git config submodule.playsid/sidplayfp-git.url $srcdir/sidplay-residfp-ocp
	git submodule update
}

build() {
	cd opencubicplayer

	patch -p1 -i $srcdir/fix-unifont.diff
	./configure --prefix=/usr --sysconfdir=/etc --with-unifontdir=/usr/share/fonts/Unifont
	make DESTDIR=$pkgdir
}

package() {
	cd opencubicplayer
	make DESTDIR=$pkgdir install
}
