# Maintainer: Mikuro Kagamine <mikurok@forgecrushing.com>

pkgbase=libretro-mednafen-psx-git
pkgname=('libretro-mednafen-psx-git' 'libretro-mednafen-psx-hw-git')
_gitname=beetle-psx-libretro
pkgver=1238.4ad02c7
pkgrel=1
pkgdesc="libretro implementation of Mednafen PSX"
arch=('i686' 'x86_64')
url="https://github.com/libretro/beetle-psx-libretro"
license=('GPLv2')
makedepends=('git')
source=("${_gitname}::git://github.com/libretro/${_gitname}.git"
        "${_gitname}.info::https://raw.githubusercontent.com/libretro/libretro-super/master/dist/info/beetle_psx_libretro.info")
md5sums=('SKIP'
         'SKIP')

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build()
{
	cd "$_gitname"
	make
	sed -ri "s/HAVE_OPENGL ?= ?0/HAVE_OPENGL=1/" Makefile
	make
}

package_libretro-mednafen-psx-git()
{
	conflicts=('libretro-mednafen-psx')
	provides=('libretro-mednafen-psx')
	
	sed -ie "s/display_version =.*/display_version = \"${pkgver}\"/" $srcdir/$_gitname.info
	install -v -Dm644 $srcdir/$_gitname.info $pkgdir/usr/lib/libretro/mednafen_psx_libretro.info
	install -v -Dm644 $srcdir/$_gitname/mednafen_psx_libretro.so $pkgdir/usr/lib/libretro/mednafen_psx_libretro.so
}

package_libretro-mednafen-psx-hw-git()
{
	sed -ie "s/display_version =.*/display_version = \"${pkgver}\"/" $srcdir/$_gitname.info
	sed -i 's/Beetle PSX/Beetle PSX HW/g' $srcdir/$_gitname.info
	install -v -Dm644 $srcdir/$_gitname.info $pkgdir/usr/lib/libretro/mednafen_psx_hw_libretro.info
	install -v -Dm644 $srcdir/$_gitname/mednafen_psx_hw_libretro.so $pkgdir/usr/lib/libretro/mednafen_psx_hw_libretro.so
}
