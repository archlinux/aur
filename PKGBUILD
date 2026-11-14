# Maintainer: Francesco Minnocci <ad17fmin@uwcad.it>

pkgname=jfsh-git
pkgver=0.2.1
pkgrel=1
pkgdesc='Terminal client for Jellyfin, plays videos through mpv'
arch=('x86_64')
url="https://github.com/hacel/jfsh"
license=('Unlicense')
depends=('mpv')
makedepends=('go' 'git')
provides=('jfsh')
conflicts=('jfsh')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags --abbrev=7 2>/dev/null |
    sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf '0.0.0.r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$pkgname"
  export CGO_ENABLED=0
  go build -buildvcs=false -trimpath -ldflags '-s -w' -o jfsh .
}

package() {
  cd "$pkgname"
  install -Dm755 jfsh "$pkgdir/usr/bin/jfsh"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
# vim:set ts=2 sw=2 et:
