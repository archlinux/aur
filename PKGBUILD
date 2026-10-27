# Maintainer: agony <27015 at riseup dot net>

pkgname=pg-schema-diff
pkgver=1.0.9
pkgrel=1
pkgdesc='Diff PostgreSQL schemas and generate SQL migrations'
arch=('x86_64' 'aarch64')
url='https://github.com/stripe/pg-schema-diff'
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha256sums=('f872febc4bbdc79be47904ea5e003b282345eeb3a75ef4245d61920f90092c4c')

prepare() {
  cd "${pkgname}"
  export GOPATH="${srcdir}/gopath"
  go mod download -x -modcacherw
}

build() {
  cd "${pkgname}"
  export GOPATH="${srcdir}/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'
  # Go stamps the version from the git tag; an untracked file in the clone adds +dirty
  go build -v -ldflags=-linkmode=external -o "${srcdir}/build/" ./cmd/pg-schema-diff
  cd "${srcdir}/build"
  for shell in bash fish zsh; do
    ./pg-schema-diff completion "${shell}" > "completion.${shell}"
  done
}

check() {
  cd "${pkgname}"
  export GOPATH="${srcdir}/gopath"
  export GOFLAGS='-buildvcs=false -mod=readonly -modcacherw'
  # The tests of the other packages start a local PostgreSQL server
  go test ./internal/{concurrent,graph,pgidentifier,set,util}
}

package() {
  cd "${srcdir}/build"
  install -Dm755 pg-schema-diff -t "${pkgdir}/usr/bin"
  install -Dm644 completion.bash "${pkgdir}/usr/share/bash-completion/completions/pg-schema-diff"
  install -Dm644 completion.fish "${pkgdir}/usr/share/fish/vendor_completions.d/pg-schema-diff.fish"
  install -Dm644 completion.zsh "${pkgdir}/usr/share/zsh/site-functions/_pg-schema-diff"
  install -Dm644 "${srcdir}/${pkgname}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
