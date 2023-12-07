# Maintainer: tarball <bootctl@gmail.com>

pkgname=ladder
pkgver=0.0.21
pkgrel=1
pkgdesc='Bypass paywalls and remove CORS headers from any URL'
url='https://github.com/everywall/ladder'
arch=(i686 x86_64 aarch64 riscv64)
license=(GPL3)
depends=(glibc)
makedepends=(go)
backup=(etc/$pkgname/ruleset.yaml)
source=(git+$url.git#tag=v$pkgver ruleset.yaml ladder.service)
sha256sums=('SKIP'
            '9717057548ec40f5b9e4caa7d960dd95dd9821eef3cbeffd2110ed5a79e1972d'
            '3557270490a1e12d6f64a2afad9392225f738d7b551328120cbcfbdb8c192970')

prepare() {
  cd "$srcdir/$pkgname"
  go mod download
  git describe --tags --abbrev=0 >handlers/VERSION
}

build() {
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'

  cd "$srcdir/$pkgname"
  go build -o $pkgname ./cmd/main.go
}

check() {
  cd "$srcdir/$pkgname"
  go test ./...
}

package() {
  install -Dm644 ruleset.yaml "$pkgdir/etc/$pkgname/ruleset.yaml"
  install -Dm644 $pkgname.service "$pkgdir/usr/lib/systemd/system/$pkgname.service"

  cd "$srcdir/$pkgname"
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
