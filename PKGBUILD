# Maintainer: Sean Greenslade <aur at seangreenslade dot com>
# Contributor: Jon Gjengset
# Contributor: jsteel <mail at jsteel dot org>
# Contributor: andreas_baumann <abaumann at yahoo dot com>
# Contributor: tobias [tobias [at] archlinux.org]
# Contributor: Gaetan Bisson <bisson@archlinux.org>

_pkgbase=mutt
pkgname=${_pkgbase}-slang
pkgver=1.7.2
pkgrel=1
pkgdesc='Small but very powerful text-based mail client - slang version'
url='http://www.mutt.org/'
provides=('mutt')
conflicts=('mutt')
license=('GPL')
backup=('etc/Muttrc')
arch=('i686' 'x86_64')
optdepends=('smtp-forwarder: to send mail')
depends=('gpgme' 'slang' 'openssl' 'libsasl' 'gdbm' 'libidn' 'mime-types' 'krb5')
source=("http://ftp.mutt.org/pub/mutt/${_pkgbase}-${pkgver}.tar.gz"{,.asc})
sha512sums=('5f13cbdf802bca80668b2f54bc66201d01bfe34c7f377b1bad88f8fa0e0c695264ff0bf6b64ae9bb6f5a3e22b6f096d2dd99fa36724937609f6f46e6a74da74e'
            'SKIP')
validpgpkeys=('8975A9B33AA37910385C5308ADEF768480316BDA')

build() {
	cd "${srcdir}/${_pkgbase}-${pkgver}"
	./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--enable-gpgme \
		--enable-pop \
		--enable-imap \
		--enable-smtp \
		--enable-hcache \
		--enable-sidebar \
		--with-slang=/usr \
		--with-regex \
		--with-gss=/usr \
		--with-ssl=/usr \
		--with-sasl \
		--with-idn \

	make
}

package() {
	cd "${srcdir}/${_pkgbase}-${pkgver}"
	make DESTDIR="${pkgdir}" install

	rm "${pkgdir}"/etc/mime.types{,.dist}
	rm "${pkgdir}"/usr/bin/{flea,muttbug}
	rm "${pkgdir}"/usr/share/man/man1/{flea,muttbug}.1
	install -Dm644 contrib/gpg.rc "${pkgdir}"/etc/Muttrc.gpg.dist
}
