# Maintainer: spider-mario <spidermario@free.fr>
pkgname=csmith
pkgver=2.1.0
pkgrel=1
pkgdesc="Tool for stress-testing compilers, static analyzers, and other tools that process C code"
arch=('i686' 'x86_64')
url="http://embed.cs.utah.edu/csmith/"
license=('custom:BSD')
depends=('perl')
source=(csmith.sh http://embed.cs.utah.edu/csmith/$pkgname-$pkgver.tar.gz)
md5sums=('75128bd5310cbc1c139b696da3b8e4d8'
         '3170ce73f0347d82c1206cf145cb49c7')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install

  install runtime/safe_math{,_macros,_macros_notmp}.h "$pkgdir/usr/include/$pkgname-$pkgver/"
  rm "$pkgdir/usr/include/$pkgname-$pkgver/"safe_math{,_macros,_macros_notmp}.h

  sed --expression=s/gcc-4.0/gcc/g scripts/compiler_test.in > "$pkgdir/usr/bin/compiler_test.in"

  install --directory "$pkgdir/opt/"
  pushd "$pkgdir/opt/"
    cp --recursive "$srcdir/$pkgname-$pkgver/" "$pkgdir/opt/$pkgname"
  popd

  install --directory "$pkgdir/etc/profile.d/"
  install ../../csmith.sh "$pkgdir/etc/profile.d/"

  install --directory "$pkgdir/usr/share/licenses/$pkgname/"
  install COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
