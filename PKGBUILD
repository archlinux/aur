pkgname=seqlib
pkgver=1.2.0
pkgrel=12
pkgdesc="C++ htslib/bwa-mem/fermi interface for interrogating sequence data"
arch=('i686' 'x86_64')
url="https://github.com/walaj/SeqLib"
license=('Apache-2.0')
depends=('htslib' 'bwa' 'fermi-lite' 'jsoncpp')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('6892bdb5cae88d8d8acbbfadd351cfa00004bc7c0fd1ae912dc1ff1ccfd61a70')

prepare(){
    mv SeqLib-${pkgver} ${pkgname}-${pkgver}
    cd $srcdir/${pkgname}-${pkgver}
    sed -i 's|htslib/htslib/|htslib/|g' SeqLib/*.h src/*.cpp
    cd src
    rm -rf jsoncpp.cpp

}
build() {
  cd $srcdir/${pkgname}-${pkgver}/src
  gcc *.c *.cpp -I/usr/include -I.. -fPIC -O2 -o libseqlib.so -shared  -lhts -lbwa -lfml -ljsoncpp
  cd seqtools
  gcc seqtools.cpp -I/usr/include  -I../.. -L../ -O2 -o seqtools -lbwa -lhts -lseqlib -lfml -lz  -lstdc++

}

package() {
  cd $srcdir/${pkgname}-${pkgver}/src
  install -Dm755 libseqlib.so  -t ${pkgdir}/usr/lib/
  cd seqtools
  install -Dm755 seqtools -t ${pkgdir}/usr/bin/

  cd $srcdir/${pkgname}-${pkgver}/
  mkdir -p ${pkgdir}/usr/include/
  cp -rf SeqLib ${pkgdir}/usr/include/
}
