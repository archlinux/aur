pkgname=stsoundlibrary-git
epoch=1
pkgver=r45.ecae512
pkgrel=2
pkgdesc='Library for AY-3-8912 chip emulation and YM music files (libstsound)'
arch=(i686 x86_64)
url='https://github.com/cpcsdk/libstsound'
license=(BSD)
depends=(glibc gcc-libs)
makedepends=(git)
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=('git+https://github.com/cpcsdk/libstsound')
sha256sums=(SKIP)

pkgver() {
  cd "$srcdir"/libstsound
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed -r 's/^cpctools-//;s/([^-]*-g)/r\1/;y/-/./' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$srcdir"/libstsound
  ./build_config.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/libstsound
  make DESTDIR="$pkgdir" install
  install -D -m644 -t "$pkgdir/usr/share/licenses/$pkgname" COPYING
}
