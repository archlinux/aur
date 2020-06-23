# Maintainer: Yoan Blanc <yoan@dosimple.ch>

pkgname='eclint'
pkgver=0.2.5
pkgrel=1
pkgdesc='EditorConfig linter'
url='https://gitlab.com/greut/eclint'
arch=('x86_64' 'i686')
license=('MIT')

depends=('glibc')
makedepends=('git' 'go' 'gzip')
source=(
  "${url}/uploads/db21fb8ce7f5a935ee211493c691c779/eclint-${pkgver}.tar.gz"
  "${url}/uploads/bc4f943624a4fb62d7c278d68724b477/eclint-${pkgver}.tar.gz.sig"
)

sha256sums=(
  '4fc02ba4f7817bba5edcfd54f76147b5fed465aee224b40d9c1f09976ec6cad7'
  '30a41948759c8700d943183f48a64c485e48f3b1edf1efaee7d7cd3251119af2'
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
