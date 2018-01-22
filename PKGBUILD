# Maintainer: Chih-Hsuan Yen (a.k.a. Yen Chi Hsuan) <yan12125@gmail.com>
# This package is modified from official xdg-utils package. Below is original maintainer information:
# $Id$
# Maintainer: Andreas Radke <andyrtr@archlinux.org>
# Maintainer: Jan de Groot <jgc@archlinux.org>

_pkgname=xdg-utils
pkgname=$_pkgname-lxqt-issue1298
pkgver=1.1.2
pkgrel=2
pkgdesc="Command line tools that assist applications with a variety of desktop integration tasks. With an LXQt patch to fix xdg-open misbehavior on LXQt"
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
source=(https://portland.freedesktop.org/download/$_pkgname-$pkgver.tar.gz
        lxqt-issue1298.patch::https://github.com/luis-pereira/xdg-utils/commit/dbf58e9fd8c5e2089a13522d87d2e660e159b8e2.patch)
sha1sums=('20cd4cc5cfaa904b12abf6d584deb568367f4d83'
          '2268c2ee0fbe1a6a2b1425fce02e38eadfb7883d')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")

prepare() {
	cd $_pkgname-$pkgver

	patch -Np1 -i ../lxqt-issue1298.patch
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
