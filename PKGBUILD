# Contributor: Loui Chang <base64: bG91aXBjLmlzdEBnbWFpbC5jb20=>

_pkgname=mutt
pkgname="${_pkgname}-hg"
pkgver=r6454.17a4f92e4a95
pkgrel=1
pkgdesc="A small but very powerful text-based mail client"
url="http://www.mutt.org/"
arch=(i686 x86_64)
license=('GPL')
depends=('gdbm' 'libidn' 'mime-types' 'zlib' 'gpgme' 'ncurses')
#depends+=('openssl>=0.9.8e' 'libsasl')
makedepends=('mercurial' 'gnupg' 'libxslt')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
options=('!strip')
source=('hg+http://dev.mutt.org/hg/mutt#branch=default')
md5sums=(SKIP)

pkgver() {
	cd "$srcdir/${_pkgname}"
	printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
	cd ${srcdir}/${_pkgname}

    # Mutt should be used with external MTAs
    # Uncomment relevant build parameters if you want to use the builtin MTA
    # Remember to adjust dependencies.
	./prepare \
		--prefix=/usr \
		--sysconfdir=/etc \
		--enable-debug \
		--enable-hcache \
		--enable-gpgme \
		--enable-pgp \
		--with-idn \
		--with-regex \
#		--enable-imap \
#		--enable-pop \
#		--enable-smtp \
#		--with-sasl \
#		--with-ssl=/usr \


	make
}

package() {
	cd ${srcdir}/${_pkgname}

	make DESTDIR=${pkgdir} install
	rm -f ${pkgdir}/etc/mime.types*
	install -Dm644 contrib/gpg.rc ${pkgdir}/etc/Muttrc.gpg.dist
}

