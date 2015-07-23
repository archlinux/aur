# Contributor: josephgbr <rafael.f.f1 at gmail dot com>
# Maintainer: GordonGR <ntheo1979@gmail.com>

_pkgbase=faac
pkgname=lib32-$_pkgbase
pkgver=1.28
pkgrel=7
pkgdesc="An AAC audio encoder (32 bit)"
arch=('x86_64')
url="http://www.audiocoding.com/"
license=('GPL' 'custom:FAAC')
depends=('lib32-libmp4v2' "$_pkgbase")
makedepends=('gcc-multilib')
source=("http://downloads.sourceforge.net/$_pkgbase/$_pkgbase-$pkgver.tar.gz"
        'altivec.patch' 'mp4v2-1.9.patch' 'mp4v2-2.0.0.patch')
md5sums=('80763728d392c7d789cde25614c878f6'
         'db6b43868ad91127c6a7b57f5c6ca6bb'
         '9d52a17e68fa15ca94e88e1457b94b74'
         '482f515920716899ecda925613f0c31e')

prepare() {
  cd $_pkgbase-$pkgver
  
  patch -p1 -i ../mp4v2-1.9.patch
  patch -p0 -i ../mp4v2-2.0.0.patch
  patch -p0 -i ../altivec.patch  
  find . -type f -print0 | xargs -0 sed -i 's/\r//g'
  sed -i 's/AM_CONFIG_HEADER(config.h)/AC_CONFIG_HEADERS([config.h])/' configure.in
  
  ./bootstrap
}

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  
  cd $_pkgbase-$pkgver
  
  ./configure --prefix=/usr --libdir=/usr/lib32 --libexecdir=/usr/lib32/$_pkgbase
  make
}

package() {
  cd $_pkgbase-$pkgver
  make DESTDIR="$pkgdir" install  
  rm -rf "$pkgdir"/usr/{bin,include,share}
  
  install -dm755 "$pkgdir"/usr/share/licenses
  ln -s $_pkgbase "$pkgdir"/usr/share/licenses/$pkgname
}
