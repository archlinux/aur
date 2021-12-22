# Maintainer: Michal Wojdyla < micwoj9292 at gmail dot com >
# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: Michael DeGuzis <mdeguzis@gmail.com>
# Please note you must have a Vulkan-capable GPU

_quake=vkQuake
pkgname=vkquake
pkgver=1.12.2
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
sha512sums=('3c66020060d378b49034c62f70643eedc6660c533dd7f6de6ab594968141321785e2674469420d6fd61586476ace9c232fa9f7c4566960bf1f54048327deb131'
            '75881c2fea0628dcecff496a5e3035bbb4e408b81527737339ebfd66ad04ca04621d4e13e3e0537f091f8b1127dc231583f746d11cc6c11658cdb976db77e145'
            '9ac17fb2f549656869a02a9a1896786aa4a4f753c6b1174d14b999c94693164ec71a73f9ab6f4a96591ef3af407ffce4f29b0ed87e878f14bb177e396898f29f'
            '5a712a6c0447acea7a6c690cb7e63a2111e28646ef0935dfbd40cc4164c9ed5fc6fdba6eeafe44b618b17e856b3b0f60cc3ddbdedd8e536feef97de969d407b0')


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
