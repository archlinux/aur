# Maintainer: Jason Gerecke <killertofu@gmail.com>

pkgname=hidrd-git
pkgver=r412.6c0ed39
pkgrel=1
pkgdesc="HID report descriptor I/O library and conversion tool"
arch=('i686' 'x86_64')
url="https://github.com/DIGImend/hidrd/"
license=('GPL2')
depends=('glibc')
optdepends=(
    'libxml2: xml descriptor format'
)
makedepends=('git')
provides=('hidrd')
conflicts=('hidrd')
options=('!libtool')
source=("$pkgname"::git+https://github.com/DIGImend/hidrd.git#branch=master)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  # Tags for versioned releases exist on side-branches, not master :(
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"

  # Correct compile issue:
  # https://github.com/DIGImend/hidrd/pull/33/commits/73a01e5e0091f5fbf452fd85ac3632f8c0171e65
  sed -i 's/map\[16\]/map\[17\]/' lib/util/hex.c
}

build() {
  cd "$srcdir/$pkgname"
  
  ./bootstrap
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
}

