# Maintainer: Nikita Puzyryov <nekit1234007@gmail.com>

_domain='git.torproject.org'
_gourl="$_domain/tor-fw-helper.git"

pkgname=tor-fw-helper-git
pkgver=r36.481599e
pkgrel=1
pkgdesc="Pure-go port-forwarding implementation"
arch=('x86_64' 'i686')
url="https://gitweb.torproject.org/tor-fw-helper.git/"
license=('BSD')
makedepends=('go')
provides=(tor-fw-helper)
conflicts=(tor-fw-helper)
options=('!strip' '!emptydirs')
source=("$pkgname::git+https://$_gourl")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  ( set -o pipefail
    git describe --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

# Go is a very… special kind of language
prepare() {
  cd "$srcdir/$pkgname"
  mkdir -p "src/$_domain/"
  ln -s ../../ src/$_gourl
}

build() {
  cd "$srcdir/$pkgname"
  export GOPATH="$(pwd)"
  go build -v -o tor-fw-helper.bin $_gourl/tor-fw-helper
}

package() {
  cd "$srcdir/$pkgname"
  install -D -m 0755 tor-fw-helper.bin "$pkgdir/usr/bin/tor-fw-helper"
  install -D -m 0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
