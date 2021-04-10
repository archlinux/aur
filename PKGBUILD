# $Id$
# Maintainer: xgjmibzr <xgjmibzr@gmail.com>
# Contributer: Felix Golatofski <contact@xdfr.de>
# Contributor: Ido Rosen <ido@kernel.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>

pkgname=gnupg-largekeys
pkgver=2.3.0
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
              '031EC2536E580D8EA286A9F22071B08A33BD3F06'
              '5B80C5754298F0CB55D8ED6ABCEF7E294B092E28'
	      '6DAA6E64A76D2840571B4902528897B826403ADA')
source=("https://gnupg.org/ftp/gcrypt/${pkgname%%-largekeys}/${pkgname%%-largekeys}-${pkgver}.tar.bz2"{,.sig}
        'gnupg2-large-keys.patch'
        'gnupg.install')
sha256sums=('84c1ef39e8621cfb70f31463a5d1d8edeab44332bc1e0e1af9b78b6f9ed05bb4'
	    'SKIP'
            'fa6a7a3daec793b3c6cd95538eb0bc5682ffb1ad0227b86cf89c8a552a7a7fd3'
            'ab1406c54804692dcc8144fc01a90ffd27250a3b53a89b0ab8a5cb2807fe6423')

install=gnupg.install

conflicts=('gnupg2' 'gnupg')
provides=("gnupg2=${pkgver}" "gnupg=${pkgver}")
replaces=('gnupg2' 'gnupg')

prepare() {
	cd "${srcdir}/${pkgname%%-largekeys}-${pkgver}"
	sed '/noinst_SCRIPTS = gpg-zip/c sbin_SCRIPTS += gpg-zip' -i tools/Makefile.in
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
		--enable-large-secmem

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
