# Maintainer: Furkan Sahin <furkan-dev@proton.me>
pkgname=bakah-git
pkgver=r25.5193fd1
pkgrel=1
pkgdesc="Build Bake files using Buildah"
arch=('x86_64')
url="https://github.com/emersion/bakah"
license=('MIT')
depends=('buildah')
makedepends=('git' 'go')
conflicts=('bakah')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/bakah"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/bakah"

  export GOPATH="$srcdir/go"
  export GOCACHE="$srcdir/gocache"

  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  go build -v \
    -ldflags "-linkmode=external -extldflags '${LDFLAGS}'" \
    -o bakah .
}


package() {
  cd "$srcdir/bakah"
  install -Dm755 bakah "$pkgdir/usr/bin/bakah"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
