# Author: n3ssuno <carlo.bottai@gmail.com>

_pkgname=icu
pkgname=${_pkgname}61
pkgver=61.1
pkgrel=1
pkgdesc="International Components for Unicode library"
arch=('i686' 'x86_64')
url="http://www.icu-project.org/"
license=('custom:"icu"')
depends=('gcc-libs>=4.7.1-5')
source=(https://vorboss.dl.sourceforge.net/project/${_pkgname}/ICU4C/${pkgver}/${_pkgname}4c-${pkgver//./_}-src.tgz)
sha1sums=('06ca7b1e64c28e07d5633a2e0257380884ea486b')

prepare() {
    # fix xlocale.h problems (FS#55246)
    cd ${srcdir}/${_pkgname}/source
    sed -i 's/xlocale/locale/' i18n/digitlst.cpp
}

build() {
  cd ${srcdir}/${_pkgname}/source
  ./configure --prefix=/usr \
	--sysconfdir=/etc \
	--mandir=/usr/share/man
  make -j5
}

package() {
  cd ${srcdir}/${_pkgname}/source
  make -j5 DESTDIR=${pkgdir} install
  rm -r "${pkgdir}"/usr/{bin,include,sbin,share,lib/*so,lib/icu/{Makefile.inc,current,pkgdata.inc}}
  rm -r "${pkgdir}/usr/lib/pkgconfig"

  # Install license
  install -Dm644 ${srcdir}/${_pkgname}/license.html ${pkgdir}/usr/share/licenses/${pkgname}/license.html
}
