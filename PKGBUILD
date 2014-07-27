# Maintainer: lantw44 (at) gmail (dot) com
# Modified from guix-git 20130119 PKGBUILD 

pkgname=guix
pkgver=0.7
pkgrel=1
pkgdesc="GNU guix is a purely functional package manager"
arch=('x86_64' 'i686')
url="https://www.gnu.org/software/guix/"
license=('GPL')
depends=('guile>=2.0.5' 'sqlite>=3.6.19' 'bzip2' 'libgcrypt')
makedepends=()
source=(
"ftp://alpha.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.gz"
"guix.service")
md5sums=(
'c9d174a27fc55889c1f1b005875120ae'
'4e088207919bdefff13a9d452f79467b')

build() {
	current_arch="`uname -m`"
	cd ${srcdir}/${pkgname}-${pkgver}
	./configure --prefix=/usr --localstatedir=/var \
		--disable-rpath --with-system=${current_arch}-linux
	make
}

check() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make -k -j1 check
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make DESTDIR="${pkgdir}" install
	mkdir -p ${pkgdir}/lib/systemd/system
	install -m 644 "${srcdir}/guix.service" \
		${pkgdir}/lib/systemd/system/guix.service
	chmod -R u+w test-tmp
}
