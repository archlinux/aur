# Maintainer: Yoan Blanc <yoan@dosimple.ch>

pkgname='eclint'
pkgver=0.2.4
pkgrel=1
pkgdesc='EditorConfig linter'
url='https://gitlab.com/greut/eclint'
arch=('x86_64' 'i686')
license=('MIT')

depends=('glibc')
makedepends=('git' 'go' 'gzip')
source=(
  "${url}/uploads/77e786bb14145c1d6b2aadeb277c15bf/eclint-${pkgver}.tar.gz"
  "${url}/uploads/2234a0cd6088fcb2ef9d367877774272/eclint-${pkgver}.tar.gz.sig"
)

sha256sums=(
  '068d44e45f73e1f7ec0187afbf6e9f2cf11e32b90776a8144ef2fefe8a5012ce'
  'e2ea8241178d02593a0ee22a1dee0330f2ea31659a72f2f73787a34c4102c59a'
)
validpgpkeys=('9E2D407EAFEE50863F42B9D16058CF4574298812')

build() {
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS='-buildmode=pie -trimpath -modcacherw'
  _commit=$(zcat "${pkgname}-${pkgver}.tar.gz" | git get-tar-commit-id)
  _flags=(
    -X=main.version=v$pkgver
    -X=main.commit=${_commit::7}
    -X=main.date=$(date -u -d "@${SOURCE_DATE_EPOCH}" +'%FT%TZ')
  )
  go build -o "$pkgname" -ldflags="${_flags[*]}" ./cmd/"$pkgname"
}

check() {
  go test -v ./...
}

package() {
  install -Dm755 "$pkgname" "$pkgdir"/usr/bin/"$pkgname"
}
