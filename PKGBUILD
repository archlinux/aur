# Maintainer: Arti Zirk <arti.zirk@gmail.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>

_pkgname=gnupg
pkgname=gnupg-scdaemon-shared-access
pkgver=2.2.11
pkgrel=1
pkgdesc='Complete and free implementation of the OpenPGP standard'
url='https://www.gnupg.org/'
license=('GPL')
arch=('x86_64')
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
              'D238EA65D64C67ED4C3073F28A861B1C7EFD60D9')
source=("https://gnupg.org/ftp/gcrypt/${_pkgname}/${_pkgname}-${pkgver}.tar.bz2"{,.sig}
        "scdaemon_shared-access.patch")
sha256sums=('496c3e123ef53f35436ddccca58e82acaa901ca4e21174e77386c0cea0c49cd9'
            'SKIP'
            '877ca0b8abcb6d1263bf40f3e9aa66b754a9957943ae2de591dfa42a1b21b7cf')

install=install

conflicts=('gnupg' 'dirmngr' 'gnupg2')
provides=('gnupg' 'dirmngr' "gnupg=${pkgver}" "gnupg2=${pkgver}")

prepare() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	sed '/noinst_SCRIPTS = gpg-zip/c sbin_SCRIPTS += gpg-zip' -i tools/Makefile.in
	patch -p1 -t -N < "${srcdir}/scdaemon_shared-access.patch"
}

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--sbindir=/usr/bin \
		--libexecdir=/usr/lib/gnupg \
		--enable-maintainer-mode \
		--enable-symcryptrun \

	make
}

check() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	make check
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
	ln -s gpg "${pkgdir}"/usr/bin/gpg2
	ln -s gpgv "${pkgdir}"/usr/bin/gpgv2

	cd doc/examples/systemd-user
	for i in *.*; do
		install -Dm644 "$i" "${pkgdir}/usr/lib/systemd/user/$i"
	done
}
