# Maintainer: Cody P Schafer <dev@codyps.com>
# Maintainer: Michał Wojdyła <micwoj9292@gmail.com>
# Maintainer: Alexander Jacocks <alexander@redhat.com>
# Contributor: Pablo Lezaeta <prflr88@gmail.com>
pkgname=hfsutils
pkgver=3.2.6_p15
pkgrel=1
pkgdesc="HFS Access utils"
arch=('x86_64')
license=('GPL2')
url="https://www.mars.org/home/rob/proj/hfs/"
depends=(glibc)
optdepends=('tcl: xhfs GUI'
            'tk: xhfs GUI')
source=(
	"https://deb.debian.org/debian/pool/main/${pkgname:0:1}/${pkgname}/${pkgname}_${pkgver/_p*}.orig.tar.gz"
	"https://deb.debian.org/debian/pool/main/${pkgname:0:1}/${pkgname}/${pkgname}_${pkgver/_p/-}.debian.tar.xz"
	)
sha256sums=('bc9d22d6d252b920ec9cdf18e00b7655a6189b3f34f42e58d5bb152957289840'
            '1477221ab2e563198f111e2b9f6564e9af3ce4c5ae7f9fccd983ec41c70a15d9')

prepare() {
	for file in $(cat ./debian/patches/series); do
		patch -Np1 -d ${pkgname}-${pkgver%_p*} <"debian/patches/$file"
	done
}

build() {
	cd "${pkgname}-${pkgver%_p*}"
	autoreconf -fi
  # test for tcl and tk presence
  if [ -x /usr/bin/tclsh -a -x /usr/bin/wish ]; then
	  ./configure --with-tcl --with-tk
  else
	  ./configure
  fi
	make prefix=/usr
	make -C hfsck prefix=/usr
}

package() {
	cd "${pkgname}-${pkgver%_p*}"
	install -d -m755 "${pkgdir}/usr/bin"
	install -d -m755 "${pkgdir}/usr/share/man/man1"
	DESTDIR="${pkgdir}" make install prefix="${pkgdir}/usr" MANDEST="${pkgdir}/usr/share/man"
}
