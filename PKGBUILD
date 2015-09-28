# Maintainer: Jacob Steffler <jacobsteffler@gmail.com>
# Contributor: Sébastien Luttringer <seblu@aur.archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: tobias <tobias@archlinux.org>
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org

_pkgname=rxvt-unicode
pkgname=rxvt-unicode-pixbuf
pkgver=9.21
pkgrel=4
pkgdesc='Unicode enabled rxvt-clone terminal emulator (urxvt), with support for custom icons and backgrounds'
arch=('i686' 'x86_64')
url='http://software.schmorp.de/pkg/rxvt-unicode.html'
license=('GPL')
depends=('rxvt-unicode-terminfo' 'libxft' 'perl' 'startup-notification' 'gdk-pixbuf2')
optdepends=('gtk2-perl: to use the urxvt-tabbed')
provides=('rxvt-unicode')
conflicts=('rxvt-unicode')
source=(
"http://dist.schmorp.de/rxvt-unicode/$_pkgname-$pkgver.tar.bz2"
'urxvt.desktop'
'urxvtc.desktop'
'urxvt-tabbed.desktop'
'font-width-fix.patch'
'line-spacing-fix.patch')
md5sums=('a9a06c608258c5fd247c3725d8f44582'
         'fec94dc986fa37ec380079d81de3e0b2'
         'fac55f0a8404c86dad3e702146762332'
         '8a5599197568c63720e282b9722a7990'
         'df0c3a8b6bb0578d1b91e4081c47881c'
         'd4e03127a0d3bbf2e173850770651b08')

build() {
	cd $_pkgname-$pkgver

	patch -p0 -i ../font-width-fix.patch
	patch -p0 -i ../line-spacing-fix.patch

	# disable smart-resize (FS#34807)
	# do not specify --with-terminfo (FS#46424)
	./configure \
		--prefix=/usr \
		--enable-256-color \
		--enable-combining \
		--enable-fading \
		--enable-font-styles \
		--enable-iso14755 \
		--enable-keepscrolling \
		--enable-lastlog \
		--enable-mousewheel \
		--enable-next-scroll \
		--enable-perl \
		--enable-pointer-blank \
		--enable-rxvt-scroll \
		--enable-selectionscrolling \
		--enable-slipwheeling \
		--disable-smart-resize \
		--enable-startup-notification \
		--enable-transparency \
		--enable-unicode3 \
		--enable-utmp \
		--enable-wtmp \
		--enable-xft \
		--enable-xim \
		--enable-xterm-scroll \
		--enable-pixbuf \
		--disable-frills
	make
}

package() {
	# install freedesktop menu
	for _f in urxvt urxvtc urxvt-tabbed; do
		install -Dm644 $_f.desktop "$pkgdir/usr/share/applications/$_f.desktop"
	done

	cd $_pkgname-$pkgver

	# workaround terminfo installation
	export TERMINFO="$srcdir/terminfo"
	install -d "$TERMINFO"
	make DESTDIR="$pkgdir" install

	# install the tabbing wrapper ( requires gtk2-perl! )
	sed -i 's/\"rxvt\"/"urxvt"/' doc/rxvt-tabbed
	install -Dm 755 doc/rxvt-tabbed "$pkgdir/usr/bin/urxvt-tabbed"
}
