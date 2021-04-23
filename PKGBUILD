# Maintainer: eggbertx <joshuamerrell at gmail dot com>
# Previous maintainer: Felix Golatofski <contact at xdfr dot de>
# Contributor: michaelchou <michaeljchou at the hotmail domain which is .com>
# Contributor: enihcam <nanericwang at the google email domain which is .com>

pkgname=chakracore
pkgver=1.11.24
pkgrel=1
pkgdesc='ChakraCore is an open source Javascript engine with a C API'
arch=('x86_64')
url='https://github.com/chakra-core/ChakraCore'
license=('MIT')
depends=('icu')
makedepends=('cmake' 'clang' 'python2')
provides=('libChakraCore.so' 'ch')
conflicts=('chakracore-git' 'chakracore-bin')
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/chakra-core/ChakraCore/archive/v${pkgver}.tar.gz"
)
sha256sums=('b99e85f2d0fa24f2b6ccf9a6d2723f3eecfe986a9d2c4d34fa1fd0d015d0595e')

_dir="ChakraCore-${pkgver}"

build() {
  cd "$srcdir/$_dir"
  ./build.sh --jobs=$(nproc) --extra-defines=U_USING_ICU_NAMESPACE=1 -y
  ./build.sh --jobs=$(nproc) --extra-defines=U_USING_ICU_NAMESPACE=1 -y --static
}

package() {
  install -Dm755 "$srcdir/$_dir/out/Release/ch" "$pkgdir/usr/bin/ch"

  install -Dm644 "$srcdir/$_dir/out/Release/bin/ChakraCore/libChakraCore.so" "$pkgdir/usr/lib/libChakraCore.so"

  for file in $srcdir/$_dir/out/Release/include/*; do
    install -Dm644 "$file" "$pkgdir/usr/include/$(basename $file)"
  done

  install -Dm644 "$srcdir/$_dir/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
