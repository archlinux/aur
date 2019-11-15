# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Art Gramlich <art@gramlich-net.com>

_pkgname=icu
pkgname=${_pkgname}64
pkgver=64.2
pkgrel=1
pkgdesc="International Components for Unicode library"
arch=('i686' 'x86_64')
url="http://www.icu-project.org/"
license=('custom:icu')
depends=('gcc-libs' 'sh')
makedepends=('clang' 'make' 'patch')
source=(https://github.com/unicode-org/icu/releases/download/release-64-2/icu4c-64_2-src.tgz)
sha512sums=('5ecb4c230ba45918747a1cf9aef86f555aa07d5b29b1d07ab674e8013f46dfb907a0e9d6945db41155f9dc3012fd94e1152ffc19f61a68b6dfcbabdcb8ae9d78')

build() {
  cd ${srcdir}/${_pkgname}/source
  
  ./configure --prefix=/usr \
	--sysconfdir=/etc \
	--mandir=/usr/share/man \
	--sbindir=/usr/bin
  make
}

package() {
  cd ${srcdir}/${_pkgname}/source
  
  make -j1 DESTDIR=${pkgdir} install
  rm -r "${pkgdir}"/usr/{bin,include,share,lib/*so,lib/icu/{Makefile.inc,current,pkgdata.inc}}
  rm -r "${pkgdir}/usr/lib/pkgconfig"

  # Install license
  install -Dm644 ${srcdir}/${_pkgname}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
