# Maintainer: ml <ml@visu.li>
pkgname=helmsman
pkgver=3.5.0
pkgrel=1
pkgdesc='Helm Charts as Code'
arch=('x86_64' 'i686')
url='https://github.com/Praqma/helmsman'
license=('MIT')
depends=('helm-diff' 'kubectl')
optdepends=(
  'ruby-hiera-eyaml: backend for secret encryption'
  'helm-secrets: backend for secret encryption')
makedepends=('go')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('f700de27d35324e7a848e7437faed7b0edc3c868ca931f52e314db99da4e632c')

prepare() {
  cd "${pkgname}-${pkgver}"
  go mod download
}

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_ENABLED=1
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export GOFLAGS='-buildmode=pie -modcacherw -mod=readonly -trimpath'
  # man makepkg(8), https://github.com/Praqma/helmsman/blob/master/Makefile
  TZ=UTC printf -v _date '%(%d%m%y)T' ${SOURCE_DATE_EPOCH:-}
  go build -o "$pkgname" -ldflags "-linkmode=external -X main.version=v${pkgver}-${_date}" ./cmd/helmsman
}

check() {
  cd "${pkgname}-${pkgver}"
  go test ./...
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "$pkgname" -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"

  # README, docs and examples
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  cp -a docs examples -t "${pkgdir}/usr/share/doc/${pkgname}"
}
