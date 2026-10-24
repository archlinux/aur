# Maintainer: agony <27015 at riseup dot net>

pkgname=pgtui
pkgver=0.3.0
pkgrel=1
pkgdesc="Simple terminal UI for PostgreSQL"
arch=('x86_64' 'aarch64')
url="https://github.com/pgplex/pgtui"
license=('MIT')
depends=('glibc' 'sqlite')
makedepends=('go')
optdepends=('wl-clipboard: clipboard support on Wayland'
            'xclip: clipboard support on X11')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('8640afd41927abcf8cb510c0b85276af4e038ed7b984c6b7cdaa2bd73fb7b043')

prepare() {
  cd "${pkgname}-${pkgver}"
  mkdir -p build
  export GOPATH="${srcdir}"
  go mod download -modcacherw
}

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOPATH="${srcdir}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  # go-sqlite3 needs cgo; libsqlite3 links the system SQLite
  go build -tags libsqlite3 -o build ./cmd/...
}

check() {
  cd "${pkgname}-${pkgver}"
  export GOPATH="${srcdir}"
  export GOFLAGS="-mod=readonly -modcacherw"
  go test -tags libsqlite3 ./...
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 build/pgtui -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 README.md docs/USER_GUIDE.md config/default.yaml -t "${pkgdir}/usr/share/doc/${pkgname}"
}
