# Maintainer:  Joost Bremmer < toost dot b at gmail dot com>
# Contributor: Robert Orzanna <orschiro@gmail.com>

pkgname=ptask-git
pkgver=1.0.0.r1.g9554c87
pkgrel=2
pkgdesc='A GTK+ graphical user interface for managing tasks in taskwarrior'
arch=('i686'
      'x86_64')
url='http://wpitchoune.net/ptask'
license=('GPL2')
depends=('task<=2.5.1'
         'json-c'
		 'gtk3'
		 'xdg-utils')
makedepends=('git'
             'help2man'
			 'asciidoc')
source=("$pkgname::git+http://git.wpitchoune.net/${pkgname%-git}.git"
        'task-2.5.1-compat.patch')
sha512sums=('SKIP'
            'ab473814b7a3ffb9d4825d90f43f88778f99cf5afe2b05eb83997cd9622ce6f0a4c1bbdd4684ad196dfb35d803a27cf9ad479b5d9836c3dee747ec40d18e914c')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g'
}

prepare() {
  cd "$srcdir/$pkgname"
  patch -p1 -i "${srcdir}/task-$(task --version)-compat.patch"
}

build() {
  cd "$srcdir/$pkgname"
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
