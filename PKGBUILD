# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Esa lakaniemi <esalaka@gmail.com>

_pkgbasename=sdl_ttf
pkgname=lib32-$_pkgbasename
pkgver=2.0.11
pkgrel=4
pkgdesc="A library that allows you to use TrueType fonts in your SDL applications (32-bit)"
arch=('x86_64')
url="http://www.libsdl.org/projects/SDL_ttf/"
license=('LGPL')
depends=('lib32-sdl' 'lib32-freetype2' $_pkgbasename)
makedepends=('gcc-multilib')
source=("https://www.libsdl.org/projects/SDL_ttf/release/SDL_ttf-$pkgver.tar.gz"
        bug1433.patch sdl-ttf-freetype_pkgconfig.patch)
sha512sums=('64e04d1cd77e525e0f2413ad928841e5d3d09d551c030fc577b50777116580e430cb272b2aeb6191dfcc464669cf2f7a5a50d10e7c75637a3b1e8c8fca7fc78b'
            'fb4a2e96156423ff31313d0775929e0cdcbc12c81e98f100964b94bc29fc654182c93a23b47a861a398e06b028d9591b93268910c7a013c6b07c33a0d56eb20c'
            'abb3fd400c5d44789b891bad53124ca135ea3125affb95621623ab22fc43f5fbfeb79c63a97648936faf4698180837f76ca57143ee401610106d08741610e937')

prepare() {
  cd "${srcdir}"/SDL_ttf-${pkgver}
  patch -Ni "${srcdir}"/bug1433.patch
  patch -p1 -i ../sdl-ttf-freetype_pkgconfig.patch # Fix build with newer freetype (Gentoo)
  ./autogen.sh
}

build() {
  cd "${srcdir}"/SDL_ttf-${pkgver}
  ./configure --prefix=/usr --libdir=/usr/lib32 CC="gcc -m32" PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  make
}

package() {
  cd "${srcdir}"/SDL_ttf-${pkgver}
  make DESTDIR=${pkgdir} install
  rm -rf "${pkgdir}"/usr/include
}

# vim: sw=2:ts=2 et:
