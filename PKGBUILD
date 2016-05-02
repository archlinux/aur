# Maintainer: Darshit Shah <darnir@gmail.com>
# PKGBUILD based on original for mutt-hg by Loui Chang

_pkgname=mutt
pkgname="${_pkgname}-sidebar-hg"
pkgver=r6643+.fb68199318ae+
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
  _sidebar="0002-Add-Sidebar-support-to-Mutt.patch"
  _firstchar="0003-Patch-for-first-char-jf.patch"
  _shortpath="0004-Shortpath-support.patch"

source=('hg+http://dev.mutt.org/hg/mutt#branch=default'
        "$_trashfolder"
        "$_sidebar"
        "$_firstchar"
        "$_shortpath")

sha512sums=('SKIP'
            '68d6f166dcb079c2578746e3bc28d4e85a24168e0bd0a83329a431bac2d40eb6eb6853b26abf1cb1cd011df0861c4c34cdcdfda2e9a817eb1d8a9fe394d33fac'
            'f03a357e75d68a7ca7988f2f323c98391de0d4ca778ad44874bc89d59b128b42e3376c74f82f4aa0ca755be7bae876cb2c7e5ebd6e61580da2263591d9a7d39f'
            '337bbf616b6530c27ed73e946a09850e0b1337bd39cfd997399353b1d067e9079585171668da759eed9ae9a439330a7fa83cda46cbe54b50a438fa18d05261dc'
            'bf33d25ca67287612ecde00aba0d857ded34e204f8dad1a58b4fb0a6646266d5570fd60995d17c0adbccb5bd8fc3ae89e3515fd3f0bb8ed020c916bec1708d64')

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

