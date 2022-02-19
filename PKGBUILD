# Maintainer: Christopher Hillenbrand <chillenb dot lists at gmail dot com>
# Contributor: Doron Behar <doron dot behar at gmail dot com>
# Contributor: Vianney le Clément <vleclement at gmail dot com>

pkgname=jbig2enc
pkgver=0.29
pkgrel=2
pkgdesc="A JBIG2 image encoder"
arch=('i686' 'x86_64')
url="https://github.com/agl/jbig2enc"
license=('Apache')
depends=('gcc-libs' 'leptonica>=1.68' 'libpng' 'libjpeg' 'libtiff')
optdepends=('python: for pdf.py')
provides=('jbig2enc')
conflicts=('jbig2enc-git')
makedepends=('automake' 'libtool' 'gzip')
source=("https://github.com/agl/jbig2enc/archive/refs/tags/$pkgver.tar.gz"
        "jbig2enc-pdfpy.patch"
        "jbig2enc.1")
sha256sums=('bfcf0d0448ee36046af6c776c7271cd5a644855723f0a832d1c0db4de3c21280'
            '2614e02f9cc71d9b186ffaecf6abb4b270ad9ce43cb4d6284e9e96c4e4a44d06'
            'c940124f102695872fae02b243e0dd99c05ecfb3ecef0a476b3e903a0db69a54')


prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  #sed -i 's@^#!/usr/bin/python$@#!/usr/bin/env python2@' pdf.py
  patch --forward --strip=1 --input="${srcdir}/jbig2enc-pdfpy.patch"
  cat "${srcdir}/jbig2enc.1" | gzip > "${srcdir}/jbig2enc.1.gz"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make install DESTDIR="$pkgdir"
  install -dm755 "$pkgdir/usr/share/man/man1"
  install -m644 "${srcdir}/jbig2enc.1.gz" "$pkgdir/usr/share/man/man1"
}

