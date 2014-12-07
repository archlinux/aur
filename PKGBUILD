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
pkgver=2.1.0
pkgrel=6
pkgdesc='Complete and free implementation of the OpenPGP standard'
url='http://www.gnupg.org/'
license=('GPL')
arch=('i686' 'x86_64')
optdepends=('libldap: gpg2keys_ldap'
            'libusb-compat: scdaemon')
makedepends=('libldap' 'libusb-compat')
depends=('npth' 'libgpg-error' 'libgcrypt' 'libksba' 'libassuan'
         'pinentry' 'bzip2' 'readline')
source=("ftp://ftp.gnupg.org/gcrypt/${pkgname%%-largekeys}/${pkgname%%-largekeys}-${pkgver}.tar.bz2"{,.sig}
        'oid2str-overflow.patch'
        'subpacket-off.patch'
        'refresh-keys.patch'
        'hash-ecdsa.patch')
        #'gnupg2-large-keys.patch'{,.sig}
        #'install'{,.sig}
        #'PKGBUILD.sig')
sha1sums=('2fcd0ca6889ef6cb59e3275e8411f8b7778c2f33' 'SKIP'
          '774f7fe541428f45ee145c763cf5634264e3bc69'
          '1a86b834904c7d18d932ad1bb44d3642990d3cbd'
          '246bea8776882f4c0293685482558f6ead1cf902'
          'b9bd644276aa1c1a3fcaed82e65eecccfd1f36ed')
          #'5932d322a6d4ec5eeafa4ac472f19c07bf4502af' 'SKIP'
          #'9409c0fab2ae8e580f4b00bd15b4a590f097a9a9' 'SKIP'
          #'SKIP')

install=install

conflicts=('dirmngr' 'gnupg2' 'gnupg')
provides=('dirmngr' "gnupg2=${pkgver}" "gnupg=${pkgver}")
replaces=('dirmngr' 'gnupg2' 'gnupg')

prepare() {
	cd "${srcdir}/${pkgname%%-largekeys}-${pkgver}"
	patch -p1 -i ../oid2str-overflow.patch
	patch -p1 -i ../subpacket-off.patch
	patch -p1 -i ../refresh-keys.patch
	patch -p1 -i ../hash-ecdsa.patch
	#patch -p1 -i ../gnupg2-large-keys.patch
}

build() {
	cd "${srcdir}/${pkgname%%-largekeys}-${pkgver}"
	./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--sbindir=/usr/bin \
		--libexecdir=/usr/lib/gnupg \
		--enable-maintainer-mode \
		--enable-symcryptrun \
		--enable-gpgtar \
		--enable-large-secmem \

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
