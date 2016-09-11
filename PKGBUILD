# Maintainer: Michael DeGuzis <mdeguzis@gmail.com>
# Please note you must have a Vulkan-capable GPU

pkgname=vkquake-git
pkgver=0.71.r0.gfd23ad1
pkgrel=1
pkgdesc="A modern Quake 1 engine. Forked from Fitzquake. This version contains Vulkan API support."
arch=('i686' 'x86_64')
url="https://github.com/Novum/vkquake"
license=('GPL2')
depends=(
'flac' 'glibc' 'libgl' 'libmad' 'libmikmod' 'libogg' 
'libvorbis' 'libx11' 'opusfile' 'sdl2' 'vulkan-validation-layers'
)
install=$pkgname.install
source=('vkquake-git::git+https://github.com/Novum/vkquake.git'
	'vkquake-git.desktop'
	'vkquake-git.png')
md5sums=('SKIP'
	 'c8843622c6521b93b60ed91df51aaa6b'
	 'c0d980f9a737d450021b9dc6a6b94a01')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  
  cd "$srcdir/$pkgname"

  # clean
  msg "Cleaning make files"
  make -C Quake clean

  msg "Starting make..."
  make -C Quake \
		$(maybe_debug) \
		STRIP=": do not strip:" \
		DO_USERDIRS=1 \
		USE_SDL2=1 \
		USE_CODEC_FLAC=1 \
		USE_CODEC_OPUS=1 \
		USE_CODEC_MIKMOD=1 \
		USE_CODEC_UMX=1
  make -C Misc/vq_pak

}

package() {

  cd "$srcdir/$pkgname/"

  # Make doc dir
  mkdir -p $pkgdir/usr/share/doc/vkquake-git/

  # main binary
  install -Dm755 Quake/vkquake "$pkgdir"/usr/bin/$pkgname

  # supplemental files
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop" 
  install -Dm644 "$srcdir/$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png" 
  install -Dm644 readme.md "$pkgdir"/usr/share/doc/vkquake-git/

}
