# Maintainer: Yoan Blanc <yoan@dosimple.ch>

pkgname='eclint'
pkgver=0.2.9
pkgrel=1
pkgdesc='EditorConfig linter'
url='https://gitlab.com/greut/eclint'
arch=('x86_64' 'i686')
license=('MIT')

depends=('glibc')
makedepends=('git' 'go' 'gzip')
checkdepends=('git' 'go')
optdepends=('git: Git repository support')
source=(
  "${url}/uploads/398421622b7bf9eb41e1b0cb9ed93cac/eclint-${pkgver}.tar.gz"
  "${url}/uploads/c339db474625b66e6a84bf971c756157/eclint-${pkgver}.tar.gz.sig"
)

sha256sums=(
  'f13611fea7b9b5459392fd782e3371276889b7dcd2010b7205ed36d384808f81'
  'fcf201e5dd7787a85b148c0b6c05dc0a5c925fc1d090f3b27778e62da535b4ad'
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
