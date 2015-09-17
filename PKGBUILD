# Maintainer: Jonne Haß <me@jhass.eu>
pkgname=shards-git
pkgver=v0.4.0.r0.gff83fe9
pkgrel=1
pkgdesc="The package manager for the Crystal language (git version)"
arch=('i686' 'x86_64')
url="https://github.com/ysbaddaden/shards"
license=('Apache')
conflicts=('shards')
provides=('shards')
depends=('libyaml' 'git' 'libpcl' 'libunwind' 'libevent' 'gc')
makedepends=('crystal')
source=("git+https://github.com/ysbaddaden/shards.git")

pkgver() {
  cd "$srcdir/${pkgname/-git/}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${pkgname/-git/}"

  crystal build --release -o bin/shards src/shards.cr
}

check() {
  cd "${pkgname/-git/}"
  ./bin/shards install
  make -j1 test
}

package() {
  cd "${pkgname/-git/}"

  install -Dm755 bin/shards "$pkgdir/usr/bin/shards"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
sha256sums=('SKIP')
