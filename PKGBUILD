# Maintainer: Samuel B <samuelb@users.noreply.github.com>
pkgname=somad
_binname=soma
pkgver=0.19.1
pkgrel=1
pkgdesc='A client for streaming SomaFM radio channels'
arch=('x86_64' 'aarch64')
url='https://github.com/samuelb/somad'
license=('MIT')
# alsa-lib is loaded at run time, as the fallback when there is no
# PulseAudio or PipeWire, so namcap does not see it in the binary; Go reads
# the CA bundle that ca-certificates installs.
depends=('glibc' 'alsa-lib' 'ca-certificates')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('ece9167d053cf44720ba3efd70b84402e01e6ae6bf7f066594122d9cb2e2e7f6')

# As the Arch Go package guidelines ask: a PIE that takes makepkg's C and
# linker flags (full RELRO), and no -s -w, so makepkg strips the binary
# itself and splits its symbols off into the debug package.
_goenv() {
  export CGO_ENABLED=1
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=vendor -modcacherw -buildvcs=false"
}

build() {
  cd "${pkgname}"
  _goenv
  go build \
    -ldflags "-linkmode=external -X main.version=v${pkgver} -X main.commit=arch -X main.date=$(date -u -d "@${SOURCE_DATE_EPOCH}" +%Y-%m-%dT%H:%M:%SZ)" \
    -o "${_binname}" \
    ./cmd/soma
}

check() {
  cd "${pkgname}"
  _goenv
  go test ./...
}

package() {
  cd "${pkgname}"
  install -Dm755 "${_binname}" "${pkgdir}/usr/bin/${_binname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 cmd/soma/completions/soma.bash "${pkgdir}/usr/share/bash-completion/completions/${_binname}"
  install -Dm644 cmd/soma/completions/soma.zsh "${pkgdir}/usr/share/zsh/site-functions/_${_binname}"
  install -Dm644 packaging/systemd/soma.service "${pkgdir}/usr/lib/systemd/user/soma.service"
}
