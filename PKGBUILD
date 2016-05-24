# Maintainer:  Joost Bremmer < toost dot b at gmail dot com>
# Contributor: Robert Orzanna <orschiro@gmail.com>

pkgname=ptask-git
pkgver=1.0.0.r1.g9554c87
pkgrel=1
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
            '52f57df194d69b8b1541a9b28af18976bc346ce26c607d28ffcd23fc99df6e463336cb2f176e61199b6b301c477613e0f9a98c1fba9f80aa140ab1b73a2c8aa7')
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
