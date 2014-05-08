# Maintainer: Mark Coolen <mark dot coolen at gmail dot com>
pkgname=linuxstopmotion-git
_realname=linuxstopmotion
pkgver=77f51eb
pkgrel=1
pkgdesc="software for capturing and creating stop-motion animations - development version"
arch=('i686' 'x86_64')
url="http://www.linuxstopmotion.org"
license=('GPL2')
depends=('qt4' 'sdl_image' 'libvorbis' 'libxml2' 'inotify-tools')
makedepends=('git')
install=$_realname.install
conflicts=('stopmotion')
source=($_realname::git+http://git.code.sf.net/p/$_realname/code)
md5sums=('SKIP')

pkgver() {
  cd "$_realname"
  #uses the time of the last commit
  git describe --always | sed 's|-|.|g'
}	

build() {
	cd "$srcdir/$_realname"
	qmake-qt4 stopmotion.pro
	sed -i '/^LIBS/s|$| -lX11|' Makefile
	make PREFIX=/usr
}

package() {
	cd "$srcdir/$_realname"
	make INSTALL_ROOT="$pkgdir" install
	install -D -m644 stopmotion.desktop "$pkgdir"/usr/share/applications/stopmotion.desktop
	install -D -m644 graphics/stopmotion.png "$pkgdir"/usr/share/pixmaps/stopmotion.png
	install -D -m644 stopmotion.mime "$pkgdir"/usr/share/mime-info/stopmotion.mime
	install -D -m644 stopmotion.1 "$pkgdir"/usr/share/man/man1/stopmotion.1
	gzip "$pkgdir"/usr/share/man/man1/stopmotion.1
}
