# Maintainer: Aaron Bishop < erroneous at gmail >

pkgname=date-git
_pkgname=date
pkgver=2.4.1.r140.gf43c39f
pkgrel=1
pkgdesc='A header-only library which builds upon <chrono>'
arch=('any')
url="https://github.com/HowardHinnant/date"
license=('MIT')
depends=()
makedepends=('cmake')
source=("git+https://github.com/HowardHinnant/date.git")
sha256sums=('SKIP')
conflicts=('date')
provides=('date')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  rm -Rf build
  mkdir build
  cd build
  #Not building tz because it would clobber tzdata's /usr/lib/libtz.a
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "../$_pkgname"
}

build() {
  cd build
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir/" install

  mkdir -p "${pkgdir}/usr/share/licenses/$_pkgname"
  install -Dm644 ../$_pkgname/LICENSE.txt "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
