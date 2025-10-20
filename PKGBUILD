# Maintainer: matrixDoppelganger <dp223171@gmail.com>
# Original Maintainer: Michael DeGuzis <mdeguzis@gmail.com>
# vkQuake, as per the name, needs something Vulkan-compatible to work.

pkgname=vkquake-git
_gitname=vkquake
pkgver=1.32.3.1.r12.g5be59bf5
pkgrel=1
pkgdesc="A modern Quake 1 engine, forked from Fitzquake with Vulkan support (git-latest)."
arch=('x86_64')
conflicts=('vkquake')
url="https://github.com/Novum/vkQuake"
license=('GPL2')
makedepends=('git'  'spirv-tools')
depends=('meson' 'flac' 'glibc' 'libgl' 'mpg123' 'libvorbis' 'libx11' 'sdl2' 'vulkan-headers' 'glslang')
source=('git+https://github.com/Novum/vkquake.git'
	'vkquake.desktop'
	'vkquake.png'
	'vkquake.svg')
md5sums=('SKIP'
	 '202e1efb0491aafcc9de6f44295dc272'
	 'ffc3103326b0378af770b1318cf4e7e6'
	 'd6b9553906db3cbadfbc40aafafa2b5d')

pkgver() {
  cd "$_gitname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_gitname"
  meson build && ninja -C build
}

package() {

  cd "$srcdir/$_gitname"
  # Install main binary
  install -Dm755 "$srcdir/$_gitname/build/vkquake" "$pkgdir"/usr/bin/vkquake

  # pak files
  install -Dm644 "$srcdir/$_gitname/Quake/vkquake.pak" "$pkgdir/usr/share/games/vkquake/vkquake.pak"

  # Make doc dir
  mkdir -p $pkgdir/usr/share/doc/vkquake/

  # supplemental files
  install -Dm644 "$srcdir/$_gitname.desktop" "$pkgdir/usr/share/applications/vkquake.desktop"
  install -Dm644 "$srcdir/$_gitname.png" "$pkgdir/usr/share/pixmaps/vkquake.png"
  install -Dm644 "$srcdir/$_gitname.svg" "$pkgdir/usr/share/icons/vkquake.svg"
  install -Dm644 readme.md "$pkgdir"/usr/share/doc/vkquake/readme.md
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/doc/vkquake/LICENSE

}
