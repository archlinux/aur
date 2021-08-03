# Maintainer: fossdd <fossdd@tutanota.com>
pkgname=feef-git
_pkgname=${pkgname%-git}
pkgver=v0.1.0.r3.gbd88407
pkgrel=1
pkgdesc="a feed-querying and filtering tool"
url='https://sr.ht/~skuzzymiglet/feef'
license=(MIT)
arch=(x86_64)
depends=(fzf bash findutils xdg-utils wget)
makedepends=(go git)
conflicts=()
provides=(feef feef-read)
source=("git+https://git.sr.ht/~skuzzymiglet/feef")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "$_pkgname"
  go mod download
}

build() {
  cd "$_pkgname"
  go get git.sr.ht/~skuzzymiglet/feef
  go build
}

package() {
  cd "$_pkgname"
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm755 "$_pkgname-read" "$pkgdir/usr/bin/$_pkgname-read"
}

