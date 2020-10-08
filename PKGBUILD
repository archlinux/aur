# Maintainer: ml <ml@visu.li>
pkgname=helmsman
pkgver=3.4.6
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
sha256sums=('53f4ced9d274f7af7efd7462c77ed5536971efe5480e7ed9e1a3cc067acfadb2')

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
  export GOFLAGS='-buildmode=pie -modcacherw -mod=readonly -trimpath -ldflags=-linkmode=external'
  # man makepkg(8), https://github.com/Praqma/helmsman/blob/master/Makefile
  TZ=UTC printf -v _date '%(%d%m%y)T' ${SOURCE_DATE_EPOCH:-}
  go build -o "$pkgname" -ldflags "-X main.version=v${pkgver}-${_date}" ./cmd/helmsman
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
