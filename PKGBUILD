pkgname=mingw-w64-jasper
pkgver=1.900.1
pkgrel=7
pkgdesc="A software-based implementation of the codec specified in the emerging JPEG-2000 Part-1 standard (mingw-w64)"
arch=(any)
url="http://www.ece.uvic.ca/~mdadams/jasper"
license=("custom:JasPer2.0")
makedepends=(mingw-w64-configure dos2unix)
depends=(mingw-w64-libjpeg-turbo)
options=(staticlibs !strip !buildflags)
source=("http://www.ece.uvic.ca/~mdadams/jasper/software/jasper-${pkgver}.zip"
"jpc_dec.c.patch"
"patch-libjasper-stepsizes-overflow.diff"
"jasper-1.900.1-CVE-2008-3520.patch"
"jasper-1.900.1-CVE-2008-3522.patch"
"jasper-1.900.1-mingw32.patch"
"jasper-1.900.1-CVE-2011-4516-and-CVE-2011-4517.patch"
"jasper-1.900.1-CVE-2014-8137.patch"
"jasper-1.900.1-CVE-2014-8138.patch"
"jasper-1.900.1-CVE-2014-8157.patch"
"jasper-1.900.1-CVE-2014-8158.patch"
"jasper-1.900.1-CVE-2014-9029.patch"
"jasper-1.900.1-fix-filename-buffer-overflow.patch"
"jasper-avoid-assert-abort.diff")
sha1sums=('9c5735f773922e580bf98c7c7dfda9bbed4c5191'
          'c1a0176a15210c0af14d85e55ce566921957d780'
          'f298566fef08c8a589d072582112cd51c72c3983'
          '2483dba925670bf29f531d85d73c4e5ada513b01'
          '0e7b6142cd9240ffb15a1ed7297c43c76fa09ee4'
          '18d47f342949c802665adafe05908fd5ced817c6'
          '3bfb37a4c732caa824563bad2603fcf5f2acf7f7'
          '437519aaaeff6076d11cdbea82125dbcac6f729b'
          '6086e717af2f0a026f70e399e28fe115f08a8cc1'
          'aaf96946073d2ece35f3695e8cc7956b5cad9a1d'
          'e69b339de43d1dc2fbb98368cee3d20f76d35941'
          'f5fe80c8576379d34f372f6a7c6a76630ab9fdcd'
          '577dfce40da75818c4d32eb1c4532b1370950bee'
          '98548b610a7319e569ee0425a32dc1d31a8771d2')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "$srcdir/jasper-$pkgver"
	find . -type f -exec dos2unix {} \;
  patch -p1 -i "${srcdir}/jpc_dec.c.patch"
  patch -p1 -i "${srcdir}/patch-libjasper-stepsizes-overflow.diff"
  patch -p1 -i "${srcdir}/jasper-1.900.1-CVE-2008-3520.patch"
  patch -p1 -i "${srcdir}/jasper-1.900.1-CVE-2008-3522.patch"
  patch -p1 -i "${srcdir}/jasper-1.900.1-CVE-2014-9029.patch"
  patch -p1 -i "${srcdir}/jasper-1.900.1-CVE-2014-8137.patch"
  patch -p1 -i "${srcdir}/jasper-avoid-assert-abort.diff"
  patch -p1 -i "${srcdir}/jasper-1.900.1-CVE-2014-8138.patch"
  patch -p1 -i "${srcdir}/jasper-1.900.1-CVE-2011-4516-and-CVE-2011-4517.patch"
  patch -p1 -i "${srcdir}/jasper-1.900.1-fix-filename-buffer-overflow.patch"
  patch -p1 -i "${srcdir}/jasper-1.900.1-CVE-2014-8157.patch"
  patch -p1 -i "${srcdir}/jasper-1.900.1-CVE-2014-8158.patch"
  autoreconf -vfi
  patch -p1 -i "$srcdir/jasper-1.900.1-mingw32.patch"
}

build() {
  cd "$srcdir/jasper-$pkgver"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure --disable-opengl --enable-libjpeg 
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/jasper-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    rm "$pkgdir"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
    rm -r "$pkgdir/usr/${_arch}/share"
  done
}
