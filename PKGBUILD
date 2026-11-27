# Maintainer: agony <27015 at riseup dot net>

pkgname=arcane-cli
pkgver=3.2.0
pkgrel=1
pkgdesc='Official command line interface for Arcane, modern Docker management'
arch=('x86_64' 'aarch64' 'armv7h' 'riscv64')
url='https://github.com/getarcaneapp/arcane'
license=('BSD-3-Clause')
depends=('glibc')
makedepends=('go')
source=("arcane-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('81ee9fc24ab86bbabbfa04e8a9f388c9e8e31ad3de4a2b122126ee4c7704f6d9')

prepare() {
  cd "arcane-${pkgver}/cli"
  export GOPATH="${srcdir}/gopath"
  export GOWORK=off
  go mod download -x -modcacherw
}

build() {
  cd "arcane-${pkgver}/cli"
  export GOPATH="${srcdir}/gopath"
  export GOWORK=off
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS='-buildmode=pie -trimpath -buildvcs=false -mod=readonly -modcacherw'
  go build -v -ldflags="-linkmode=external -X getarcane.dev/cli/v3/internal/config.Version=${pkgver}" -o arcane-cli .
  for shell in bash fish zsh; do
    ./arcane-cli completion "${shell}" > "completion.${shell}"
  done
}

check() {
  cd "arcane-${pkgver}/cli"
  export GOPATH="${srcdir}/gopath"
  export GOWORK=off
  export GOFLAGS='-buildvcs=false -mod=readonly -modcacherw'
  go test ./...
}

package() {
  cd "arcane-${pkgver}/cli"
  install -Dm755 arcane-cli -t "${pkgdir}/usr/bin"
  install -Dm644 completion.bash "${pkgdir}/usr/share/bash-completion/completions/arcane-cli"
  install -Dm644 completion.fish "${pkgdir}/usr/share/fish/vendor_completions.d/arcane-cli.fish"
  install -Dm644 completion.zsh "${pkgdir}/usr/share/zsh/site-functions/_arcane-cli"
  install -Dm644 ../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
