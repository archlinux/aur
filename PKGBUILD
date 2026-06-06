pkgname=rendermd
pkgver=1.2.2
pkgrel=1
pkgdesc='Terminal Markdown renderer with syntax-aware output, hot reload, and fuzzy search'
arch=('x86_64' 'aarch64')
url='https://github.com/kristyancarvalho/rendermd'
license=('MIT')
depends=('glibc')
makedepends=('go')
options=('!debug')
_upstream='rendermd'
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

prepare() {
  cd "${_upstream}-${pkgver}"
  go mod download
}

build() {
  cd "${_upstream}-${pkgver}"
  local build_date
  build_date="$(date -u -d "@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y-%m-%dT%H:%M:%SZ)"
  go build -buildmode=pie -trimpath -mod=readonly -modcacherw -buildvcs=false -ldflags "-linkmode=external -X main.version=v${pkgver} -X main.commit=v${pkgver} -X main.date=${build_date}" -o rendermd ./cmd/rendermd
}

check() {
  cd "${_upstream}-${pkgver}"
  go test ./...
}

package() {
  cd "${_upstream}-${pkgver}"
  install -Dm755 rendermd "${pkgdir}/usr/bin/rendermd"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 config-example.toml "${pkgdir}/usr/share/doc/${pkgname}/config-example.toml"
}
