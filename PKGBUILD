# Maintainer: Guilhem Saurel <guilhem.saurel@laas.fr>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: philanecros <philanecros@gmail.com>

_pkgname=musl
_target=arm-linux-gnueabihf
pkgname="$_target-$_pkgname"
pkgver=1.2.3
pkgrel=1
pkgdesc='Lightweight implementation of C standard library'
arch=('i686' 'x86_64')
url='http://musl.libc.org'
license=('MIT')
options=('staticlibs' '!buildflags' '!strip')
makedepends=('arm-linux-gnueabihf-binutils' 'arm-linux-gnueabihf-gcc')
validpgpkeys=('836489290BB6B70F99FFDA0556BCDB593020450F')
source=("$url/releases/musl-$pkgver.tar.gz"{,.asc})
sha256sums=('7d5b0b6062521e4627e099e4c9dc8248d32a30285e959b7eecaa780cf8cfd4a4'
            'SKIP')
_sysroot="/usr/lib/$_target"

build() {
  cd "$_pkgname-$pkgver"
  export CC="$_target-gcc"
  ./configure --prefix="$_sysroot" --sysroot="$_sysroot" \
    --bindir=/usr/bin --target="$_target" \
    --enable-wrapper=all
  make
}

package() {
  cd "$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install

  install -dm755 "$pkgdir$_sysroot"
  mv "$pkgdir"/lib/ld-musl*.so* "$pkgdir$_sysroot"/lib
  rmdir "$pkgdir"/lib

  pushd "$pkgdir"/usr/bin
  for _bin in *; do
    mv "$_bin" "$_target-$_bin"
  done
  popd

  install -Dm0644 README "$pkgdir"/usr/share/doc/$pkgname/README
  install -Dm0644 COPYRIGHT "$pkgdir"/usr/share/licenses/$pkgname/COPYRIGHT
}
