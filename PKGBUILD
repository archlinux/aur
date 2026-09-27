# Maintainer: Lourenço Vales <lvales@excipio.tech>

pkgname=gnmic
pkgver=0.49.0
pkgrel=1
pkgdesc='gNMI CLI client and collector'
arch=('x86_64' 'aarch64')
url='https://github.com/openconfig/gnmic'
license=('Apache-2.0')
depends=('glibc')
makedepends=('git' 'go')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('59c238fb3c5e8b7280e6d743cf2f569fdf0abe2f2b8fe147871ceaf22f59a0ba')

prepare() {
  cd "$pkgname-$pkgver"
  export GOPATH="${srcdir}"
  GOFLAGS="-mod=readonly" go mod vendor -v
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -mod=vendor -modcacherw"
  export GOPATH="${srcdir}"

  local _commit='d461eac'
  local _ldflags="
    -linkmode=external
    -extldflags \"${LDFLAGS}\"
    -s -w
    -X github.com/openconfig/gnmic/pkg/version.Version=v${pkgver}
    -X github.com/openconfig/gnmic/pkg/version.Commit=${_commit}
    -X github.com/openconfig/gnmic/pkg/version.Date=NOTSET
    -X github.com/openconfig/gnmic/pkg/version.GitURL=${url}
  "

  go build \
    -trimpath \
    -ldflags "${_ldflags}" \
    -o "$pkgname" \
    .
}

check() {
  cd "$pkgname-$pkgver"
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"

  "$pkgdir/usr/bin/$pkgname" completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  "$pkgdir/usr/bin/$pkgname" completion zsh  | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
  "$pkgdir/usr/bin/$pkgname" completion fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"
}
