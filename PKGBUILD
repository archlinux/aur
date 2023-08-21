# Maintainer: Jacob Steffler <jacobsteffler@gmail.com>
# Contributor: Sébastien Luttringer <seblu@aur.archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: tobias <tobias@archlinux.org>
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org

pkgname=rxvt-unicode-pixbuf
_pkgname=${pkgname%-*}
pkgver=9.31
pkgrel=4
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
		'urxvt-tabbed.desktop'
		'urxvt.desktop'
		'urxvtc.desktop'
		'font-width-fix.patch'
		'line-spacing-fix.patch'
		'perl-5.38.patch')
sha256sums=(
		'aaa13fcbc149fe0f3f391f933279580f74a96fd312d6ed06b8ff03c2d46672e8'
		'ccd7c436e959bdc9ab4f15801a67c695b382565b31d8c352254362e67412afcb'
		'5f9c435d559371216d1c5b49c6ec44bfdb786b12d925d543c286b0764dea0319'
		'91536bb27c6504d6cb0d33775a0c4709a4b439670b900f0c278c25037f19ad66'
		'b408a7b5319d93b540c4f8a19186b9a282fb465f54f32f6812970c966a270c25'
		'546a388d0595404a59c71c3eaeba331031032a75f96c57e9a860f27bbd7ebfcc'
		'4bec0bf559a2eb6649e077b220fe25f532a8bc3da98ac519bc72a39b223e2cc4'
)

prepare() {
	cd $_pkgname-$pkgver

	patch -p0 -i ../font-width-fix.patch
	patch -p0 -i ../line-spacing-fix.patch
	patch -p1 -i ../perl-5.38.patch
}

build() {
	cd $_pkgname-$pkgver

	# disable smart-resize (FS#34807)
	# do not specify --with-terminfo (FS#46424)

	#We use the rxvt-unicode-terminfo package from extra, silently do nothing:
	export TIC="/usr/bin/true"

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

	make DESTDIR="$pkgdir" install

	# install the tabbing wrapper ( requires gtk2-perl! )
	sed -i 's/\"rxvt\"/"urxvt"/' doc/rxvt-tabbed
	install -Dm 755 doc/rxvt-tabbed "$pkgdir/usr/bin/urxvt-tabbed"
}
