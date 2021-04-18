# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# PREVIOUS Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# PREVIOUS Maintainer: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve>
# Contributor: AqD <aquila.deus@gmail.com>
# Contributor: TheMadsen <arch@themadsens.dk>

pkgname=rapidsvn
pkgver=0.12.1
pkgrel=16
pkgdesc="A cross-platform GUI front-end for the Subversion revision system written in C++ using the wxWidgets framework."
url='https://rapidsvn.org/'
arch=('x86_64')
license=('GPL')
depends=('subversion' 'wxgtk3')
makedepends=('python2' 'doxygen')
source=(https://rapidsvn.org/download/release/$pkgver/rapidsvn-$pkgver.tar.gz
	$pkgname.desktop
	rapidsvn-wx3.0.patch
	rapidsvn-subversion1.9.patch
	rapidsvn-add-svncpp.dox.diff
	rapidsvn-locale-build.diff
	rapidsvn-link-libs.diff)
md5sums=('8de3ca6da3ef6a27d59f959d1bbcd96b'
         '349e6d9729f88868902611bb1172f134'
         '44cdc7e987496e9e331f3dd5b5a871d4'
         '0ffd1fd1fed7ff53578afe92730c80bc'
         'e41f470f97fd721600030cebcc17bb3b'
         '9fc75740d9b067448500be140a5a30cf'
         '5ed33e98f5c87e92362a24acb8d20671')

prepare() {
	cd $srcdir/$pkgname-$pkgver

	# Fix assertion at startup
	sed -e '/SetMaxLength(0)/d' -i src/rapidsvn_frame.cpp \
		-i src/report_dlg.cpp

	# Fix build with WxGTK 3 (Debian)
	patch -p1 -i ../rapidsvn-wx3.0.patch

	# Fix build with subversion 1.9 (Debian)
	patch -p1 -i ../rapidsvn-subversion1.9.patch

	# Fix build adding missing svncpp.dox (Debian)
	patch -p1 -i ../rapidsvn-add-svncpp.dox.diff

	# Fix build v/v wrong conditional (Debian)
	patch -p1 -i ../rapidsvn-locale-build.diff

	# Fix build v/v linking libsvncpp w/ dep/ libs (Debian)
	patch -p1 -i ../rapidsvn-link-libs.diff
}

build() {
	cd $srcdir/$pkgname-$pkgver

	autoreconf -vi

	export CPPFLAGS+=' -DNDEBUG' # https://bugs.archlinux.org/task/52696

	sed -i 's#src/tests/svncpp/Makefile##' configure
	[ "$NOEXTRACT" == 1 ] || ./configure --prefix=/usr \
	--with-apu-config="`which apu-1-config`" \
	--with-apr-config="`which apr-1-config`" \
	--with-wx-config=/usr/bin/wx-config-gtk3

	sed -i 's|/usr/bin/env python|/usr/bin/env python2|' tools/*.py

	sed -i 's|python|python2|' src/locale/Makefile

	make -k
}

package() {
	cd $srcdir/$pkgname-$pkgver

	make DESTDIR=$pkgdir install

	install -Dm644 src/res/bitmaps/rapidsvn_32x32.xpm \
		"$pkgdir/usr/share/pixmaps/rapidsvn_32x32.xpm"
	install -Dm644 ../$pkgname.desktop \
		"$pkgdir/usr/share/applications/$pkgname.desktop"
}
