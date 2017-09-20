# GnuPG2 GIT version
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: alphazo@gmail.com
# Based on official package
# Cleanup from @holos

_gitname=gnupg
pkgname=gnupg-git
pkgver=2.2.0+12+g9f5e50e7c
pkgrel=1
pkgdesc='Complete and free implementation of the OpenPGP standard - development'
url="http://www.gnupg.org/"
license=('GPL')
arch=('i686' 'x86_64')
optdepends=('libldap: gpg2keys_ldap'
            'libusb-compat: scdaemon')
makedepends=('git' 'libldap' 'libusb-compat')
checkdepends=('openssh')
depends=('npth-git' 'libgpg-error-git' 'libgcrypt-git' 'libksba' 'libassuan-git'
         'pinentry' 'bzip2' 'readline' 'gnutls' 'sqlite')
provides=("gnupg=${pkgver}" 'dirmngr')
conflicts=('gnupg2' 'gnupg' 'dirmngr')
install=${pkgname}.install
source=("git://git.gnupg.org/gnupg.git")
sha1sums=('SKIP')

pkgver() {
	cd "$_gitname"
	git describe --tags | sed 's/gnupg-//;s/-/+/g'
}

prepare() {
	cd "${_gitname}"
    ./autogen.sh
	sed '/noinst_SCRIPTS = gpg-zip/c sbin_SCRIPTS += gpg-zip' -i tools/Makefile.in
}

build() {
	cd "${_gitname}"
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
	cd "${_gitname}"
	make check
}

package() {
	cd "${_gitname}"
	make DESTDIR="${pkgdir}" install
	ln -s gpg "${pkgdir}"/usr/bin/gpg2
	ln -s gpgv "${pkgdir}"/usr/bin/gpgv2

	cd doc/examples/systemd-user
	for i in *.*; do
		install -Dm644 "$i" "${pkgdir}/usr/lib/systemd/user/$i"
	done
}
