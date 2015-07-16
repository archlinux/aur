# Contributor: Zhang Li <richselian at gmail.com>
# Maintainer : aksr <aksr at t-com dot me>
_pkgname=lcc
pkgname=${_pkgname}-compiler
pkgver=4.2
pkgrel=1
pkgdesc="A small and fast C compiler."
arch=('i686' 'x86_64')
url=('http://www.cs.princeton.edu/software/lcc/')
license=('custom')
makedepends=('gcc')
source=("ftp://ftp.cs.princeton.edu/pub/packages/${_pkgname}/${_pkgname}-$pkgver.tar.gz")
install=${pkgname}.install
md5sums=('2c4826936b4486f3b0445a2ddb6cd642')
sha1sums=('40353f5dc66ac62cc27abe1e7ef09ad31be9168d')
sha256sums=('05d3e2b2824b30e9860621de1568a0a0f2028182955c5fedd68474a7bcab5d00')

build() {
  cd $srcdir/${_pkgname}-$pkgver
  mkdir -p ${_pkgname}
  BUILDDIR=lcc make -j2 CFLAGS="-O2 -DLCCDIR='\"/usr/lib/lcc/\"'" HOSTFILE=./etc/linux.c lcc
  BUILDDIR=lcc make -j2 CFLAGS="-O2 -DLCCDIR='\"/usr/lib/lcc/\"'" all
}

package() {
  cd $srcdir/${_pkgname}-$pkgver/${_pkgname}
  mkdir -p $pkgdir/usr/{bin,lib/${_pkgname}/include,man/man1}
  install -Dm755 bprint $pkgdir/usr/bin/bprint
  install -Dm755 lburg $pkgdir/usr/bin/lburg
  install -Dm755 lcc $pkgdir/usr/bin/lcc

  ## rcc renamed to lcc-rcc to avoid a conflict with qtchooser
  install -Dm755 rcc $pkgdir/usr/bin/${_pkgname}-rcc

  install -Dm755 cpp $pkgdir/usr/lib/${_pkgname}/gcc/cpp
  mv liblcc.a librcc.a $pkgdir/usr/lib/${_pkgname}/
  install -Dm644 ../CPYRIGHT $pkgdir/usr/share/licenses/${_pkgname}/COPYRIGHT
  ln -s /usr/lib/gcc/*-linux-gnu/*/include/* $pkgdir/usr/lib/${_pkgname}/include/
  ln -s /usr/lib/gcc/*-linux-gnu/*/crt* $pkgdir/usr/lib/${_pkgname}/
  cp -f ../include/x86/linux/* $pkgdir/usr/lib/${_pkgname}/include/
  install -Dm644 ../doc/bprint.1 $pkgdir/usr/man/man1/bprint.1
  install -Dm644 ../doc/lcc.1 $pkgdir/usr/man/man1/lcc.1
}

