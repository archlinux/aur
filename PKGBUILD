# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=newmat-beta
pkgver=11
pkgrel=3
pkgdesc="C++ matrix library"
url="http://www.robertnz.net"
arch=('i686' 'x86_64')
license=('custom')
conflicts=('newmat')
provides=('newmat')
source=("http://www.robertnz.net/ftp/${pkgname%-beta}$pkgver.tar.gz" filelist)
sha256sums=('daf313a4db0db14dfcce236ad3cdc514d449e62ddd4f1b07cc31179b0787db6f'
            'aed92ae6e14d2298abde04a40489e0c5c0dc3ea13db9824a643de4aa7f2a4d34')
options=('staticlibs')

prepare() {
  sed -i 's+//#define use_namespace+#define use_namespace+' include.h 
}

build() {
  make -f nm_gnu.mak
}

package() {
  for _i in `cat filelist | awk '{print $1}'`
  do
    install -Dm644 ${_i} "$pkgdir"/usr/include/$pkgname/${_i}
  done
  install -Dm644 readme.txt "$pkgdir"/usr/share/licenses/$pkgname/readme.txt
  install -Dm644 libnewmat.a "$pkgdir"/usr/lib/libnewmat.a 
  for _i in `cat filelist | awk '{print $1}'|sed s+.cpp+.o+|grep -v .h`
  do 
    install -Dm755 ${_i} "$pkgdir"/usr/lib/$pkgname/${_i}
  done
}
