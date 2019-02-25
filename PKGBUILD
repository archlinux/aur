# Maintainer: Arti Zirk <arti.zirk@gmail.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>

_pkgname=gnupg
pkgname=gnupg-scdaemon-shared-access
pkgver=2.2.13
pkgrel=1
pkgdesc='This package adds shared-access option that uses PCSC_SHARE_SHARED for pcsc_connect in scdaemon when using pcsc backend for smartcard access'
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
sha256sums=('76c787a955f9e6e0ead47c9be700bfb9d454f955a7b7c7e697aa719bac7b11d8'
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
