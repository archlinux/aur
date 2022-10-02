# Maintainer: Christopher Hillenbrand <chillenb dot lists at gmail dot com>
# Contributor: Doron Behar <doron dot behar at gmail dot com>
# Contributor: Vianney le Clément <vleclement at gmail dot com>

pkgname=jbig2enc
pkgver=0.29
pkgrel=4
pkgdesc="A JBIG2 image encoder"
arch=('i686' 'x86_64')
url="https://github.com/agl/jbig2enc"
license=('Apache')
depends=('gcc-libs' 'leptonica>=1.68' 'libpng' 'libjpeg' 'libtiff')
optdepends=('python: for pdf.py')
provides=('jbig2enc')
conflicts=('jbig2enc-git')
makedepends=('automake' 'libtool' 'gzip')
changelog=CHANGELOG
source=("https://github.com/agl/jbig2enc/archive/refs/tags/$pkgver.tar.gz"
        "jbig2enc-pdfpy.patch"
        "jbig2enc.1"
	"commit-ea6a40a.patch"
	"dpi.patch")
sha256sums=('bfcf0d0448ee36046af6c776c7271cd5a644855723f0a832d1c0db4de3c21280'
            'a5d98fc43b2f3dc73dd1f352a439a6ae73fd085f469420aa29e47d9a4e2f40f6'
            'c940124f102695872fae02b243e0dd99c05ecfb3ecef0a476b3e903a0db69a54'
            '99d086e922653cc6fa0b1cccff90f9fd1d279ecd96104e73ea281c253781718a'
            '5cccc44d3019367351516cc3952692fbe23bc05b7c5726553f98d5b262f78686')


prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  #sed -i 's@^#!/usr/bin/python$@#!/usr/bin/env python2@' pdf.py
  patch --forward --strip=1 --input="${srcdir}/commit-ea6a40a.patch"
  patch --forward --strip=1 --input="${srcdir}/jbig2enc-pdfpy.patch"
  patch --forward --strip=1 --input="${srcdir}/dpi.patch"
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

