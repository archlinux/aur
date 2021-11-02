# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Kaio "yaakushi" Augusto <kaioaugusto dot 8 at gmail dot com>
# Contributor: matthias.lisin
# Contributor: Bruno Inec <bruno at inec dot fr>

pkgname=wtfutil
pkgver=0.40.0
pkgrel=1
pkgdesc="Personal information dashboard for your terminal"
arch=('x86_64' 'aarch64' 'armv6h')
url="https://wtfutil.com"
license=('MPL2')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/wtfutil/wtf/archive/v$pkgver.tar.gz")
sha256sums=('74e29757fbaa9744e5707f6666195f21515f3abe29da284f833635afe60d12ec')

prepare() {
  # Prevent creation of a `go` directory in one's home.
  # Sometimes this directory cannot be removed with even `rm -rf` unless
  # one becomes root or changes the write permissions.
  export GOPATH="$srcdir/gopath"
  go clean -modcache
}

build() {
  cd "wtf-$pkgver"
  local flags="-s -w -X main.version=${pkgver} -X main.date=$(date +%FT%T%z)"

  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\" ${flags}" \
    -o bin/"$pkgname"
}

check() {
  cd "wtf-$pkgver"
  go test ./...

  # Clean mod cache for makepkg -C
  go clean -modcache
}

package() {
  cd "wtf-$pkgver"
  install -Dm755 "bin/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm644 {README,CHANGELOG}.md -t "$pkgdir/usr/share/doc/$pkgname"
  cp -r _sample_configs "$pkgdir/usr/share/doc/$pkgname/sample_configs"
}
