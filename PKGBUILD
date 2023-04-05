# Maintainer: BlackCatDevel0per <bcdev@mail.ru>
# https://github.com/BlackCatDevel0per

# Based on xdg-utils-slock aur package patch =)

# Contributor: Vyacheslav Artemiev <artemiev.vyacheslav a gmail d com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

_pkgname=xdg-utils
pkgname=$_pkgname-betterlockscreen
pkgver=1.1.3
pkgrel=1
pkgdesc="Command line tools that assist applications with a variety of desktop integration tasks; patched to support betterlockscreen lockscreen"
arch=('any')
url="https://www.freedesktop.org/wiki/Software/xdg-utils/"
license=('MIT')
depends=('sh' 'xorg-xset') # xset needed inside xdg-screensaver
makedepends=('docbook-xsl' 'lynx' 'xmlto' 'git')
optdepends=('exo: for Xfce support in xdg-open'
            'xorg-xprop: for Xfce support in xdg-open'
            'pcmanfm: for LXDE support in xdg-open'
            'pcmanfm-qt: for LXQT support in xdg-open'
            'perl-file-mimeinfo: for generic support in xdg-open'
            'perl-net-dbus: Perl extension to dbus used in xdg-screensaver'
            'perl-x11-protocol: Perl X11 protocol used in xdg-screensaver')
provides=($_pkgname)
conflicts=($_pkgname)
source=(https://portland.freedesktop.org/download/$_pkgname-$pkgver.tar.gz
        betterlockscreen_support.diff)
md5sums=('902042508b626027a3709d105f0b63ff'
         '067a758be11018efd8f6a3644adfc7821453299fda7c0d7e24adc366b40b4e18')

prepare() {
	cd $_pkgname-$pkgver
	# fix wrong hardcoded chromium binary name - FS#50184
	sed -i "s:chromium-browser:chromium:" scripts/xdg-open.in

	# add betterlockscreen lockscreen support
	patch -p1 -i ${srcdir}/betterlockscreen_support.diff
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
