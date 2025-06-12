# $Id$
# Maintainer: xgjmibzr <xgjmibzr@gmail.com>
# Contributer: Felix Golatofski <contact@xdfr.de>
# Contributor: Ido Rosen <ido@kernel.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>

pkgname=gnupg-largekeys
_base_name=${pkgname%%-largekeys}
pkgver=2.4.8
pkgrel=1
pkgdesc='Complete and free implementation of the OpenPGP standard'
url='https://www.gnupg.org'
license=('GPL')
arch=('i686' 'x86_64')
checkdepends=('openssh')
makedepends=('libldap' 'libusb-compat' 'pcsclite')
depends=('npth' 'libgpg-error' 'libgcrypt' 'libksba' 'libassuan'
         'pinentry' 'bzip2' 'readline' 'gnutls' 'sqlite')
optdepends=('libldap: gpg2keys_ldap'
            'libusb-compat: scdaemon'
            'pcsclite: scdaemon')
options=('!strip')
validpgpkeys=('AC8E115BF73E2D8D47FA9908E98E9B2D19C6C8BD'
              '3B761AE4E63BF3519CE7D63BECB664CBE1332EEF'
	      '6DAA6E64A76D2840571B4902528897B826403ADA'
	      '02F38DFF731FF97CB039A1DA549E695E905BA208')
source=("${url}/ftp/gcrypt/${_base_name}/${_base_name}-${pkgver}.tar.bz2"{,.sig}
        'gnupg2-large-keys.patch'
        'avoid-beta-warning.patch'
        'max-mpi-bits.patch'
        'gnupg.install')
sha256sums=('b58c80d79b04d3243ff49c1c3fc6b5f83138eb3784689563bcdd060595318616'
            'SKIP'
            '6ac90c4e8ad7cb2e3ae37b328449efac7b0c3a8b30dbbf9d3650ab679244f768'
            '2e0d0ae24027b8f21cac442b9a67ee6cf153caf304cde5e0447b6071d1ac543c'
            '3731e116bd604c8ac630fe565a1d1dc8dbb41d1eaadd8aa39ab4a5933a1a0bc4'
            '95a41dd1b6a76d7eabcd40c42e2fd24902c6f0b50cea91d2e2beb97911bb2821')

install=gnupg.install

conflicts=('gnupg2' 'gnupg')
provides=("gnupg2=${pkgver}" "gnupg=${pkgver}")
replaces=('gnupg2' 'gnupg')

prepare() {
	cd "${srcdir}/${pkgname%%-largekeys}-${pkgver}"
	sed '/noinst_SCRIPTS = gpg-zip/c sbin_SCRIPTS += gpg-zip' -i tools/Makefile.in
	patch -p1 -i ../gnupg2-large-keys.patch
        patch -p1 -i ../avoid-beta-warning.patch
#        patch -p1 -i ../drop-import-clean.patch
	patch -p1 -i ../max-mpi-bits.patch

        ./autogen.sh
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

	cd doc/examples
	for i in *.*; do
		install -Dm644 "$i" "${pkgdir}/usr/lib/systemd/user/$i"
	done
}
