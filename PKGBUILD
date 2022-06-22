# Maintainer: Gaël PORTAY <gael.portay@collabora.com>

pkgname=armhf-musl
pkgver=1.2.3
pkgrel=1
pkgdesc='Lightweight implementation of C standard library (armhf)'
arch=('x86_64')
url='https://www.musl-libc.org/'
license=('MIT')
depends=('muslcc-arm-linux-musleabihf-cross-bin')
options=('staticlibs' '!buildflags')
validpgpkeys=('836489290BB6B70F99FFDA0556BCDB593020450F')
source=(https://www.musl-libc.org/releases/musl-$pkgver.tar.gz{,.asc})
sha256sums=('7d5b0b6062521e4627e099e4c9dc8248d32a30285e959b7eecaa780cf8cfd4a4'
            'SKIP')

_target=armhf
_sysroot=/usr/lib/$_target-musl

build() {
  cd musl-$pkgver
  CC=arm-linux-musleabihf-gcc \
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
