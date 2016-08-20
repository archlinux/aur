# Maintainer: Nazar Mishturak <nazarmx@gmail.com>
pkgname=llmnrd-git
pkgver=r70.f46d59e
pkgrel=1
pkgdesc="Link-Local Multicast Resolution Daemon"
arch=('i686' 'x86_64')
url="https://github.com/tklauser/llmnrd"
license=('GPL2')
makedepends=('git' 'patch')
source=("${pkgname%-git}::git+https://github.com/tklauser/llmnrd.git"
        'llmnrd-sbin.patch'
        'llmnrd.service')
md5sums=('SKIP'
         'f4bb6314ec0f7d8b521b3d07b6935765'
         '160407f11d69704b3b05b2e1a3ae2e26')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${pkgname%-git}"
  patch -p1 -i "$srcdir/llmnrd-sbin.patch"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  make
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make DESTDIR="$pkgdir" prefix="/usr" install
  install -D -m0644 "$srcdir/llmnrd.service" "$pkgdir/usr/lib/systemd/system/llmnrd.service"
}
