# Maintainer: arslee07 <mail@arslee.me>

pkgname=wrtag
pkgver=0.34.0
pkgrel=1
pkgdesc='Fast automated music tagging and organisation based on MusicBrainz'
arch=('x86_64' 'aarch64')
url='https://github.com/sentriz/wrtag'
license=('GPL-3.0-only')
depends=('glibc')
makedepends=('go')
options=('!lto')
optdepends=(
  'rsgain: ReplayGain addon support'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/sentriz/wrtag/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d364156026160473b6280321911fc41810203bbca4905e7d135a9c7dbba71562')

prepare() {
  cd "$pkgname-$pkgver"
  export GOPATH="$srcdir"
  export GOFLAGS='-mod=readonly -modcacherw'
  go mod vendor -v
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_ENABLED=0
  export GOPATH="$srcdir"
  export GOFLAGS='-buildmode=pie -trimpath -mod=vendor -modcacherw'
  go build -o build/ ./cmd/...
}

check() {
  cd "$pkgname-$pkgver"
  export CGO_ENABLED=0
  export GOFLAGS='-mod=vendor'
  go test ./...

  # make sure the tag, version.txt, and pkgver agree
  test "$(build/wrtag -version | awk '{print $2}')" = "$pkgver"
  test "$(build/wrtagweb -version | awk '{print $2}')" = "$pkgver"
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 build/wrtag -t "$pkgdir/usr/bin"
  install -Dm755 build/wrtagweb -t "$pkgdir/usr/bin"
  install -Dm755 build/metadata -t "$pkgdir/usr/bin"

  install -Dm644 config.example "$pkgdir/usr/share/doc/$pkgname/config.example"
  install -Dm644 LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENCE"

  install -Dm644 contrib/completions/wrtag.fish "$pkgdir/usr/share/fish/vendor_completions.d/wrtag.fish"
  install -Dm644 contrib/completions/metadata.fish "$pkgdir/usr/share/fish/vendor_completions.d/metadata.fish"
  install -Dm644 contrib/completions/wrtag.bash "$pkgdir/usr/share/bash-completion/completions/wrtag"
}
