# Maintainer: WinnerWind <contact@winnerwind.in>

pkgname=termcourse
pkgver=0.4.0
pkgrel=1
pkgdesc='Terminal UI client for browsing and posting to Discourse forums'
arch=('x86_64' 'aarch64')
url='https://github.com/merefield/termcourse'
license=('MIT')
depends=('glibc')
makedepends=('go>=1.27.4')
optdepends=(
  'chafa: colored symbol image rendering fallback'
  'viu: secondary image rendering fallback'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP') # run `updpkgsums` to fill this in

prepare() {
  cd "$pkgname-$pkgver"
  export GOFLAGS='-modcacherw'
  go mod download
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw -buildvcs=false'
  export GOTOOLCHAIN=local

  go build \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
    -o termcourse \
    ./cmd/termcourse
}

check() {
  cd "$pkgname-$pkgver"
  export GOFLAGS='-mod=readonly -modcacherw'
  export GOTOOLCHAIN=local
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 termcourse "$pkgdir/usr/bin/termcourse"

  install -Dm644 LICENSE   "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/COPYRIGHT"

  install -Dm644 README.md             "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 .env.example          "$pkgdir/usr/share/doc/$pkgname/env.example"
  install -Dm644 credentials.example.yml "$pkgdir/usr/share/doc/$pkgname/credentials.example.yml"
  install -Dm644 theme.example.yml     "$pkgdir/usr/share/doc/$pkgname/theme.example.yml"
}

