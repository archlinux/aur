pkgname=xdg-utils-no-open
_pkgname=xdg-utils
pkgver=1.1.1
pkgrel=1
pkgdesc="Command line tools that assist applications with a variety of desktop integration tasks"
arch=('any')
url="http://www.freedesktop.org/wiki/Software/xdg-utils/"
license=('MIT')
depends=('sh' 'xorg-xset') # xset needed inside xdg-screensaver
makedepends=('docbook-xsl' 'lynx' 'xmlto' 'git')
optdepends=('linopen: for xdg-open support')
source=(http://portland.freedesktop.org/download/$_pkgname-$pkgver.tar.gz{,.asc})
md5sums=('2d0aec6037769a5f138ff404b1bb4b15'
         'SKIP')
validpgpkeys=('8B75CA7811367175D05F3B03C43570F80CC295E6') # "Per Olofsson <pelle@pqz.se>"

# Set this 1 to conflict with xdg-utils so you can
# go without xdg-open for whatever reason
PROVIDE_XDG_OPEN=0

if [ $PROVIDE_XDG_OPEN -eq 1 ]; then
   provides=('xdg-utils')
   conflicts=('xdg-utils')
fi

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
