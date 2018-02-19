# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Kessia 'even' Pinheiro <kessiapinheiro at gmail.com>
# Contributor: Penguin <TGates81.at.gmail.dot.com>

pkgname=ibam
pkgver=0.5.2
pkgrel=9
pkgdesc="An intelligent battery monitor"
arch=('x86_64' 'i686')
url="http://ibam.sourceforge.net/"
license=('GPL')
depends=('gcc-libs')
makedepends=('sed' 'make')
optdepends=('gnuplot: graphs support')
install="ibam.install"
source=("http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz"
	03acpi-check.dpatch
	ibam-0.5.2-sysfs.patch
	ibam-0.5.2-debian-sysfs-lenovo.patch)
md5sums=('2d5222ff504dd19e7c1ea8acc2f13cf5'
         '2f27fc97932bd59cabacbad063a13f0e'
         '2a50027f73276d91555105b713687a4d'
         '49f0667537a221f9f1ab5b8a1f513adb')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -i \
	-e "s|/local/bin|/bin|g" \
	-e "s|^CFLAGS=-O3|CFLAGS=${CFLAGS}|g" \
	Makefile
  patch -p1 <"$srcdir"/03acpi-check.dpatch
  patch -p1 <"$srcdir"/ibam-0.5.2-sysfs.patch
  patch -p1 <"$srcdir"/ibam-0.5.2-debian-sysfs-lenovo.patch
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -m0755 -d "$pkgdir"/usr/bin
  install -m0755 -D "$srcdir"/${pkgname}-${pkgver}/ibam "$pkgdir"/usr/bin/ibam
}
