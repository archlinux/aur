# Maintainer: Yoan Blanc <yoan@dosimple.ch>
# GPG: https://keybase.io/greut/pgp_keys.asc

pkgname='eclint'
pkgver=0.3.1
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
  "${url}/uploads/9feaf615dfcf34209410e7a61d01844c/eclint-${pkgver}.tar.gz"
  "${url}/uploads/df01647c32131e62905e56c5d8183b58/eclint-${pkgver}.tar.gz.sig"
)

sha256sums=('291f445d62955cc837fac447a36253737cce332f7cdd7d39a5e923e9411ca813'
            'SKIP')
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
