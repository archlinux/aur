# Maintainer: Yoan Blanc <yoan@dosimple.ch>
# GPG: https://keybase.io/greut/pgp_keys.asc

pkgname='eclint'
pkgver=0.5.0
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
  "${url}/-/releases/v${pkgver}/downloads/eclint-${pkgver}.tar.gz"
  "${url}/-/releases/v${pkgver}/downloads/eclint-${pkgver}.tar.gz.sig"
)


sha256sums=('9b7dbf290403d5c8232bb3fbcadbf521f4520f2dd33dd0d24fe3eda549fc6da0'
            'SKIP')
validpgpkeys=('9E2D407EAFEE50863F42B9D16058CF4574298812')

build() {
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS='-buildmode=pie -trimpath -modcacherw'
  _flags=(
    -X=main.version=v$pkgver
    -X=main.date=$(date -u -d "@${SOURCE_DATE_EPOCH}" +'%FT%TZ')
  )
  go build -o "$pkgname" -ldflags="${_flags[*]}" ./cmd/"$pkgname"
}

check() {
  go test -v ./...
}

package() {
  install -Dm755 "$pkgname" "$pkgdir"/usr/bin/"$pkgname"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
