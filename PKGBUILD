# Maintainer: Jacob Steffler <jacobsteffler@gmail.com>
# Contributor: Sébastien Luttringer <seblu@aur.archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: tobias <tobias@archlinux.org>
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org

pkgname=rxvt-unicode-pixbuf
_pkgname=${pkgname%-*}
pkgver=9.32
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
		'urxvt-tabbed.desktop'
		'urxvt.desktop'
		'urxvtc.desktop'
		'font-width-fix.patch'
		'line-spacing-fix.patch'
)
sha256sums=(
		'2f81c16bffb16f97c4633032e08a7ef08c000f81eb05853e950febc6c33328dd'
		'ccd7c436e959bdc9ab4f15801a67c695b382565b31d8c352254362e67412afcb'
		'5f9c435d559371216d1c5b49c6ec44bfdb786b12d925d543c286b0764dea0319'
		'91536bb27c6504d6cb0d33775a0c4709a4b439670b900f0c278c25037f19ad66'
		'de6739b96e5c9f7b3170ca8c9164825c45f47b4769974367584832d80ba612d4'
		'9f34b61203d895c503d10ec790a77b6ccb09ffa8f9127f0faeabc3c82145d844'
)

prepare() {
	cd $_pkgname-$pkgver

	patch -p0 -i ../font-width-fix.patch
	patch -p0 -i ../line-spacing-fix.patch
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
