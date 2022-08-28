pkgname=seqlib
pkgver=1.2.0
pkgrel=3
pkgdesc="C++ htslib/bwa-mem/fermi interface for interrogating sequence data"
arch=('i686' 'x86_64')
url="https://github.com/walaj/SeqLib"
license=('Apache')
depends=('htslib')
# Do NOT add 'bwa' to depends, this package uses a flavored version of bwa.
makedepends=('autoconf' 'git')
source=("${pkgname}::git+https://github.com/walaj/SeqLib.git#tag=${pkgver}"
"fermi-lite::git+https://github.com/walaj/fermi-lite.git"
)

prepare(){
    cd $srcdir/${pkgname}
    git submodule update --init --recursive
    sed -i '33c extern const uint8_t rle_auxtab[8];' bwa/rle.h fermi-lite/rle.h
}
build() {
  cd ${pkgname}
  ./configure LDFLAGS='-lcurl -lcrypto' CFLAGS='-fPIC' CXXFLAGS='-fPIC'
  make
  make seqtools
}

package() {
  cd ${pkgname}
  make install
  install -d ${pkgdir}/usr
  mv bin lib ${pkgdir}/usr
  cd ${pkgdir}/usr/lib
  # {bwa,fml,hts,seqlib};
  for mylib in {seqlib,};
  do
    ar -x lib${mylib}.a
    gcc  -shared *.o -o lib${mylib}.so
    rm -rf *.o
  done
  cd $srcdir/${pkgname}
  sed -i 's|htslib/htslib/|htslib/|g' SeqLib/*.h
  mkdir -p ${pkgdir}/usr/include/
  cp -rf SeqLib ${pkgdir}/usr/include/
}
sha256sums=('SKIP'
            'SKIP')
