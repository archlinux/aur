# Maintainer: Anton Afanasyev <aasoft+aur@pm.me>

pkgname=thunder-cli
pkgver=2.0.49
pkgrel=1
pkgdesc='Official CLI for Thunder Compute'
arch=('x86_64')
url='https://github.com/Thunder-Compute/thunder-cli'
license=('MIT')
depends=('glibc')
makedepends=('go')
optdepends=(
  'openssh: required for tnr scp and ssh-keygen known_hosts cleanup'
  'rsync: faster transfers for tnr scp'
  'xdg-utils: open the browser automatically during tnr login'
)
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
  'pacman-package-manager.patch'
)
sha256sums=(
  '7bb57b79238f7e2f852b8898680612c6209d0c8bee2355d3356b31acd0dadc95'
  '69a28f9ea239f8ed11310596bc3ba8e3ec92722a7807d8426dbcca3c475185f9'
)

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np1 -i "$srcdir/pacman-package-manager.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  export CGO_ENABLED=1
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOCACHE="$srcdir/go-build"
  export GOPATH="$srcdir/go"
  export GOMODCACHE="$GOPATH/pkg/mod"
  export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'

  local build_date
  build_date=$(date -u -d "@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y-%m-%dT%H:%M:%SZ)

  go build \
    -ldflags "-linkmode=external -X github.com/Thunder-Compute/thunder-cli/internal/version.BuildVersion=$pkgver -X github.com/Thunder-Compute/thunder-cli/internal/version.BuildDate=$build_date" \
    -o build/tnr \
    .
}

check() {
  cd "$srcdir/$pkgname-$pkgver"

  export CGO_ENABLED=1
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOCACHE="$srcdir/go-build"
  export GOPATH="$srcdir/go"
  export GOMODCACHE="$GOPATH/pkg/mod"
  export GOFLAGS='-trimpath -mod=readonly -modcacherw'

  go test ./...
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 build/tnr "$pkgdir/usr/bin/tnr"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

  ./build/tnr completion bash > tnr.bash
  ./build/tnr completion zsh > _tnr
  ./build/tnr completion fish > tnr.fish

  install -Dm644 tnr.bash "$pkgdir/usr/share/bash-completion/completions/tnr"
  install -Dm644 _tnr "$pkgdir/usr/share/zsh/site-functions/_tnr"
  install -Dm644 tnr.fish "$pkgdir/usr/share/fish/vendor_completions.d/tnr.fish"
}
