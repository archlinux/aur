# Maintainer: Mark Coolen <mark dot coolen at gmail dot com>
pkgname=linuxstopmotion-git
_realname=linuxstopmotion
pkgver=0.8.1beta10.r0.g875c7d1
pkgrel=1
epoch=1
pkgdesc="software for capturing and creating stop-motion animations - development version"
arch=('i686' 'x86_64')
url="http://www.linuxstopmotion.org"
license=('GPL2')
depends=('qt4' 'libvorbis' 'libxml2' 'libtar')
makedepends=('git')
conflicts=('stopmotion')
source=("$_realname::git+http://git.code.sf.net/p/$_realname/code#branch=no-sdl"
	narrowing.patch)
md5sums=('SKIP'
         '13caed85ded8db631ae520620cab408e')

pkgver() {
  cd "$_realname"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}	

prepare() {
  cd $_realname
  patch -Np0 -b -z .orig <../narrowing.patch
}

build() {
  cd $_realname
  lrelease-qt4 stopmotion.pro
  qmake-qt4 PREFIX=/usr stopmotion.pro
  sed -i '/^LIBS/s|$| -lX11|' Makefile
  make
}

package() {
  cd $_realname
  sed -e 's/install_desktop install_dummy/install_desktop/' -i Makefile.Release
  make INSTALL_ROOT="$pkgdir" install
  install -D -m644 stopmotion.desktop "$pkgdir"/usr/share/applications/stopmotion.desktop
  install -D -m644 graphics/stopmotion.png "$pkgdir"/usr/share/pixmaps/stopmotion.png
  install -D -m644 stopmotion.mime "$pkgdir"/usr/share/mime-info/stopmotion.mime
  install -D -m644 stopmotion.1 "$pkgdir"/usr/share/man/man1/stopmotion.1
  gzip "$pkgdir"/usr/share/man/man1/stopmotion.1
}
