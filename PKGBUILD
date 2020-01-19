# $Id$
# Maintainer: philanecros <philanecros@gmail.com>

_pkgname=musl
_target=arm-linux-gnueabihf
pkgname=$_target-$_pkgname
pkgver=1.1.24
pkgrel=1
pkgdesc='Lightweight implementation of C standard library'
arch=('i686' 'x86_64')
url='http://www.musl-libc.org/'
license=('MIT')
options=('staticlibs' '!buildflags' '!strip')
makedepends=('arm-linux-gnueabihf-binutils' 'arm-linux-gnueabihf-gcc')
validpgpkeys=('836489290BB6B70F99FFDA0556BCDB593020450F')
source=(https://www.musl-libc.org/releases/musl-$pkgver.tar.gz{,.asc})
sha256sums=('1370c9a812b2cf2a7d92802510cca0058cc37e66a7bedd70051f0a34015022a3'
            'SKIP')
_sysroot=/usr/lib/$_target

build() {
  cd $_pkgname-$pkgver
  ./configure --prefix=$_sysroot --sysroot=$_sysroot \
    --bindir=/usr/bin --target=$_target \
    --enable-wrapper=all
  make
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install

  install -dm755 "$pkgdir$_sysroot"
  mv "$pkgdir"/lib/ld-musl*.so* "$pkgdir$_sysroot"/lib
  rmdir "$pkgdir"/lib

  pushd "$pkgdir"/usr/bin
  for _bin in *; do
    mv "$_bin" $_target-$_bin
  done
  popd

  install -Dm0644 README "$pkgdir"/usr/share/doc/$pkgname/README
  install -Dm0644 COPYRIGHT "$pkgdir"/usr/share/licenses/$pkgname/COPYRIGHT
}
