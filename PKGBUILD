# Maintainer: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: Claudio Kozicky <claudiokozicky at gmail dot com>
# Contributor: Celti <celticmadman at gmail dot com>
# Contributor: Jan Alexander Steffens (heftig) <jan dot steffens at gmail dot com>
# Contributor: Eric Belanger <eric at archlinux dot org>
# Contributor: Jan de Groot <jgc at archlinux dot org>

pkgname=lib32-smpeg
pkgver=0.4.5
pkgrel=2
pkgdesc="SDL MPEG Player Library (32-bit)"
arch=('x86_64')
url="http://icculus.org/smpeg/"
license=('LGPL')
depends=("${pkgname#lib32-}" 'lib32-gcc-libs' 'lib32-sdl')
makedepends=('gcc-multilib' 'lib32-glu' 'lib32-mesa' 'subversion')
optdepends=('lib32-glu: to use glmovie')
source=("${pkgname#lib32-}::svn://svn.icculus.org/smpeg/tags/release_${pkgver//./_}")
sha512sums=('SKIP')

build()
{
  # Modify environment to generate 32-bit ELF. Respects flags defined in makepkg.conf
  export CC='gcc -m32'
  # GCC 6.1.1 introduced new behaviour that breaks things, using the previous standard allows for a successful build.
  export CXX='g++ -m32 -std=gnu++03'
  export LDFLAGS+=' -m32'
  export PKG_CONFIG_LIBDIR='/usr/lib32/pkgconfig'

  export LIBS="-lX11"

  cd "${pkgname#lib32-}"
  ./autogen.sh
  ./configure --prefix=/usr --libdir=/usr/lib32  --disable-static
  make
}

package()
{
  cd "${pkgname#lib32-}"
  make DESTDIR="${pkgdir}" install
  rm -r "${pkgdir}/usr/"{bin,include,share}
}
