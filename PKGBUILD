pkgname=xdg-utils-custom-open
_pkgname=xdg-utils
pkgver=1.1.2
pkgrel=4
pkgdesc="Command line tools that assist applications with a variety of desktop integration tasks"
arch=('any')
url="http://www.freedesktop.org/wiki/Software/xdg-utils/"
license=('MIT')
depends=('sh' 'xorg-xset' 'xdg-open-impl') # xset needed inside xdg-screensaver
makedepends=('docbook-xsl' 'lynx' 'xmlto' 'git')
provides=('xdg-utils')
conflicts=('xdg-utils')
source=(https://portland.freedesktop.org/download/$_pkgname-$pkgver.tar.gz)
sha1sums=('20cd4cc5cfaa904b12abf6d584deb568367f4d83')

prepare(){
    cd $_pkgname-$pkgver/scripts
    sed -i -e '20 h' -e '20 d' -e '23 c \    xdg-settings\n#    xdg-open' Makefile.in
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
