# Maintainer: Nazar Mishturak <nazarmx@gmail.com>
pkgname=llmnrd-git
pkgver=r49.86a6f90
pkgrel=3
pkgdesc="Link-Local Multicast Resolution Daemon"
arch=('i686' 'x86_64')
url="https://github.com/tklauser/llmnrd"
license=('GPL2')
makedepends=('git' 'patch')
source=("${pkgname%-git}::git+https://github.com/tklauser/llmnrd.git"
        'llmnrd-destdir.patch'
        'llmnrd.service')
md5sums=('SKIP'
         '366476ae16ff195746ed588375fc62f8'
         '3214030732bb26594fcad0858e9f5e2b')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${pkgname%-git}"
  patch -p1 -i "$srcdir/llmnrd-destdir.patch"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  make
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make CFLAGS="$CFLAGS" DESTDIR="$pkgdir" prefix="/usr" install
  install -D -m0644 "$srcdir/llmnrd.service" "$pkgdir/usr/lib/systemd/system/llmnrd.service"
}
