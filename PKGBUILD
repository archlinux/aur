# Maintainer: Abdus Azad <abdus at abdus dot net>

pkgname=dicedb-git
pkgver=0.0.4.r169.g766cf4e
pkgrel=1
pkgdesc="DiceDB is a redis-compliant, in-memory, real-time, and reactive database optimized for modern hardware and for building and scaling truly real-time applications"
arch=('x86_64')
url="https://dicedb.io/"

depends=()
makedepends=('go' 'git' 'cmake')

source=("${srcdir}/${pkgname}::git+https://github.com/DiceDB/dice.git#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"

  ( 
    set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

package() {
  cd "${srcdir}/${pkgname}"

  make build

  install -Dm755 "${srcdir}/${pkgname}/dicedb" "${pkgdir}/usr/bin/dicedb"
  install -Dm644 "${srcdir}/${pkgname}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
