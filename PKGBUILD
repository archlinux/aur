# Maintainer: Arti Zirk <arti.zirk@gmail.com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>

_pkgname=gnupg
pkgname=gnupg-scdaemon-shared-access
pkgver=2.2.27
pkgrel=1
pkgdesc='This package adds shared-access option that uses PCSC_SHARE_SHARED for pcsc_connect in scdaemon when using pcsc backend for smartcard access'
url='https://www.gnupg.org/'
license=('GPL')
arch=('x86_64')
checkdepends=('openssh')
makedepends=('libldap' 'libusb-compat' 'pcsclite')
depends=('npth' 'libgpg-error' 'libgcrypt' 'libksba' 'libassuan' 'pinentry'
         'bzip2' 'libbz2.so' 'readline' 'libreadline.so' 'gnutls' 'sqlite'
         'zlib' 'glibc')
optdepends=('libldap: gpg2keys_ldap'
            'libusb-compat: scdaemon'
            'pcsclite: scdaemon')
validpgpkeys=(
	'D8692123C4065DEA5E0F3AB5249B39D24F25E3B6' # Werner Koch (dist sig)
	'031EC2536E580D8EA286A9F22071B08A33BD3F06' # NIIBE Yutaka (GnuPG Release Key) <gniibe@fsij.org>
	'5B80C5754298F0CB55D8ED6ABCEF7E294B092E28' # Andre Heinecke (Release Signing Key)
	'6DAA6E64A76D2840571B4902528897B826403ADA' # Werner Koch (dist signing 2020)
)
source=("https://gnupg.org/ftp/gcrypt/${_pkgname}/${_pkgname}-${pkgver}.tar.bz2"{,.sig}
        'drop-import-clean.patch'
        'avoid-beta-warning.patch'
        "scdaemon_shared-access.patch")
sha256sums=('34e60009014ea16402069136e0a5f63d9b65f90096244975db5cea74b3d02399'
            'SKIP'
            '02d375f0045f56f7dd82bacdb5ce559afd52ded8b75f6b2673c39ec666e81abc'
            '22fdf9490fad477f225e731c417867d9e7571ac654944e8be63a1fbaccd5c62d'
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

	install -Dm 644 doc/examples/systemd-user/*.* -t "${pkgdir}/usr/lib/systemd/user"
}

