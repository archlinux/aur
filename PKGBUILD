# Maintainer: lantw44 (at) gmail (dot) com
# Modified from guix-git 20130119 PKGBUILD 

pkgname=guix
pkgver=0.8
pkgrel=1
pkgdesc="GNU guix is a purely functional package manager"
arch=('x86_64' 'i686')
url="https://www.gnu.org/software/guix/"
license=('GPL')
depends=('guile>=2.0.5' 'sqlite>=3.6.19' 'bzip2' 'libgcrypt')
optdepends=('emacs: to enable Emacs Interface')
source=(
"ftp://alpha.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.gz"
"guix.service")
md5sums=(
'415f2a915db749ee28c3991032ab240a'
'4e088207919bdefff13a9d452f79467b')

build() {
	current_arch="`uname -m`"
	cd ${srcdir}/${pkgname}-${pkgver}
	./configure --prefix=/usr --localstatedir=/var --disable-rpath
	make
}

check() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make check
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make DESTDIR="${pkgdir}" install
	mkdir -p ${pkgdir}/lib/systemd/system
	install -m 644 "${srcdir}/guix.service" \
		${pkgdir}/lib/systemd/system/guix.service
	chmod -R u+w test-tmp
}
