# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
# Contributor: Jelle van der Waa <jelle@vdwaa.nl>
# Contributor: Daniel J Griffiths <griffithsdj@archlinux.us>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
_projectname='recordMyDesktop'
_reponame="${_projectname,,}"
pkgname="gtk-$_reponame"
_pkgver='0.3.8'
_commit='r602'
pkgver="$_pkgver.$_commit"
pkgrel='1'
pkgdesc='GTK2 frontend for recordMyDesktop'
arch=('any')
url="http://$_reponame.sourceforge.net"
license=('GPL3' 'LGPL3')
depends=('gtk2' 'python2>=2.4.0' 'pygtk>=2.10.0' "$_reponame>=0.3.8.1" 'xorg-xwininfo')
makedepends=('autoconf' 'automake>=1.5.0')
source=(
	"$pkgname-$pkgver-$pkgrel.tar.gz::https://downloads.sourceforge.net/project/$_reponame/gtk-$_projectname/$_pkgver/$pkgname-$_pkgver.tar.gz"
	'autogen.sh'
	'messages.pot'
	'r600.diff'
	'r602.diff'
	'selectwindowfix.diff'
	'jack_lsp-check.diff'
	'hebrew.diff'
	'translations1.diff'
	'translations2.diff'
	'typos.diff'
)
sha256sums=('61ad43a6e4f0bf86d8553f03297e4b1b137b47337fa150ce1da8c24494ca8326'
            '8e740b166328e1ae1261b7e800ebd6053579dd86dd10e3ac1570631a77c01203'
            'b52e5afa7c223e9d084682a3b8587bfabedfab534911ad031a81a74b85854eff'
            'c91fb1fcc6bb80e33ec811a59800b398ab265a0092221c8812547b6051ddfc02'
            '1f7e67e96a1b6d665f9fdfb35b68d6b94c08b72553f510522c460bf1cc8487b5'
            'e90cdf392e8b8233022849cd501cd2f5ef3fea1bcad3486427cf34ad38e8105f'
            '0d2d5397a288f7c57c9903984f56a5c595c103984903a1008009a42911feb95b'
            'd7381d7db060075656db6f94e49f9e274a6cfc2c28996a7f051db0dbffa14ec7'
            '05590ddb54a80957b069d2758a1b08f964364b4f83e835c0de0038e2fdf4cd84'
            '810848f1cbf068bfef60d766369a5cca23672dec5f83a48d672e1146b7017f63'
            '4ad1eb383cf60157d670f92c48f54ad0f22860bd64a02f634249802b210f3da5')

_sourcedirectory="$pkgname-$_pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# get the files into the state that we would get by downloading a commit snapshot
	# if SourceForge worked properly

	rm -r \
		'aclocal.m4' \
		'configure' \
		'install-sh' \
		'Makefile.in' \
		'missing' \
		'py-compile' \
		'm4/Makefile.in' \
		'src/Makefile.in' \
		'src/rmdConfig.py'

	cp '../messages.pot' 'po/messages.pot'
	cp '../autogen.sh' 'autogen.sh'

	chmod +x 'autogen.sh'

	sed -i 's|#!/usr/bin/python$|#!/usr/bin/env python2.7|g' "src/gtk-$_projectname.in"

	# https://sourceforge.net/p/recordmydesktop/svn/600/
	patch --forward -p2 < "$srcdir/r600.diff"

	# https://sourceforge.net/p/recordmydesktop/svn/602/
	patch --forward -p2 < "$srcdir/r602.diff"

	# https://sources.debian.org/src/gtk-recordmydesktop/0.3.8-4.1/debian/patches/selectwindow.patch/
	patch --forward -p2 < "$srcdir/selectwindowfix.diff"

	# https://sources.debian.org/src/gtk-recordmydesktop/0.3.8-4.1/debian/patches/add-which-check-for-jack_lsp.patch/
	patch --forward -p2 < "$srcdir/jack_lsp-check.diff"

	# https://sources.debian.org/src/gtk-recordmydesktop/0.3.8-4.1/debian/patches/pofiles.patch/
	patch --forward -p2 < "$srcdir/hebrew.diff"

	# https://sources.debian.org/src/gtk-recordmydesktop/0.3.8-4.1/debian/patches/update-translations.patch/
	patch --forward -p2 < "$srcdir/translations1.diff"
	patch --forward -p2 < "$srcdir/translations2.diff"

	# https://bazaar.launchpad.net/~ubuntu-branches/ubuntu/trusty/gtk-recordmydesktop/trusty/view/head:/debian/patches/fix_typos.patch
	patch --forward -p2 < "$srcdir/typos.diff"
}

build() {
	cd "$srcdir/$_sourcedirectory/"

	./autogen.sh
	PYTHON='/usr/bin/python2.7' ./configure --prefix '/usr'
	make
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	make DESTDIR="$pkgdir" install
}
