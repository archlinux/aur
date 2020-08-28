# Maintainer: Yoan Blanc <yoan@dosimple.ch>

pkgname='passgo'
pkgver=2.1.0
pkgrel=1
pkgdesc='Simple golang password manager.'
url='https://github.com/ejcx/passgo'
arch=('x86_64' 'i686')
license=('MIT')

depends=('glibc')
makedepends=('git' 'go')
checkdepends=('go')
source=(
  "${url}/archive/v${pkgver}.tar.gz"
)

sha256sums=(
  '6de3b0cfce92f68dc1e6090841cba822cad7673625effc50bee83ad1df75ff73'
)

build() {
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS='-buildmode=pie -trimpath -modcacherw'
  _commit=$(zcat "v${pkgver}.tar.gz" | git get-tar-commit-id)
  _flags=(
    -X=main.version=v$pkgver
    -X=main.commit=${_commit::7}
    -X=main.date=$(date -u -d "@${SOURCE_DATE_EPOCH}" +'%FT%TZ')
  )
  pushd "${pkgname}-${pkgver}"
  go build -o "$pkgname" -ldflags="${_flags[*]}"
  popd
}

check() {
  pushd "${pkgname}-${pkgver}"
  go test -v ./...
  popd
}

package() {
  pushd "${pkgname}-${pkgver}"
  install -Dm755 "$pkgname" "$pkgdir"/usr/bin/"$pkgname"
  popd
}
