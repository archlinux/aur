# Maintainer: Gaël PORTAY <gael.portay@rtone.fr>

pkgname=arm-musl
pkgver=1.2.4
pkgrel=1
pkgdesc='Lightweight implementation of C standard library (arm)'
arch=('x86_64')
url='https://www.musl-libc.org/'
license=('MIT')
depends=('muslcc-arm-linux-musleabi-cross-bin')
options=('staticlibs' '!buildflags')
validpgpkeys=('836489290BB6B70F99FFDA0556BCDB593020450F')
source=(https://www.musl-libc.org/releases/musl-$pkgver.tar.gz{,.asc})
sha256sums=('7a35eae33d5372a7c0da1188de798726f68825513b7ae3ebe97aaaa52114f039'
            'SKIP')

_target=arm
_sysroot=/usr/lib/$_target-musl

build() {
  cd musl-$pkgver
  CC=arm-linux-musleabi-gcc \
  ./configure --prefix=$_sysroot \
    --exec-prefix=/usr \
    --target=$_target \
    --build=$_target \
    --enable-wrapper=all
  make
}

package() {
  cd musl-$pkgver
  make DESTDIR="$pkgdir" install

  # configure syslibdir with /lib for PT_INTERP compat, but install to /usr/lib
  mv "$pkgdir"/lib/ld-musl*.so* "$pkgdir"/usr/lib/
  rmdir "$pkgdir"/lib

  pushd "$pkgdir"/usr/bin
  local _bin
  for _bin in *; do
    mv "$_bin" "$_target-$_bin"
  done
  popd

  install -Dm0644 README "$pkgdir"/usr/share/doc/$pkgname/README
  install -Dm0644 COPYRIGHT "$pkgdir"/usr/share/licenses/$pkgname/COPYRIGHT
}
