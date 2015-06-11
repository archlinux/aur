# Maintainer: Mattias Andrée
# Original Maintainer: Andreas Radke <andyrtr@archlinux.org>
# Original Contributor: Art Gramlich <art@gramlich-net.com>

pkgname=icu-48
_pkgname=icu
pkgver=4.8.1.1
pkgrel=1
pkgdesc="International Components for Unicode library"
arch=(i686 x86_64)
url="http://www.icu-project.org/"
license=('custom:"icu"')
depends=('gcc-libs' 'sh')
source=(#http://download.icu-project.org/files/${_pkgname}4c/${pkgver}/${_pkgname}4c-${pkgver/./_}-src.tgz
	http://download.icu-project.org/files/${_pkgname}4c/${pkgver}/${_pkgname}4c-${pkgver//./_}-src.tgz
	icu.8198.revert.icu5431.patch)
md5sums=('ea93970a0275be6b42f56953cd332c17'
         'ebd5470fc969c75e52baf4af94a9ee82')

build() {
  cd "${srcdir}/icu/source"
  # fix Malayalam encoding https://bugzilla.redhat.com/show_bug.cgi?id=654200
  patch -Rp3 -i "${srcdir}/icu.8198.revert.icu5431.patch"
  ./configure --prefix=/usr \
	--sysconfdir=/etc \
	--mandir=/usr/share/man
  make
}

package() {
  cd ${srcdir}/icu/source
  make -j1 DESTDIR="${pkgdir}" install
  
  rm -r "${pkgdir}/usr/include/"
  rm -r "${pkgdir}/usr/share/man/"
  rm -r "${pkgdir}/usr/sbin/"
  rm -r "${pkgdir}/usr/bin/"
  rm -r "${pkgdir}/usr/lib/pkgconfig"
  rm    "${pkgdir}/usr/lib/icu/pkgdata.inc"
  rm    "${pkgdir}/usr/lib/icu/Makefile.inc"
  rm    "${pkgdir}/usr/lib/icu/current"
  rm    "${pkgdir}/usr/lib/"*.so
}

