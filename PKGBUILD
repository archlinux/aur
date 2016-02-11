# Maintainer: Emil Edholm <emil@edholm.it>

_pkgname=honggfuzz
pkgname=${_pkgname}-git
pkgver=0.6.r435.g2e06f56
pkgrel=1
pkgdesc="A general-purpose, easy-to-use fuzzer with interesting analysis options"
arch=('i686' 'x86_64')
url="http://google.github.io/honggfuzz/"
license=('Apache')
depends=('binutils'
         'libunwind')
makedepends=()
optdepends=()
conflicts=()
provides=(${_pkgname})
#install=''
source=('git://github.com/google/honggfuzz'
        'honggfuzz.archfix.diff'
       )
md5sums=('SKIP'
         'ad862d346eca45e696f4d6dd3e0d4ae0')
patches=(honggfuzz.archfix.diff)

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $srcdir/$_pkgname
  for patch in "${patches[@]}"; do
    echo "Patching $patch"
    patch -p1 < "../${patch}"
  done
}

build() {
  cd "$srcdir/$_pkgname"
  make
}

package() {
  cd $srcdir/$_pkgname
  install -Dm755 honggfuzz "$pkgdir/usr/bin/honggfuzz"
}
