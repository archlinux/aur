# $Id$
# Maintainer: Ido Rosen <ido@kernel.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>
#
# NOTE: To request changes to this package, please submit a pull request
#       to the GitHub repository at https://github.com/ido/packages-archlinux
#       Otherwise, open a GitHub issue.  Thank you! -Ido
#

pkgname=gnupg-largekeys
pkgver=2.0.25
pkgrel=1
pkgdesc='Complete and free implementation of the OpenPGP standard'
url='http://www.gnupg.org/'
license=('GPL')
arch=('i686' 'x86_64')
optdepends=('curl: gpg2keys_curl'
            'libldap: gpg2keys_ldap'
            'libusb-compat: scdaemon')
makedepends=('curl' 'libldap' 'libusb-compat')
depends=('bzip2' 'libksba' 'libgcrypt' 'pth' 'libassuan' 'readline' 'pinentry' 'dirmngr')
source=("ftp://ftp.gnupg.org/gcrypt/${pkgname%%-largekeys}/${pkgname%%-largekeys}-${pkgver}.tar.bz2"{,.sig}
        'gnupg2-large-keys.patch'{,.sig}
        'install'{,.sig}
        'PKGBUILD.sig')
sha1sums=('890d77d89f2d187382f95e83e386f2f7ba789436' 'SKIP'
          'a77b9616d238fbdd5488e7024e5e1f36ce8ed586' 'SKIP'
          'ff80fc79329cfa631c19ae1ea6fc4a390ab851f7' 'SKIP'
          'SKIP')

install=install

conflicts=('gnupg2' 'gnupg')
provides=("gnupg2=${pkgver}" "gnupg=${pkgver}")
replaces=('gnupg2' 'gnupg')

prepare() {
	cd "${srcdir}/${pkgname%%-largekeys}-${pkgver}"
	patch -p1 -i ../gnupg2-large-keys.patch
}

build() {
	cd "${srcdir}/${pkgname%%-largekeys}-${pkgver}"
	./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--sbindir=/usr/bin \
		--libexecdir=/usr/lib/gnupg \
		--enable-maintainer-mode \
		--enable-standard-socket \
		--enable-symcryptrun \
		--enable-gpgtar \

	make
}

check() {
	cd "${srcdir}/${pkgname%%-largekeys}-${pkgver}"
	make check
}

package() {
	cd "${srcdir}/${pkgname%%-largekeys}-${pkgver}"
	make DESTDIR="${pkgdir}" install
	ln -s gpg2 "${pkgdir}"/usr/bin/gpg
	ln -s gpgv2 "${pkgdir}"/usr/bin/gpgv
	ln -s gpg2.1.gz "${pkgdir}"/usr/share/man/man1/gpg.1.gz
	rm "${pkgdir}/usr/share/gnupg/com-certs.pem" # FS#33059
}
