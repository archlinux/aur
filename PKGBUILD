# Maintainer: Julian Daube <joposter (at) gmail (dot) com>
# Contributor: Julian Daube <joposter (at) gmail (dot) com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=newmat-shared
_pkgname=newmat
pkgver=10E
_pkgver=10
pkgrel=1
pkgdesc="C++ matrix library"
url="http://www.robertnz.net"
arch=('i686' 'x86_64')
license=('custom')
source=("http://www.robertnz.net/ftp/$_pkgname$_pkgver.tar.gz" filelist makefile.patch)
sha256sums=('637d18c0363b8bb99c48eb04cce8c182ccbff771df0bf1e2d541e95f6eb34e7b'
            'b707dfdf6f64c7bcea1f288845b967349aaa76b6b8fb43559138a9f70307ceee'
            '57a4875047ea1a4a71d70509cc1e7018c13e0a71bde8f0d7d16ba1cabbec30aa')

provides=("newmat")
conflicts=("newmat")

prepare() {
  sed -i 's+//#define use_namespace+#define use_namespace+' include.h 
}

build() {
  patch nm_gnu.mak < makefile.patch
  make -f nm_gnu.mak
}

package() {
  for _i in `cat filelist | awk '{print $1}'`
  do
    install -Dm644 ${_i} "$pkgdir"/usr/include/$_pkgname/${_i}
  done
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$_pkgname/COPYING
  install -Dm644 README "$pkgdir"/usr/share/licenses/$_pkgname/README
  install -Dm644 libnewmat.so "$pkgdir"/usr/lib/libnewmat.so
  ln -s "/usr/lib/libnewmat.so" "$pkgdir"/usr/lib/libnewmat.so.10
 
  for _i in `cat filelist | awk '{print $1}'|sed s+.cpp+.o+|grep -v .h`
  do 
    install -Dm755 ${_i} "$pkgdir"/usr/lib/$_pkgname/${_i}
  done  

  install -Dm644 nm10.htm "$pkgdir"/usr/share/doc/$_pkgname/nm10.htm
}
