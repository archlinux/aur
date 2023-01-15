# Maintainer: Jacob Steffler <jacobsteffler@gmail.com>
# Contributor: Sébastien Luttringer <seblu@aur.archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: tobias <tobias@archlinux.org>
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org

pkgname=rxvt-unicode-pixbuf
_pkgname=${pkgname%-*}
pkgver=9.31
pkgrel=1
pkgdesc='Unicode enabled rxvt-clone terminal emulator (urxvt), with support for custom icons and backgrounds'
arch=('i686' 'x86_64')
url='http://software.schmorp.de/pkg/rxvt-unicode.html'
license=('GPL')
depends=('rxvt-unicode-terminfo' 'libxft' 'perl' 'startup-notification' 'gdk-pixbuf2' 'libptytty')
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
sha1sums=('44b31b4d9890aea4a6d66998bfb0c39e727fdf39'
		'8697f9fd671b627f95c9c2da73f9cba6a1df09fa'
		'f2903277e6a93cc2e77e5b0ae55167ba6576d0bd'
		'2cb8a93b546492afacd18ae5a4c01191aa4e80d9'
		'b376ae0ae3694a2a4baf1e9b7254f9525737a531'
		'b7fde1c46af45e831828738874f14b092b1e795f')

prepare() {
	cd $_pkgname-$pkgver

	patch -p0 -i ../font-width-fix.patch
	patch -p0 -i ../line-spacing-fix.patch
}

build() {
	cd $_pkgname-$pkgver

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
