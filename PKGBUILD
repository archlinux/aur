# Maintainer: Mark Collins <tera_1225 hat hotmail ðot com>

pkgname=simplelogin-cli
pkgdesc="Command-line interface for SimpleLogin"
pkgver=0.4.0
pkgrel=1
arch=(x86_64)
url="https://github.com/mexcool/${pkgname}"
license=('GPL-3.0-or-later')
depends=(
  'glibc'
)
makedepends=(
  'go'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('651ccb7a557e2cb0aebe1ac795b2ba3ad801700df3484c28133b7860aa8f63ee875ab788a3ee6700a5af9705e6643843751a9a62a9ab22c36c5fc6e15bc902cc')


prepare() {
  cd "${pkgname}-${pkgver}"
  export GOPATH="${srcdir}"
  go mod download -modcacherw
}

build() {
  cd ${pkgname}-${pkgver}
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  
  go build -o simplelogin-cli ./cmd/sl/
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm755 simplelogin-cli "${pkgdir}/usr/bin/simplelogin-cli"
  echo "Generating shell completion script for bash"
  mkdir -p "${pkgdir}/usr/share/bash-completion/completions/"
  ./simplelogin-cli completion bash > "${pkgdir}/usr/share/bash-completion/completions/$pkgname"
  echo "Generating shell completion script for fish"
  mkdir -p "${pkgdir}/usr/share/fish/vendor_completions.d/"
  ./simplelogin-cli completion fish > "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
  echo "Generating shell completion script for zsh"
  mkdir -p "${pkgdir}/usr/share/zsh/site-functions/"
  ./simplelogin-cli completion zsh  > "${pkgdir}/usr/share/zsh/site-functions/_$pkgname"
}
