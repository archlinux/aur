# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Stephanie Wilde-Hobbs <git@stephanie.is>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: alphazo@gmail.com
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>
# Contributor: @holos

_pkgname=gnupg
pkgname=${_pkgname}-minimal-git
pkgver=2.2.7+1227+gf9bbc7516
pkgrel=1
pkgdesc='Complete and free implementation of the OpenPGP standard'
url='https://www.gnupg.org/'
license=('GPL')
arch=('x86_64')
conflicts=(${_pkgname})
provides=(${_pkgname}=2.2)
checkdepends=('openssh')
makedepends=('git')
depends=('npth' 'libgpg-error' 'libgcrypt' 'libksba' 'libassuan'
         'bzip2' 'readline' 'libreadline.so' 'gnutls'
         'sqlite' 'zlib' 'glibc')
optdepends=('libldap: gpg2keys_ldap'
            'libusb-compat: scdaemon'
            'pcsclite: scdaemon')
source=("git://git.gnupg.org/gnupg.git"
        'drop-import-clean.patch')
sha256sums=('SKIP'
            '7ae777b0f4c6d3301768149f66f1d5b723841f3a4a2f0d4c601a0b2114bb7fe1')
install=gnupg-git.install

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --tags | sed 's/gnupg-//;s/-/+/g'
}

prepare() {
	cd "${srcdir}/${_pkgname}"
#	patch -p1 -i ../drop-import-clean.patch

	./autogen.sh
}

build() {
	cd "${srcdir}/${_pkgname}"
	./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--sbindir=/usr/bin \
		--libexecdir=/usr/lib/gnupg \
		--enable-maintainer-mode \
		--enable-symcryptrun \
		--disable-selinux-support \
		--disable-photo-viewers \
		--without-photo-viewer \
		--disable-card-support \
		--disable-ccid-driver \
		--disable-npth-debug \
		--disable-ldap \
		--without-mailprog \
		--disable-log-clock \
		--disable-doc \
		--disable-scdaemon \


	make
}

# check() {
# 	cd "${srcdir}/${_pkgname}"
# 	make check
# }

package() {
	cd "${srcdir}/${_pkgname}"
	make DESTDIR="${pkgdir}" install
	ln -s gpg "${pkgdir}"/usr/bin/gpg2
	ln -s gpgv "${pkgdir}"/usr/bin/gpgv2

	install -Dm 644 doc/examples/systemd-user/*.* -t "${pkgdir}/usr/lib/systemd/user"
}

# vim: ts=2 sw=2 noet:
