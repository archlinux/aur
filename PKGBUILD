# Maintainer:  Joost Bremmer < toost dot b at gmail dot com>
# Contributor: Robert Orzanna <orschiro@gmail.com>

pkgname=ptask-git
pkgver=0.0.9.r9.g2b8b4aa
pkgrel=3
pkgdesc='A GTK+ graphical user interface for managing tasks in taskwarrior'
arch=('i686'
      'x86_64')
url='http://wpitchoune.net/ptask'
license=('GPL2')
depends=('task'
         'json-c'
		 'gtk3'
		 'xdg-utils')
makedepends=('git'
             'help2man'
			 'asciidoc')
install=$pkgname.install
source=("$pkgname::git+http://git.wpitchoune.net/${pkgname%-git}.git"
        'task-2.5-compat.patch')
sha512sums=('SKIP'
            'ffe243097a6580105820fa2ba84b52667ba8d97c34b9e377b54ce297896dbb695fab47d66c634dff724d4c676bf60a83690e5d574b7b34c0b757558f305a6a23')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g'
}

prepare() {
  cd "$srcdir/$pkgname"
  patch -p1 -i ${srcdir}/task-2.5-compat.patch
}

build() {
  cd "$srcdir/$pkgname"
  aclocal
  automake
  ./configure \
    --prefix=/usr \
    --sysconfdir=/usr/share
  make clean all
}

check() {
  cd "$srcdir/$pkgname"
  make check
}

package() {
  cd "$srcdir/${pkgname}"
  make DESTDIR="${pkgdir}" install
}
