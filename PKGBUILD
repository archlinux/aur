# Maintainer: Allen Wild <allenwild93@gmail.com>
# Contributor: Riley Trautman <asonix.dev@gmail.com>

pkgname=aarch64-linux-musl
pkgver=1.2.3
pkgrel=1
pkgdesc='Lightweight implementation of C standard library'
arch=('i686' 'x86_64')
url='https://musl.libc.org'
license=('MIT')
options=('staticlibs' '!buildflags' '!strip')
depends=('aarch64-linux-gnu-gcc')
validpgpkeys=('836489290BB6B70F99FFDA0556BCDB593020450F')
source=(https://musl.libc.org/releases/musl-${pkgver}.tar.gz{,.asc})
sha256sums=('7d5b0b6062521e4627e099e4c9dc8248d32a30285e959b7eecaa780cf8cfd4a4'
            'SKIP')

_target=aarch64-linux-gnu
_sysroot=/usr/$_target/lib/musl

build() {
  cd musl-$pkgver
  ./configure --prefix=$_sysroot \
              --exec-prefix=/usr \
              --target=$_target \
              --enable-wrapper=all
  make
}

package() {
  cd musl-$pkgver
  make DESTDIR="$pkgdir" install

  # configure syslibdir with /lib for PT_INTERP compat, but install to /usr/lib
  mv "$pkgdir"/lib/ld-musl*.so* "$pkgdir$_sysroot"/lib/
  rmdir "$pkgdir"/lib

  pushd "$pkgdir"/usr/bin
  local _bin
  for _bin in *; do
    mv "$_bin" "${_target%-gnu}-$_bin"
  done
  popd

  install -Dm0644 README "$pkgdir"/usr/share/doc/$pkgname/README
  install -Dm0644 COPYRIGHT "$pkgdir"/usr/share/licenses/$pkgname/COPYRIGHT
}

# vim: et ts=2 sts=2 sw=2
