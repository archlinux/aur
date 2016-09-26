# Maintainer: Beini <bane at iki dot fi>
pkgname=arm-compiler-rt-git
pkgver=r20.0fcfe9a
pkgrel=1
pkgdesc="Compiler-rt builtins for bare metal ARM targets"
arch=('i686' 'x86_64')
url="https://github.com/ReservedField/arm-compiler-rt"
license=('custom:University of Illinois/NCSA Open Source License')
makedepends=('git'
             'arm-none-eabi-binutils'
             'arm-none-eabi-gcc'
             'arm-none-eabi-newlib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=(!strip)
source=('git://github.com/ReservedField/arm-compiler-rt.git'
        'git://github.com/llvm-mirror/compiler-rt.git#branch=release_39')
md5sums=('SKIP' 'SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${pkgname%-git}"

  git submodule init
  git config submodule.compiler-rt.url $srcdir/compiler-rt
  git submodule update
}

build() {
  cd "$srcdir/${pkgname%-git}"
  CC=arm-none-eabi-gcc make
}

package() {
  cd "$srcdir/${pkgname%-git}"

  install -d "$pkgdir/usr/arm-none-eabi/"
  cp -a "lib" "$pkgdir/usr/arm-none-eabi/"

  install -Dm644 "$srcdir/compiler-rt/LICENSE.TXT" \
    "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
