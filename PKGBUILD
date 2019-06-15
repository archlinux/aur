# Maintainer: David Cristofaro <david@dtcristo.com>
pkgname=lucky-git
pkgver=0.15.0.r0.6796508
pkgrel=1
pkgdesc='A Crystal web framework that catches bugs for you, runs incredibly fast, and helps you write code that lasts.'
arch=('x86_64')
url='https://luckyframework.org/'
license=('MIT')
depends=('crystal' 'shards')
makedepends=('git')
provides=('lucky')
conflicts=('lucky')
source=('git+https://github.com/luckyframework/lucky_cli.git')
sha256sums=('SKIP')

pkgver() {
  cd "lucky_cli"
  local tag=$(git rev-list --tags --max-count=1)
  printf "%s.r%s.%s" "$(git describe --tags $tag | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')" "$(git rev-list --count $tag..)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "lucky_cli"
  shards install
  crystal build src/lucky.cr --release --no-debug
}

package() {
  cd "lucky_cli"
  install -Dm755 lucky "$pkgdir/usr/bin/lucky"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
