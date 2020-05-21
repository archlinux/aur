# Maintainer: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: Michael DeGuzis <mdeguzis@gmail.com>
# Please note you must have a Vulkan-capable GPU

_quake=vkQuake
pkgname=vkquake
pkgver=1.04.1
pkgrel=3
pkgdesc="A modern Quake 1 engine. Forked from Fitzquake. This version contains Vulkan API support."
arch=('x86_64')
conflicts=('vkquake')
provides=('vkquake')
url="https://github.com/Novum/vkquake"
license=('GPL2')
depends=(	 'git' 'flac' 'glibc' 'libgl' 'libmad' 'libmikmod' 
		 'libvorbis' 'libx11' 'opusfile' 'sdl2' 'vulkan-validation-layers'
)
install=$pkgname.install
source=("https://github.com/Novum/vkQuake/archive/${pkgver}.tar.gz"
	'vkquake.desktop'
	'vkquake.png'
	'vkquake.svg'
	'fix-build.patch')
md5sums=(	'0e7aadbfa99a9890a498a5072167c910'
		'202e1efb0491aafcc9de6f44295dc272'
		'ffc3103326b0378af770b1318cf4e7e6'
		'd6b9553906db3cbadfbc40aafafa2b5d'
		'0c17db6ff55638f027a4b12458a1680f')


prepare() {
  cd "$srcdir/$_quake-$pkgver"
  # https://github.com/Novum/vkQuake/issues/222
  patch -Np1 -i ../fix-build.patch
}

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
