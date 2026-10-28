# Maintainer: agony <27015 at riseup dot net>

pkgname=oasdiff
pkgver=1.35.0
pkgrel=1
pkgdesc='Diff and breaking changes for OpenAPI specifications'
arch=('x86_64' 'aarch64')
url='https://github.com/oasdiff/oasdiff'
license=('Apache-2.0')
depends=('glibc')
makedepends=('go')
checkdepends=('git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('976468914e9b36d1daeca3336841e55249b3af7bf2aabb29bd2c8ed768e8ddd0')

prepare() {
  cd "${pkgname}-${pkgver}"
  export GOPATH="${srcdir}/gopath"
  go mod download -x -modcacherw
}

build() {
  cd "${pkgname}-${pkgver}"
  export GOPATH="${srcdir}/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS='-buildmode=pie -trimpath -buildvcs=false -mod=readonly -modcacherw'
  go build -v -ldflags="-linkmode=external -X github.com/oasdiff/oasdiff/build.Version=${pkgver}" -o oasdiff .
  for shell in bash fish zsh; do
    ./oasdiff completion "${shell}" > "completion.${shell}"
  done
}

check() {
  cd "${pkgname}-${pkgver}"
  export GOPATH="${srcdir}/gopath"
  export GOFLAGS='-buildvcs=false -mod=readonly -modcacherw'
  # The git tests commit in temporary repositories; a global commit.gpgsign
  # would make them sign with the user's key
  export GIT_CONFIG_GLOBAL=/dev/null GIT_CONFIG_NOSYSTEM=1
  go test ./...
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 oasdiff -t "${pkgdir}/usr/bin"
  install -Dm644 completion.bash "${pkgdir}/usr/share/bash-completion/completions/oasdiff"
  install -Dm644 completion.fish "${pkgdir}/usr/share/fish/vendor_completions.d/oasdiff.fish"
  install -Dm644 completion.zsh "${pkgdir}/usr/share/zsh/site-functions/_oasdiff"
}
