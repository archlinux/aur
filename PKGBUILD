# Maintainer: orumin <dev@orum.in>

_basename=libkate
pkgname="lib32-$_basename"
pkgver=0.4.1
pkgrel=1
pkgdesc="A karaoke and text codec for embedding in ogg (32-bit)"
url="http://libkate.googlecode.com/"
license=('BSD')
arch=('x86_64')
depends=('lib32-libpng' 'lib32-libogg' 'lib32-python2' "$_basename")
makedepends=('pkg-config')
optdepends=('wxpython: for KateDJ'
            'liboggz: for KateDJ')
source=("http://libkate.googlecode.com/files/${_basename}-${pkgver}.tar.gz")
md5sums=('1dfdbdeb2fa5d07063cf5b8261111fca')

build() {
  cd "${srcdir}/${_basename}-${pkgver}"

  export PYTHON="/usr/bin/python2"
  sed "1s/python$/python2/" -i tools/KateDJ/KateDJ

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure --prefix=/usr \
              --libdir=/usr/lib32 \
              --build=i686-pc-linux-gnu \
              --disable-static \
              --disable-doc
  make
}

package() {
  cd $_basename-$pkgver
  make DESTDIR="${pkgdir}" install

  python2-32 -m compileall "${pkgdir}/usr/lib/python2.7/site-packages/kdj/"

  cd "$pkgdir"/usr
  mv lib/* lib32
  rm -r bin lib include share
}
