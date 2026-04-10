# Maintainer: Strykar <strykar@hotmail.com>
pkgname=tpm-trust-git
pkgver=0.3.0rc9.r0.g4c0308e
pkgrel=1
pkgdesc="Verify TPM authenticity by validating its EK certificate against manufacturer root CAs"
arch=('x86_64' 'aarch64')
url="https://github.com/loicsikidi/tpm-trust"
license=('BSD-3-Clause')
depends=('ca-certificates')
makedepends=('go' 'git')
install=tpm-trust.install
provides=("${pkgname%-git}=${pkgver}")
conflicts=('tpm-trust')
source=("${pkgname}::git+https://github.com/loicsikidi/tpm-trust.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  ( set -o pipefail
    git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^v//;s/-rc/rc/;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

prepare() {
  cd "${pkgname}"
  export GOPATH="${srcdir}"
  go mod download -modcacherw
}

build() {
  cd "${pkgname}"
  export CGO_ENABLED=1
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOPATH="${srcdir}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\" -X main.version=v${pkgver} -X main.builtBy=makepkg" \
    -o tpm-trust .
}

check() {
  cd "${pkgname}"
  export GOPATH="${srcdir}"
  go test -short -timeout 30s ./...
}

package() {
  cd "${pkgname}"

  install -Dm755 tpm-trust "${pkgdir}/usr/bin/tpm-trust"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"

  ./tpm-trust completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/tpm-trust"
  ./tpm-trust completion zsh  | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_tpm-trust"
  ./tpm-trust completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/tpm-trust.fish"
}
