# Maintainer: Chiu-Hsiang Hsu <wdv4758h@gmail.com>

pkgname=musl-git
pkgver=v1.1.11.r57.gc82d3ba
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

  # this should be fixed in Makefile ...
  make tools/musl-clang
  make tools/ld.musl-clang
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install

  install -dm755 "$pkgdir"/usr/lib/
  mv "$pkgdir"/lib/ld-musl*.so* "$pkgdir"/usr/lib/
  rmdir "$pkgdir"/lib

  # this should be fixed in Makefile ...
  install -Dm0755 tools/musl-clang "$pkgdir"/usr/bin/musl-clang
  install -Dm0755 tools/ld.musl-clang "$pkgdir"/usr/bin/ld.musl-clang

  install -Dm0644 README "$pkgdir"/usr/share/doc/musl/README
  install -Dm0644 COPYRIGHT "$pkgdir"/usr/share/licenses/musl/COPYRIGHT
}
