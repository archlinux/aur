# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>

pkgname=libxml2
pkgver=2.7.8
pkgrel=2
pkgdesc="XML parsing library, version 2"
arch=(i686 x86_64)
license=('custom')
depends=('zlib>=1.2.4' 'readline>=6.1' 'ncurses>=5.7')
makedepends=('python2')
options=('!libtool')
url="http://www.xmlsoft.org/"
source=(ftp://ftp.xmlsoft.org/${pkgname}/${pkgname}-${pkgver}.tar.gz
        http://www.w3.org/XML/Test/xmlts20080205.tar.gz
        largefile64.patch
        shared_library_versionning.patch
        libxml2-2.7.8-xpath-freeing.patch
        libxml2-2.7.8-xpath-freeing2.patch
        CVE-2011-1944.patch
        libxml2-2.7.8-xpath-hardening.patch
        CVE-2011-0216.patch
        CVE-2011-2834.patch
        CVE-2011-3905.patch
        CVE-2011-3919.patch)
md5sums=('8127a65e8c3b08856093099b52599c86'
         'b255be9a1c7f7021e52448e4ec8d7a0d'
         '5ad4915665608ebfa5b89f7908467a72'
         '84aeb7c6db023eae044e95d9211dba53'
         'f1df70c66dac94233932baf2737465e0'
         'c22af2643840da65dea618bf6cd33b25'
         'd2b2b362a8681c30be98c4a2e7f2d2ea'
         '5709a1408becc1f0c6f1c7513a254dd2'
         '4f0f2d3a11329ebee0907be6002a160e'
         '88e9c95a813d4f0cb392acc000bae366'
         '28f3022a0d63ee408774eb5e4914b07e'
         'a9b901d9ff095a266d3a5c601db142b1')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -i "${srcdir}/largefile64.patch"
  patch -Np1 -i "${srcdir}/shared_library_versionning.patch"
  patch -Np1 -i "${srcdir}/libxml2-2.7.8-xpath-freeing.patch"
  patch -Np1 -i "${srcdir}/libxml2-2.7.8-xpath-freeing2.patch"
  patch -Np1 -i "${srcdir}/CVE-2011-1944.patch"
  patch -Np1 -i "${srcdir}/libxml2-2.7.8-xpath-hardening.patch"
  patch -Np1 -i "${srcdir}/CVE-2011-0216.patch"
  patch -Np1 -i "${srcdir}/CVE-2011-2834.patch"
  patch -Np1 -i "${srcdir}/CVE-2011-3905.patch"
  patch -Np1 -i "${srcdir}/CVE-2011-3919.patch"
  autoreconf -fi
  sed -e 's|/usr/bin/python -u|/usr/bin/python2 -u|g' -e 's|/usr/bin/python$|/usr/bin/python2|g' -i python/tests/*.py
  ./configure --prefix=/usr --with-threads --with-history \
     --with-python=/usr/bin/python2
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mv "${srcdir}/xmlconf" .
  make check
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
