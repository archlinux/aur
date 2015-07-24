# Maintainer: GordonGR <ntheo1979@gmail.com>
# josephgbr <rafael.f.f1@gmail.com>

_pkgname=libdc1394
pkgname=lib32-${_pkgname}
pkgver=2.2.3
pkgrel=1
pkgdesc="High level programming interface to control IEEE 1394 based cameras (32 bit)"
arch=('x86_64')
license=('LGPL')
url="http://sourceforge.net/projects/libdc1394/"
depends=('lib32-libraw1394' 'lib32-libusb' "${_pkgname}")
makedepends=('gcc-multilib')
options=('!emptydirs')
source=("http://downloads.sourceforge.net/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
        'sdl-config-32.patch')
md5sums=('443d0638e51054ff37fb8e551e07672a'
         'c17d80af8323d82fbc9a4993b758d4ab')

prepare() {

# This might be redundant and overkill
cd ${_pkgname}-${pkgver}
patch -Np2 < ../sdl-config-32.patch

}

build() {
export CC='gcc -m32'
export CXX='g++ -m32'
export LDFLAGS='-m32'
#SDL_CFLAGS = -I/usr/include/SDL -D_GNU_SOURCE=1 -D_REENTRANT
export SDL_CONFIG='/usr/bin/sdl-config-32'
export SDL_LIBS='-L/usr/lib32 -lSDL -lpthread'

export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
cd ${_pkgname}-${pkgver}
./configure --prefix=/usr --libdir=/usr/lib32
make
}

package() {
cd ${_pkgname}-${pkgver}
make DESTDIR="${pkgdir}" install
rm -rf "${pkgdir}/usr"/{bin,include,share}
}
