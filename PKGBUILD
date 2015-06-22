# Maintainer:  Joost Bremmer < toost dot b at gmail dot com>
# Contributor: Robert Orzanna <orschiro@gmail.com>

pkgname=ptask-git
pkgver=0.0.9.r3.g81823af
pkgrel=1
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
        'task-2.4.4-compat.patch')
sha512sums=('SKIP'
            '85ee768407ca6827df6544d86772d392e269d26e1ca6ca2faebb059e52cc9acd04c4baf2a1f4f02f5d088dd470992c9a35398512c465a988fc3aa3588d1a8a77')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g'
}

prepare() {
  cd "$srcdir/$pkgname"
  patch -p1 -i ${srcdir}/task-2.4.4-compat.patch
}

build() {
  cd "$srcdir/$pkgname"
  ./configure \
    --prefix=/usr \
    --sysconfdir=/usr/share
  make clean all
}

package() {
  cd "$srcdir/${pkgname}"
  make DESTDIR="${pkgdir}" install
}
