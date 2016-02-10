# Maintainer: Emil Edholm <emil@edholm.it>

_pkgname=honggfuzz
pkgname=${_pkgname}-git
pkgver=0.6.r429.g14717ca
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
         '74b75ac4ffc876fde8b202969bc47cf4')
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
