# Maintainer: Yoan Blanc <yoan@dosimple.ch>
# GPG: https://keybase.io/greut/pgp_keys.asc

pkgname='eclint'
pkgver=0.2.10
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
  "${url}/uploads/0c3508cb73da403042121cee07e293f6/eclint-${pkgver}.tar.gz"
  "${url}/uploads/2f76e78f763bbdc3530261efe786cdfb/eclint-${pkgver}.tar.gz.sig"
)

sha256sums=(
  'cfc8c27507a52da1cab9a9f520a7b885b5dcc377331b0033a68fc32e14584137'
  'SKIP'
)
validpgpkey=('9E2D407EAFEE50863F42B9D16058CF4574298812')

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
