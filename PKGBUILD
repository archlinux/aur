pkgname=yafu
pkgver=1.34.3
_msievever=1.52
_filenamever=1.34
pkgrel=2
pkgdesc="Automated integer factorization"
arch=('i686' 'x86_64')
depends=('gmp' 'gmp-ecm')
url="http://${pkgname}.sourceforge.net/"
license=('custom')
source=("http://sourceforge.net/projects/${pkgname}/files/${_filenamever}/${pkgname}-${_filenamever}-src.zip"
        "http://downloads.sourceforge.net/project/msieve/msieve/Msieve%20v${_msievever}/msieve${_msievever/./}.tar.gz")
sha1sums=('110553dece04ea010857c50207874c04a2b3e58d'
          '88a1ce2354b57835231bcaca0ecb0477b975b5cd')

prepare() {
  cd "${srcdir}/msieve-${_msievever}"
  sed -e 's/CFLAGS = /CFLAGS += /' \
      -e 's/-march=core2//g' \
      -i Makefile
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -e 's/CFLAGS = /CFLAGS += /' \
      -e 's/..\/msieve\/lib\/linux\/x86_64/..\/msieve-'"${_msievever}"'\//' \
      -e 's/-lmsieve/-lmsieve -lz/' \
      -i Makefile
}

build() {
  _CFLAGS=$CFLAGS
  cd "${srcdir}/msieve-${_msievever}"
  [[ $CARCH = i686 ]] && CFLAGS+=' -msse'
  CFLAGS+=' -fopenmp'
  make all ECM=1
  CFLAGS=$_CFLAGS
  cd "${srcdir}/${pkgname}-${pkgver}"
  make NFS=1 $CARCH
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -D -m755 yafu "${pkgdir}/usr/bin/yafu"
  head -n18 factor/factor_common.c|tail -n+2>LICENSE
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
