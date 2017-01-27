# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=chakracore-cauldron-git
pkgver=v1.3.0.r1539.g979a9f3a
pkgrel=1
pkgdesc="the core part of the Chakra Javascript engine that powers Microsoft Edge-Cauldron fork"
arch=('any')
url="https://github.com/CauldronDevelopmentLLC/ChakraCore"
license=('MIT')
depends=('cmake'
	'clang'
	'icu')
source=("git+https://github.com/CauldronDevelopmentLLC/ChakraCore.git")
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

