# Maintainer: LekkerKofi

pkgname=flux-operator-git
_pkgname=flux-operator
pkgver=v0.45.1.r30.gdce6b40
pkgrel=1
pkgdesc="GitOps on Autopilot Mode"
arch=('x86_64' 'aarch64')
url="https://fluxoperator.dev"
license=('AGPL-3.0-only')
depends=(glibc)
makedepends=(git go)
options=(!lto)
conflicts=('flux-operator')
provides=('flux-operator')
source=("flux-operator::git+https://github.com/controlplaneio-fluxcd/flux-operator")
sha256sums=('SKIP')

prepare() {
  cd "$_pkgname"

  # download dependencies
  export GOPATH="${srcdir}"
  go mod download -modcacherw
}

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -mod=readonly -modcacherw"
  export GOPATH="${srcdir}"

  local ld_flags=" \
    -compressdwarf=false \
    -linkmode=external \
    -X main.VERSION=${pkgver} \
  "

  go build -v -ldflags "$ld_flags" -o flux-operator ./cmd/cli
}

check() {
  cd "$_pkgname"

  ./flux-operator version --client | grep "${pkgver}"
}

package() {
  cd "$_pkgname"

  install -vDm755 -t "$pkgdir/usr/bin" flux-operator

  ./flux-operator completion bash | install -vDm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/flux-operator"
  ./flux-operator completion fish | install -vDm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/flux-operator.fish"
  ./flux-operator completion zsh | install -vDm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_flux-operator"
}
