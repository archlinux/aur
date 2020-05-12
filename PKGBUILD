# $Id$
# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Ido Rosen <ido@kernel.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>

pkgname=gnupg-largekeys
pkgver=2.2.20
pkgrel=1
pkgdesc='Complete and free implementation of the OpenPGP standard'
url='https://www.gnupg.org/'
license=('GPL')
arch=('i686' 'x86_64')
checkdepends=('openssh')
makedepends=('libldap' 'libusb-compat' 'pcsclite')
depends=('npth' 'libgpg-error' 'libgcrypt' 'libksba' 'libassuan'
         'pinentry' 'bzip2' 'readline' 'gnutls' 'sqlite')
optdepends=('libldap: gpg2keys_ldap'
            'libusb-compat: scdaemon'
            'pcsclite: scdaemon')
validpgpkeys=('D8692123C4065DEA5E0F3AB5249B39D24F25E3B6'
              '46CC730865BB5C78EBABADCF04376F3EE0856959'
              '031EC2536E580D8EA286A9F22071B08A33BD3F06'
              '5B80C5754298F0CB55D8ED6ABCEF7E294B092E28')
source=("https://gnupg.org/ftp/gcrypt/${pkgname%%-largekeys}/${pkgname%%-largekeys}-${pkgver}.tar.bz2"{,.sig}
        'gnupg2-large-keys.patch'
	'self-sigs-only.patch'
        'gnupg.install')
sha256sums=('04a7c9d48b74c399168ee8270e548588ddbe52218c337703d7f06373d326ca30'
            'SKIP'
            '78ff880f5ab363415a4bcdc704c8a4afecc39d6bac37f4ebe53bf2e8354c2d62'
            '0130c43321c16f53ab2290833007212f8a26b1b73bd4edc2b2b1c9db2b2d0218'
            'ab1406c54804692dcc8144fc01a90ffd27250a3b53a89b0ab8a5cb2807fe6423')

install=gnupg.install

conflicts=('gnupg2' 'gnupg')
provides=("gnupg2=${pkgver}" "gnupg=${pkgver}")
replaces=('gnupg2' 'gnupg')

prepare() {
	cd "${srcdir}/${pkgname%%-largekeys}-${pkgver}"
	sed '/noinst_SCRIPTS = gpg-zip/c sbin_SCRIPTS += gpg-zip' -i tools/Makefile.in
	patch -R -p1 -i ../self-sigs-only.patch
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
	ln -s gpg "${pkgdir}"/usr/bin/gpg2
	ln -s gpgv "${pkgdir}"/usr/bin/gpgv2

	cd doc/examples/systemd-user
	for i in *.*; do
		install -Dm644 "$i" "${pkgdir}/usr/lib/systemd/user/$i"
	done
}
