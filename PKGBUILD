# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=chakracore-cauldron-git
pkgver=v1.4.0.r551.g0dd9cd340
pkgrel=1
pkgdesc="the core part of the Chakra Javascript engine that powers Microsoft Edge-Cauldron fork"
arch=('any')
url="https://github.com/CauldronDevelopmentLLC/ChakraCore"
license=('MIT')
depends=('cmake'
	'clang'
	'icu')
source=("https://github.com/CauldronDevelopmentLLC/ChakraCore")
md5sums=('SKIP')

pkgver() {
  cd ChakraCore
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ChakraCore
  ./build.sh --static -j 8
}

package() {
  mkdir -p "${pkgdir}/opt"
  mv "${srcdir}/ChakraCore/BuildLinux/Release" "${pkgdir}/opt/${pkgname}"
  mkdir -p "${pkgdir}/opt/${pkgname}/include"

  cp "$srcdir/ChakraCore/lib/Jsrt/"*.h "${pkgdir}/opt/${pkgname}/include/."  
  
  cd "${pkgdir}/opt/${pkgname}"
  mkdir tmp
  cd tmp
  for i in $(find .. -name \*.a); do
    ar x $i
  done
  ar rcs ../libChakraCore.a *.o
  cd ..
  rm -rf tmp
}

