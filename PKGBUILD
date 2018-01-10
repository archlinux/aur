# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Guillaume ALAUX <guillaume@archlinux.org>

pkgname=('libkeybinder2' 'python2-keybinder2')
pkgbase=keybinder2
_realname=keybinder
pkgver=0.3.1
pkgrel=2
pkgdesc='Library for registering global keyboard shortcuts'
arch=('x86_64')
url='https://github.com/kupferlauncher/keybinder'
license=('GPL')
depends=('pygtk')
makedepends=('gobject-introspection')
options=('!emptydirs')
source=(https://github.com/kupferlauncher/$_realname/releases/download/v$pkgver/$_realname-$pkgver.tar.gz)
sha256sums=('879f07130ac64792ddb9fd758e6673119283bda37d75573787ae22af8684a240')

build() {
  cd $_realname-$pkgver
  ./configure --prefix=/usr PYTHON=python2
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package_libkeybinder2() {
  depends=('gtk2')

  cd $_realname-$pkgver
  make DESTDIR="$pkgdir" install
  make -C python-keybinder DESTDIR="$pkgdir" uninstall
}

package_python2-keybinder2() {
  pkgdesc+=' (Python 2 bindings)'
  depends=('libkeybinder2' 'pygtk')

  cd $_realname-$pkgver
  make DESTDIR="$pkgdir" install
  make -C docs DESTDIR="$pkgdir" uninstall
  make -C libkeybinder DESTDIR="$pkgdir" uninstall
}
