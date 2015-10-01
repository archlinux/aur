pkgname=lib32-orbit2
pkgver=2.14.19
pkgrel=5
pkgdesc="Thin/fast CORBA ORB (32 bit)"
arch=('x86_64')
url="http://www.gnome.org"
license=('LGPL' 'GPL')
depends=('lib32-libidl2' 'orbit2')
makedepends=('gcc-multilib' 'gtk-doc')
options=('!libtool' '!makeflags')
source=(http://ftp.gnome.org/pub/gnome/sources/ORBit2/2.14/ORBit2-${pkgver}.tar.bz2
        updates-until-26371ccfe.patch)
sha256sums=('55c900a905482992730f575f3eef34d50bda717c197c97c08fa5a6eafd857550'
            '55ccbebc03fc60f78141bbba0a0c25b52e4ca434e831f5ddcf29b2ce56b8f676')

prepare() {
  cd ORBit2-${pkgver}

  # https://git.gnome.org/browse/ORBit2/log/ (2013-05-14)
  patch -p1 -i ../updates-until-26371ccfe.patch
}

build() {
  cd ORBit2-${pkgver}

  libtoolize --force
  gtkdocize
  aclocal
  autoreconf -i
  automake

  ./configure --prefix=/usr --libdir=/usr/lib32 --libexecdir=/usr/lib32 \
    	--disable-static --enable-shared CC='gcc -m32' \
    	--with-idl-compiler=/usr/bin/orbit-idl-2
  make
}

package() {
  cd ORBit2-${pkgver}
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,include,share}
}
