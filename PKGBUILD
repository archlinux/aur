# Maintainer: Michal Wojdyla < micwoj9292 at gmail dot com >
# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: Michael DeGuzis <mdeguzis@gmail.com>
# Please note you must have a Vulkan-capable GPU

_quake=vkQuake
pkgname=vkquake
pkgver=1.12.0
pkgrel=1
pkgdesc="A modern Quake 1 engine. Forked from Fitzquake. This version contains Vulkan API support."
arch=('x86_64')
provides=('vkquake')
url="https://github.com/Novum/vkquake"
license=('GPL2')
depends=('flac' 'glibc' 'libgl' 'libmad' 'libmikmod' 
	 'libvorbis' 'libx11' 'opusfile' 'sdl2')
makedepends=('vulkan-validation-layers')
install=$pkgname.install
source=("https://github.com/Novum/vkQuake/archive/${pkgver}.tar.gz"
	'vkquake.desktop'
	'vkquake.png'
	'vkquake.svg')
sha256sums=('caa7ab00af2be3b39af2a3bbcd2e54548f6bba5c66032aa50cd88bd57ca4a5e2'
            '0181372c82e7bf3037ca23f7224aa07e2dd33a855392f79a6852bc4a0770956e'
            '571ab4f163b31f1f56de2b5b9103cf1b48a4baf4f0ef9514bb4b2da6ba899755'
            'f9f5e7d79ed7ef1eb4dfaf35d5e5e72c271c0d068153f07505ab57a19425f09e')


build() {
  
  cd "$srcdir/$_quake-$pkgver"

  # clean
  msg "Cleaning make files"
  make -C Quake clean

  msg "Starting make..."
  make -C Quake \
		$(maybe_debug) \
		STRIP=": do not strip:" \
		DO_USERDIRS=1 \
		USE_CODEC_FLAC=1 \
		USE_CODEC_OPUS=1 \
		USE_CODEC_MIKMOD=1 \
		USE_CODEC_UMX=1
  make -C Misc/vq_pak

}

package() {

  cd "$srcdir/$_quake-$pkgver"

  # Install main binary
  install -Dm755 Quake/vkquake "$pkgdir"/usr/bin/vkquake

  # Make doc dir
  mkdir -p $pkgdir/usr/share/doc/vkquake/
  mkdir -p $pkgdir/usr/share/games/vkquake/

  # pak files
  install -Dm644 "$srcdir/$_quake-$pkgver/Misc/vq_pak/vkquake.pak" "$pkgdir/usr/share/games/vkquake/vkquake.pak" 

  # supplemental files
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/vkquake.desktop"
  install -Dm644 "$srcdir/$pkgname.png" "$pkgdir/usr/share/pixmaps/vkquake.png"
  install -Dm644 "$srcdir/$pkgname.svg" "$pkgdir/usr/share/icons/vkquake.svg"
  install -Dm644 readme.md "$pkgdir"/usr/share/doc/vkquake/readme.md

}
