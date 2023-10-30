# Maintainer: Brian Gisseler <gissf1@gmail.com>
pkgname=mutagen-compose-git
pkgver=r162.9474213
pkgrel=1
pkgdesc="mutagen-compose from mutagen.io - Docker Compose with Mutagen integration"
arch=('any')
url="https://github.com/mutagen-io/mutagen-compose"
license=('MIT')
source=('git+https://github.com/mutagen-io/mutagen-compose')
makedepends=('git')
depends=('go>=1.11' 'git' 'docker-compose' 'mutagen.io-bin')
sha256sums=('SKIP')

#prepare() {}

pkgver() {
  cd "$srcdir"/mutagen-compose
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir"/mutagen-compose
  go run scripts/build.go || return $?
}

check() {
  cd "$srcdir"/mutagen-compose
  build/mutagen-compose --help 2> /dev/null || return $?
}

package() {
  cd "$srcdir"/mutagen-compose
  install -Dm755 build/mutagen-compose $pkgdir/usr/bin/mutagen-compose
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 README.md $pkgdir/usr/share/doc/$pkgname/README.md
  install -Dm644 SECURITY.md $pkgdir/usr/share/doc/$pkgname/SECURITY.md
}
