# Maintainer: Vyacheslav Artemiev <artemiev.vyacheslav a gmail d com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

_pkgname=xdg-utils
pkgname=$_pkgname-slock
pkgver=1.1.1
pkgrel=1
pkgdesc="Command line tools that assist applications with a variety of desktop integration tasks; patched to support slock lockscreen"
arch=('any')
url="https://www.freedesktop.org/wiki/Software/xdg-utils/"
license=('MIT')
depends=('sh' 'xorg-xset') # xset needed inside xdg-screensaver
makedepends=('docbook-xsl' 'lynx' 'xmlto' 'git')
optdepends=('kde-cli-tools: for KDE Plasma5 support in xdg-open'
            'exo: for Xfce support in xdg-open'
            'xorg-xprop: for Xfce support in xdg-open'
            'pcmanfm: for LXDE support in xdg-open'
            'perl-file-mimeinfo: for generic support in xdg-open'
            'perl-net-dbus: Perl extension to dbus used in xdg-screensaver'
            'perl-x11-protocol: Perl X11 protocol used in xdg-screensaver')
provides=($_pkgname)
conflicts=($_pkgname)
source=(https://portland.freedesktop.org/download/$_pkgname-$pkgver.tar.gz
        support_for_KDE_Frameworks_5.6.diff
        slock_support.diff)
md5sums=('2d0aec6037769a5f138ff404b1bb4b15'
         'fc0a612362e00cc091d2c1ebbfbfc500'
         'eab28cbb6c84860c19fb2a1bf58b9a55')

prepare() {
	cd $_pkgname-$pkgver
	# fix wrong hardcoded chromium binary name - FS#50184
	sed -i "s:chromium-browser:chromium:" scripts/xdg-open.in

	# fix KDE support, FS#48668
	patch -Np1 -i $srcdir/support_for_KDE_Frameworks_5.6.diff
	# add slock lockscreen support
	patch -p1 -i ${srcdir}/slock_support.diff
}

build() {
	cd $_pkgname-$pkgver
	./configure --prefix=/usr --mandir=/usr/share/man
	make
}

package() {
	cd $_pkgname-$pkgver
	make DESTDIR="${pkgdir}" install
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	# install empty directory to prevent xdg-desktop-menu install *.desktop to fail, see FS#33316
	install -dm755 $pkgdir/usr/share/desktop-directories
}
