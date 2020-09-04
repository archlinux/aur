# Maintainer: Arti Zirk <arti.zirk@gmail.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>

_pkgname=gnupg
pkgname=gnupg-scdaemon-shared-access
pkgver=2.2.23
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
              '5B80C5754298F0CB55D8ED6ABCEF7E294B092E28'
              '6DAA6E64A76D2840571B4902528897B826403ADA')
source=("https://gnupg.org/ftp/gcrypt/${_pkgname}/${_pkgname}-${pkgver}.tar.bz2"{,.sig}
        'drop-import-clean.patch'
        'avoid-beta-warning.patch'
        'do-not-rebuild-defsincdate.patch'
        "scdaemon_shared-access.patch")
sha256sums=('10b55e49d78b3e49f1edb58d7541ecbdad92ddaeeb885b6f486ed23d1cd1da5c'
            'SKIP'
            '02d375f0045f56f7dd82bacdb5ce559afd52ded8b75f6b2673c39ec666e81abc'
            '22fdf9490fad477f225e731c417867d9e7571ac654944e8be63a1fbaccd5c62d'
            'bb4dcba0328af6271ccfe992a64d8daa9f0a691ba52978491647f1dea05675ee'
            'aa46b372830dd8ed355a86a1677c50c6be8178f847c09b7291f47a1dc3ea02dc')

install=install

conflicts=('gnupg' 'dirmngr' 'gnupg2')
provides=('gnupg' 'dirmngr' "gnupg=${pkgver}" "gnupg2=${pkgver}")

prepare() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	patch -p1 -i ../scdaemon_shared-access.patch
	patch -p1 -i ../avoid-beta-warning.patch
	patch -p1 -i ../drop-import-clean.patch

	# improve reproducibility
	patch -p1 -i ../do-not-rebuild-defsincdate.patch
	rm doc/gnupg.info*

	./autogen.sh
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
