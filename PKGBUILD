# Maintainer: orumin <dev@orum.in>
 
_basename=graphene
pkgname="lib32-$_basename"
pkgver=1.4.0
pkgrel=1
pkgdesc="A thin layer of graphic data types"
url="https://github.com/ebassi/graphene"
arch=('x86_64')
license=(MIT)
depends=('lib32-glib2')
makedepends=('git' 'gobject-introspection')
source=("git+$url#tag=$pkgver")
md5sums=('SKIP')

prepare() {
  cd $_basename
  sed -i '1s/python$/&2/' build/identfilter.py
  NOCONFIGURE=1 ./autogen.sh
}
 
build() {
  cd $_basename

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure --prefix=/usr --disable-gtk-doc \
    --build=i686-pc-linux-gnu --libdir=/usr/lib32 
  make
}

check() {
  cd $_basename
  make check
}
 
package() {
  cd $_basename
  make DESTDIR="$pkgdir" install

  cd "$pkgdir"/usr
  rm -r include share
}
