# Maintainer: gbr <gbr@protonmail.com>
_pkgname=twittuh
pkgname=twittuh-git
pkgver=r89.ef45111
pkgrel=1
pkgdesc='Small Go program to make RSS/ATOM/JSON feeds from Twitter timelines'
arch=('x86_64')
url='https://github.com/derat/twittuh'
license=('BSD')
depends=('chromium')
makedepends=('go')
source=("$_pkgname::git+https://github.com/derat/twittuh.git#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_pkgname"
    go build \
        -o "$_pkgname" \
        -trimpath \
        -buildmode=pie \
        -mod=readonly \
        -modcacherw \
        -ldflags "-extldflags \"${LDFLAGS}\"" \
        .
}

check() {
    cd "$srcdir/$_pkgname"
    go test -v ./...
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm755 $_pkgname "$pkgdir"/usr/bin/$_pkgname
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
