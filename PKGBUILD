# Maintainer: Yoan Blanc <yoan@dosimple.ch>

pkgname='eclint'
pkgver=0.2.3
pkgrel=1
pkgdesc='EditorConfig linter'
url='https://gitlab.com/greut/eclint'
arch=('x86_64' 'i686')
license=('MIT')

depends=('glibc')
makedepends=('git' 'go' 'gzip')
source=(
  "${url}/uploads/e4266c2a6fe9fab19490d864e5432c20/eclint-${pkgver}.tar.gz"
  "${url}/uploads/6b4e491e638d375a72c78ff047184d60/eclint-${pkgver}.tar.gz.sig"
)
sha256sums=(
  'ff094d00951f644bed9c4297a3f83daa9aa1468ab79a19c6e5dc0438a5666d8e'
  '67d983fe5b80c84ef0b90ddd01e1b33359f50d60724e6a547c9bf7fad0f02506'
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
