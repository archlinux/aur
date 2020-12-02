# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Jelle van der Waa <jelle@vdwaa.nl>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Daniel J Griffiths <griffithsdj@archlinux.us>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Marc poiroud <marci1 AT archlinux.fr>
_projectname='recordMyDesktop'
_reponame="${_projectname,,}"
pkgname="qt-$_reponame"
_pkgver='0.3.8'
_commit='r602'
pkgver="$_pkgver.$_commit"
pkgrel='5'
pkgdesc='Qt4 frontend for recordMyDesktop'
arch=('any')
url="http://$_reponame.sourceforge.net"
license=('GPL3' 'LGPL3')
depends=('python' 'python-pyqt4>=4.1.0' 'qt4>=4.2.0' "$_reponame>=0.3.8.1" 'xorg-xwininfo')
makedepends=('autoconf' 'automake>=1.5.0')
source=(
	"$pkgname-$pkgver-$pkgrel.tar.gz::https://downloads.sourceforge.net/project/$_reponame/qt-$_projectname/$_pkgver/$pkgname-$_pkgver.tar.gz"
	'autogen.sh'
	'messages.pot'
	'r602.diff'
	'python3-port.diff'
	'hebrew.diff'
	'translations1.diff'
	'translations2.diff'
	'typos.diff'
)
sha256sums=('84e43332ea1974edd8da3edb67456e57a40d3083a23c8d19d8f76b098a226f61'
            'ec5705e85a156f1cc8fde6071a2342571469d56c61fefd8173ff9e5196527781'
            'b52e5afa7c223e9d084682a3b8587bfabedfab534911ad031a81a74b85854eff'
            '1f5fde05a6ecba938d5daa3d7878baa28848f8d96509509686ce3a04864a3d63'
            '9597526e04e6c90072b194ff95b87fd3109888c013b04063b14743a140fa7bab'
            'e2aebeeccadcf031be77ca91ae658a863ec096c3304965757c27feafdbbb26d9'
            '175a326c3057516a0c84b6094070d98e226e2e17f3a6acaca9eedb06ebb7ffca'
            '7292926c3da5f4cd99b81a007399f9f94ace0ea9686fcec94db63d55dd58c924'
            '2d3c958cc40774bbb00831db4af06f4eeedcbadf12aee09104029dd61ef85fed')

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

	# https://sourceforge.net/p/recordmydesktop/svn/602/
	patch --forward -p2 < "$srcdir/r602.diff"

	# mix of 2to3 output and the port done by the Mageia folks - http://sophie.zarb.org/rpms/a9bbcbd5892495675eb0bb36409f15e9/files/3
	patch --forward -p2 < "$srcdir/python3-port.diff"

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
	./configure --prefix '/usr'
	make
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	make DESTDIR="$pkgdir" install
}
