# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=goenv
pkgver=3.1.0
pkgrel=3
pkgdesc="Like pyenv and rbenv, but for Go."

license=('MIT')
arch=('x86_64' 'i686')
url="https://github.com/go-nv/goenv"
depends=('bash')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
md5sums=('8858af7b7d66ef3528d4a06db2dd90e5')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p build/
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  export GOPATH="${srcdir}/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  if [ -f "cmd/goenv/main.go" ]; then
    go build -o build/goenv ./cmd/goenv/
  elif [ -d "cmd" ] && ls cmd/*/main.go &>/dev/null 2>&1; then
    go build -o build/ ./cmd/...
  else
    go build -o build/goenv .
  fi
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 "build/goenv" "${pkgdir}/usr/bin/goenv"
  install -d "${pkgdir}/usr/lib/goenv"
  cp -a . "${pkgdir}/usr/lib/goenv/"
  rm -rf "${pkgdir}/usr/lib/goenv/"{.github,.gitignore,build} 2>/dev/null || true
  echo "${pkgver}" > "${pkgdir}/usr/lib/goenv/APP_VERSION"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md" 2>/dev/null || true
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" 2>/dev/null || true
}
