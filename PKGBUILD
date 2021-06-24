# Maintainer: Mikael Eriksson <mikael_eriksson@miffe.org>
# Original PKGBUILD by: berkus [berkus_at_madfire_dot_net]

pkgname=ocp
pkgver=0.2.90
pkgrel=1
pkgdesc="Open Cubic Player"
arch=('i686' 'x86_64')
url="https://github.com/mywave82/opencubicplayer"
depends=('libxxf86vm' 'libvorbis' 'libxpm' 'alsa-lib' 'libmad' 'flac' 'sdl2' 'adplug' 'libjpeg-turbo' 'libpng' 'freetype2' 'ttf-unifont')
makedepends=('desktop-file-utils' 'git' 'xa' 'patch')
license=('GPL')
source=(git+https://github.com/mywave82/opencubicplayer.git#tag=v${pkgver}
        git+https://github.com/mywave82/timidity.git
		git+https://github.com/mywave82/sidplay-residfp-ocp.git
		git+https://github.com/libsidplayfp/exsid-driver.git
		git+https://github.com/mywave82/resid.git
		fix-unifont.diff)
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         '9eb83ffbabec3f1dd66f66c9100a9c08')

prepare() {
	cd opencubicplayer

	patch -p1 -i "$srcdir/fix-unifont.diff"

	git submodule init
	git config submodule.playgmi/timidity-git.url "$srcdir/timidity"
	git config submodule.playsid/sidplayfp-git.url "$srcdir/sidplay-residfp-ocp"
	git submodule update

	cd playsid/libsidplayfp-git

	git submodule init
	git config submodule.src/builders/exsid-builder/driver.url "$srcdir/exsid-driver"
	git config submodule.src/builders/resid-builder/resid.url "$srcdir/resid"
	git submodule update
}

build() {
	cd opencubicplayer

	./configure --prefix=/usr --sysconfdir=/etc --with-unifontdir=/usr/share/fonts/Unifont
	make DESTDIR="$pkgdir"
}

package() {
	cd opencubicplayer
	make DESTDIR="$pkgdir" install
}
