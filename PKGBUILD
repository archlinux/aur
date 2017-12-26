# Maintainer: Chiu-Hsiang Hsu <wdv4758h@gmail.com>

pkgname=musl-git
pkgver=v1.1.18.r51.gd5029bb8
pkgrel=1
pkgdesc='Lightweight implementation of C standard library'
arch=('i686' 'x86_64')
url='http://www.musl-libc.org/'
license=('MIT')
options=('staticlibs' '!buildflags')
source=("$pkgname::git://git.etalabs.net/musl")
md5sums=('SKIP')

pkgver() {
    cd $pkgname
    git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/release.//g'
}

build() {
  cd $pkgname

  # try some compiler options
  sed -i "s|-std=c99|-std=c11|" Makefile
  sed -i "s|-Os|-O3|" Makefile

  ./configure --prefix=/usr/lib/musl \
    --exec-prefix=/usr
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install

  install -dm755 "$pkgdir"/usr/lib/
  mv "$pkgdir"/lib/ld-musl*.so* "$pkgdir"/usr/lib/
  rmdir "$pkgdir"/lib

  install -Dm0644 README "$pkgdir"/usr/share/doc/musl/README
  install -Dm0644 COPYRIGHT "$pkgdir"/usr/share/licenses/musl/COPYRIGHT
}
