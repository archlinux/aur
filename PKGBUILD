# Maintainer: Yoan Blanc <yoan@dosimple.ch>

pkgname='eclint'
pkgver=v0.1.10
pkgrel=1
pkgdesc='EditorConfig linter'
url='https://gitlab.com/greut/eclint'
arch=('x86_64' 'i686')
license=('MIT')

depends=('glibc')
makedepends=('git' 'go' 'gzip')
source=("${pkgname}-${pkgver}.tar.gz::https://gitlab.com/greut/eclint/-/archive/${pkgver}/eclint-${pkgver}.tar.gz")
sha256sums=('7c9fde2e43fc8830d8c8211686623e9fbcdcbdef860e0e723df3161b0d90d408')

build() {
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS='-buildmode=pie -trimpath -modcacherw'
  _commit=$(zcat "${pkgname}-${pkgver}.tar.gz" | git get-tar-commit-id)
  _flags=(
    -X=main.version=$pkgver
    -X=main.commit=${_commit::7}
    -X=main.date=$(date -u -d "@${SOURCE_DATE_EPOCH}" +'%FT%TZ')
  )
  cd "${pkgname}-${pkgver}"
  go build -o "$pkgname" -ldflags="${_flags[*]}" ./cmd/"$pkgname"
}

check() {
  cd "${pkgname}-${pkgver}"
  go test -v ./...
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "$pkgname" "$pkgdir"/usr/bin/"$pkgname"
}
