# Maintainer: Darshit Shah <darnir@gmail.com>
# PKGBUILD based on original for mutt-hg by Loui Chang

_pkgname=mutt
pkgname="${_pkgname}-sidebar-hg"
pkgver=r6518.7aa4e6fc6884
pkgrel=1
pkgdesc="A small but very powerful text-based mail client"
url="http://www.mutt.org/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gdbm' 'libidn' 'mime-types' 'zlib' 'gpgme' 'ncurses')
#depends+=('openssl>=0.9.8e' 'libsasl')
makedepends=('mercurial' 'gnupg' 'libxslt')
conflicts=("${_pkgname}")
provides=("${_pkgname}")

# Names of the patch files. Updated when rebased against new changes
  _trashfolder="trashfolder.r6477.711708700602.diff"
  _sidebar="sidebar.r6477.711708700602.patch"
  _firstchar="patch-for-first-char-jf.patch"
  _shortpath="shortpath.patch"

source=('hg+http://dev.mutt.org/hg/mutt#branch=default'
        "$_trashfolder"
        "$_sidebar"
        "$_firstchar"
        "$_shortpath")

sha512sums=('SKIP'
            'b1b384a1bfa6b5b8024b0e37c313ed94343b43883461c94038cab80fffdb10506c4208cfa27f9b3f82ace6b44a7fafe21d0c7bc11f6457637fea3406936250e1'
            'f5b0c1607953df124fe835fdbcc8493cf67fc8bca55215d5609d31b19e9f144ba4a02b3abd8f4ec0404be9ea132a0c3e256d7b98b183835aa605bddce388d6be'
            '16ba918a8d5ef091cd7556e97189b43a0afdc1fc23a8bb9ece6a97281223090a5e680886233d2aa52e5340c402d19c68801b51eec13ae61cd8d301418470f11d'
            '9fe87a338090ac53856893f3392a6f94d5a855cff1338fb6d1a0ef8774e57b20e6a75212b43c266066fbaae7ff21978c8437aee2e601a20eaccadf6cb1425397')

pkgver() {
	cd "$srcdir/${_pkgname}"
	printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

prepare() {
  cd "$srcdir/${_pkgname}"

  # Ensure we are working in a clean environment
  hg revert --all
  hg purge --all

  # Patch to add trash folder support
  echo "Patching $_trashfolder"
  patch -Np1 -i "$srcdir"/$_trashfolder

  # Patch to add sidebar support
  echo "Patching $_sidebar"
  patch -Np1 -i "$srcdir"/$_sidebar

  # Patch for first char in mailboxdir
  echo "Patching $_firstchar"
  patch -i "$srcdir"/$_firstchar

  # Patch to fix shortpath
  echo "Patching $_shortpath"
  patch -i "$srcdir"/$_shortpath

  # fix automake issue
  autoreconf -vfi
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
		--with-regex
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

