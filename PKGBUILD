# Maintainer: daonm <daobilionusd@gmail.com>
pkgname=gopac-git
_pkgname=gopac
pkgver=1.2.1
pkgrel=1
pkgdesc="A warm Gruvbox TUI for pacman and AUR (Git)"
arch=('x86_64')
options=('!debug')
url="https://github.com/the-daonm/gopac"
license=('MIT')
depends=('pacman')
makedepends=('git' 'go')
provides=("$_pkgname")
conflicts=('gopac' 'gopac-bin')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  export CGO_ENABLED=0
  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-w -s" \
    -o gopac .
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 gopac "$pkgdir/usr/bin/gopac"
}
