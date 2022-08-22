# Maintainer: SlyFabi <admin@slyfabi.de>
pkgname=wsysmon-git
pkgdesc="A windows task manager clone for Linux."
pkgver=r5.81e32da
pkgrel=1
arch=(any)
license=(MIT)
depends=(gtkmm3 procps)
makedepends=(git)
provides=(${pkgname%-*}=$pkgver)
conflicts=(${pkgname%-*})
source=($pkgname::git+https://github.com/SlyFabi/WSysMon)
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
    cmake -B build -S "WSysMon-${pkgver}" \
        -DCMAKE_BUILD_TYPE='Release' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
