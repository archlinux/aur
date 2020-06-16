# Maintainer: Jonne Haß <me@jhass.eu>
pkgname=shards-git
pkgver=v0.11.1.r0.g3b7d490
pkgrel=1
pkgdesc="The package manager for the Crystal language (git version)"
arch=('x86_64' 'aarch64')
url="https://github.com/ysbaddaden/shards"
license=('Apache')
conflicts=('shards')
provides=('shards')
depends=('libyaml' 'git' 'libevent' 'gc')
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

  make CRYSTAL_OPTS="--release" 
}

check() {
  cd "${pkgname/-git/}"
  ./bin/shards install
  make test
}

package() {
  cd "${pkgname/-git/}"
  
  make install PREFIX="$pkgdir/usr"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
sha256sums=('SKIP')
