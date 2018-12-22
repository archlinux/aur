# Maintainer: Tony Lambiris <tony@criticalstack.com>

pkgbase=snowball-git
pkgname=(snowball-git libstemmer-git)
pkgver=r662.d29510a
pkgrel=1
pkgdesc="String processing language for creating stemming algorithms"
arch=(x86_64)
url="http://snowballstem.org/"
license=(BSD)
depends=(glibc)
makedepends=(git)
source=("$pkgbase::git+https://github.com/snowballstem/snowball"
        dynamiclib.patch)
sha256sums=('SKIP'
            '99511a11cdeeb1ef1eaa9d7b777f6934693d4696ba9523de40b886f7d898058e')

prepare() {
  cd $pkgbase
  patch -Np1 -i ../dynamiclib.patch
}

pkgver() {
  cd $pkgbase
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $pkgbase
  make
}

check() {
  cd $pkgbase
  # Disabled - needs external test data
  #make check
}

package_snowball-git() {
  pkgname=(snowball-git)
  conflicts=(snowball)
  provides=(snowball)

  cd $pkgbase
  install -d "$pkgdir/usr/bin"
  install -t "$pkgdir/usr/bin" snowball stemwords
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/snowball/LICENSE"
}

package_libstemmer-git() {
  pkgname=(libstemmer-git)
  conflicts=(libstemmer)
  provides=(libstemmer)

  pkgdesc="Stemming library supporting several languages"
  cd $pkgbase
  install -Dm644 {.,"$pkgdir"/usr}/include/libstemmer.h
  install -D {.,"$pkgdir"/usr/lib}/libstemmer.so.0.0.0
  ln -s libstemmer.so.0.0.0 "$pkgdir/usr/lib/libstemmer.so.0"
  ln -s libstemmer.so.0 "$pkgdir/usr/lib/libstemmer.so"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/libstemmer/LICENSE"
}
