# Maintainer: Antonio Leal <antonioleal@yahoo.com>
# Contributer: Frederic Bezies < fredbezies at gmail dot com>
# Contributor: Drew DeVault <sir@cmpwn.com>
pkgname=yaze
pkgver=2.51.3
pkgrel=1
license=('GPL')
pkgdesc='Yet Another z80 (CP/M) Emulator'
arch=("i686" "x86_64")
url='http://www.mathematik.uni-ulm.de/users/ag/yaze-ag/'
source=("http://www.mathematik.uni-ulm.de/users/ag/yaze-ag/devel/yaze-ag-${pkgver}.tar.gz")
sha256sums=('2b0a90c3bf3a27574b0427cf4579dc2347b371bec3fea5739e1527edf74b2809')
options=(!debug)

prepare() {
  cd ${pkgname}-ag-${pkgver}
  cp Makefile_linux_64_intel_corei7 Makefile
  patch yaze.sh ../../yaze.sh.patch
  patch Makefile ../../Makefile.patch
}

build() {
  cd ${pkgname}-ag-${pkgver}
  [[ ${CARCH} == x86_64 ]] && _BUILD='" (build for x86_64Bit (x86-64))"'
  [[ ${CARCH} == i686 ]] && _BUILD='" (build for x86_32Bit (i686))"'
  make PREFIX=/usr BUILD="${_BUILD}" OPTIMIZE="${CFLAGS/-O2/-O3}"
}

package() {
  cd ${pkgname}-ag-${pkgver}
  BINDIR=${BINDIR:-"$pkgdir/usr/bin"}
  MANDIR=${MANDIR:-"$pkgdir/usr/man/man1"}
  LIBDIR=${LIBDIR:-"$pkgdir/usr/lib/yaze-ag"}
  DSKDIR=${DSKDIR:-"$pkgdir/usr/share/yaze-ag/disks"}
  DOCDIR=${DOCDIR:-"$pkgdir/usr/doc/yaze-ag-$pkgver/doc"}
  DOCHTMLDIR=${DOCHTMLDIR:-"$pkgdir/usr/doc/yaze-ag-$pkgver/doc_html"}
  mkdir -p $BINDIR $MANDIR $LIBDIR $DSKDIR $DOCDIR $DOCHTMLDIR
  install -s -c -m 755 yaze_bin $BINDIR
  install -s -c -m 755 cdm $BINDIR
  install -c -m 755 yaze $BINDIR
  install -c -m 644 yaze-cpm3.boot $LIBDIR
  install -c -m 644 yaze.boot $LIBDIR
  install -c -m 644 m2.ktt $LIBDIR
  install -c -m 644 sample.ktt $LIBDIR
  install -c -m 644 yaze.ktt $LIBDIR
  install -c -m 644 yaze.1 $MANDIR
  install -c -m 644 cdm.1 $MANDIR
  install -c -m 644 cpm.1 $MANDIR
  install -c -m 644 z80.1 $MANDIR
  /bin/sh $srcdir/${pkgname}-ag-${pkgver}/install_disks.sh $DSKDIR
  /bin/sh $srcdir/${pkgname}-ag-${pkgver}/install_doc.sh $DOCDIR
  /bin/sh $srcdir/${pkgname}-ag-${pkgver}/install_doc_html.sh $DOCHTMLDIR

  mkdir -p "$pkgdir/usr/share/pixmaps"
  cp ../../yaze-ag.png "$pkgdir/usr/share/pixmaps"
  mkdir -p "$pkgdir/usr/share/applications"
  cp ../../yaze-ag.desktop "$pkgdir/usr/share/applications"

  cd $LIBDIR
  rm -f md5 $pkgdir/md5.yaze-ag
  find . -type f -exec /bin/md5sum -b {} >>$pkgdir/md5.yaze-ag \;
  mv "$pkgdir/md5.yaze-ag" md5
}
