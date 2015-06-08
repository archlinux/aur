# $Id: PKGBUILD 150540 2012-02-18 12:17:15Z pierre $
# Contributor: dorphell <dorphell@archlinux.org>
# Maintainer: GordonGR <gordongr@freemail.gr>

pkgname="lib32-libid3tag"
_pkgname="libid3tag"
pkgver=0.15.1b
pkgrel=1
pkgdesc="library for id3 tagging, lib32."
arch=('x86_64')
url="http://www.underbit.com/products/mad/"
license=('GPL')
depends=('lib32-zlib' "${_pkgname}")
makedepends=('gperf')
options=('!libtool')
source=("ftp://ftp.mars.org/pub/mpeg/${_pkgname}-${pkgver}.tar.gz"
	'id3tag.pc'
	'10_utf16.diff'
	'11_unknown_encoding.diff'
	'CVE-2008-2109.patch')
md5sums=('e5808ad997ba32c498803822078748c3'
	'8bb41fd814fafcc37ec8bc88f5545a4a'
	'4f9df4011e6a8c23240fff5de2d05f6e'
	'3ca856b97924d48a0fdfeff0bd83ce7d'
	'c51822ea6301b1ca469975f0c9ee8e34')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  patch -p1 -i ${srcdir}/10_utf16.diff
  patch -p1 -i ${srcdir}/11_unknown_encoding.diff
  patch -Np0 -i ${srcdir}/CVE-2008-2109.patch

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  ./configure --prefix=/usr --libdir=/usr/lib32 --libexecdir=/usr/lib32
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -D -m644 "${srcdir}/id3tag.pc" "${pkgdir}/usr/lib32/pkgconfig/id3tag.pc"
  rm -rf "${pkgdir}/usr/include"
}
