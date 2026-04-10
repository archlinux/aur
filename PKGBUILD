# Maintainer: Strykar <strykar@hotmail.com>
pkgname=tpmtb-git
pkgver=0.7.0.r1.gf7d9b79
pkgrel=1
pkgdesc="TPM Trust Bundle CLI - manages and verifies TPM root certificate bundles (git)"
arch=('x86_64' 'aarch64')
url="https://github.com/loicsikidi/tpm-ca-certificates"
license=('BSD-3-Clause')
depends=('ca-certificates')
optdepends=('tpm2-tools: extract EK certificate from TPM for verification')
makedepends=('go' 'git')
provides=('tpmtb')
conflicts=('tpmtb')
source=("${pkgname}::git+https://github.com/loicsikidi/tpm-ca-certificates.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname}"
  export CGO_ENABLED=1
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build \
    -ldflags "-s -w -linkmode=external -X main.version=${pkgver} -X main.builtBy=makepkg" \
    -o tpmtb .
}

check() {
  cd "${pkgname}"
  go test -short -timeout 30s ./...
}

package() {
  cd "${pkgname}"

  install -Dm755 tpmtb "${pkgdir}/usr/bin/tpmtb"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  ./tpmtb completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/tpmtb"
  ./tpmtb completion zsh  | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_tpmtb"
  ./tpmtb completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/tpmtb.fish"
}
