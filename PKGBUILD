# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: Christian Pellegrin (chripell) <chripell@fsfe.org>
# Contributor: An Nguyen (stk) <an@linux.com>
# Contributor: George Angelopoulos <george@usermod.net>
# Contributor: Christian Rebischke <Chris.Rebischke@archlinux.org>
# Contributor: dront78 <dront78@gmail.com>

pkgname=systemtap
pkgver=5.1
pkgrel=1
pkgdesc="Infrastructure to simplify the gathering of information about the running Linux system"
url="https://sourceware.org/systemtap/"
arch=('x86_64')
license=('GPL')
depends=('elfutils' 'nss' 'python' 'cpio')
makedepends=('python-setuptools' 'xmlto')
optdepends=('sqlite3: for storing results in a database')
options=('!emptydirs')
install="${pkgname}.install"
source=("https://sourceware.org/ftp/${pkgname}/releases/${pkgname}-${pkgver}.tar.gz"{,.asc})
sha512sums=('da0fe237d2124031a5786d1221dbb420d90da5497376715fd43a7a9f61a354a229c1128e67ce6becbc012aa3796dc5d337149e239e3c1def0651b179e5bf199f'
            'SKIP')

validpgpkeys=('41A0C11274B1E87FE28E4C53E3D77E1F95161991')

build() {
	cd "${pkgname}-${pkgver}"
	./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--libexecdir=/usr/lib/"${pkgname}" \
		--libdir=/usr/lib/"${pkgname}" \
		--mandir=/usr/share/man/ \
		--sbindir=/usr/bin \
		--localstatedir=/var \
		--enable-pie \
		--disable-docs \
		--enable-htmldocs \
		--with-python3
	make
}

check() {
	cd "${pkgname}-${pkgver}"
	make check
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
	rm -r "${pkgdir}/usr/include/sys"
}
