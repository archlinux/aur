# Maintainer: Darshit Shah <darnir@gmail.com>
# PKGBUILD based on original for mutt-hg by Loui Chang

_pkgname=mutt
pkgname="${_pkgname}-sidebar-hg"
pkgver=r6559.909cf6dd067c
pkgrel=1
pkgdesc="Mutt-hg package with sidebar patches"
url="http://www.mutt.org/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gdbm' 'libidn' 'mime-types' 'zlib' 'gpgme' 'ncurses')
#depends+=('openssl>=0.9.8e' 'libsasl')
makedepends=('mercurial' 'gnupg' 'libxslt')
conflicts=("${_pkgname}")
provides=("${_pkgname}")

# Names of the patch files. Updated when rebased against new changes

  _trashfolder="0001-Add-Trashfolder-support-to-Mutt.patch"
  _sidebar="0002-Add-support-for-sidebars-in-Mutt.patch"
  _firstchar="0003-Patch-for-first-char-jf.patch"
  _shortpath="0004-Shortpath-support.patch"

source=('hg+http://dev.mutt.org/hg/mutt#branch=default'
        "$_trashfolder"
        "$_sidebar"
        "$_firstchar"
        "$_shortpath")

sha512sums=('SKIP'
            'f68dea0e8c8e82ca3bc5ec413296b5f8350c4fb5ddf158f21ad79e832c4b22d064cf9267545980d5c163bfba6189843602674d6cc9e28dc8b59bf7168e6eb2b6'
            '65fabddbd00053d52a5c11dd8b35d001fe225d8f79288cb86ee38b1e22916422ae383d8958eb7375f9cf7e4c8f1b5532773aae7dbaaddf002ccd2c0b0a8266d5'
            '189801bb5bdf203f49f659574c9e2c4628d590f5a0fcf8985b2f87f817ba1f98b352c8f0b96e1ce1b07dcfcb0c2d25ee57baacc4395ab9ca5c70f6650bd6d620'
            '6cb4dba5d2d1f17be6e41557c910925f3b7254110e285f783b17c716540a44b6bb5bc49536a78561de93fe643341830702a544703cdd407e08b978e7c15dcd0d')

pkgver() {
	cd "$srcdir/${_pkgname}"
	printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

prepare() {
  cd "$srcdir/${_pkgname}"

  # Ensure we are working in a clean environment
  hg revert --all
  hg update -C

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

