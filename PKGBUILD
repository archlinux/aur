# Maintainer: Yoan Blanc <yoan@dosimple.ch>

pkgname='eclint'
pkgver=v0.2.2
pkgrel=2
pkgdesc='EditorConfig linter'
url='https://gitlab.com/greut/eclint'
arch=('x86_64' 'i686')
license=('MIT')

depends=('glibc')
makedepends=('git' 'go' 'gzip')
source=("${pkgname}-${pkgver}.tar.gz::https://gitlab.com/greut/eclint/-/archive/${pkgver}/eclint-${pkgver}.tar.gz")
noextract=("${pkgname}-${pkgver}.tar.gz.sig")
sha256sums=('5f127f7a722fef34c6d842c949d6489f87072be2ef378dae988c5bd68523e5fe')
validgpgkeys=('9E2D 407E AFEE 5086 3F42 B9D1 6058 CF45 7429 8812')

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
