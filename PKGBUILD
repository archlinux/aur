# Maintainer: Aurel Canciu <aurelcanciu@gmail.com>
# Maintainer: Hidde Beydals <hello@hidde.co>

pkgname=flux-go
pkgver=0.40.2
pkgrel=1
pkgdesc="Open and extensible continuous delivery solution for Kubernetes"
url="https://fluxcd.io/"
arch=("x86_64" "armv6h" "armv7h" "aarch64")
license=("APACHE")
provides=("flux-bin")
conflicts=("flux-bin")
replaces=("flux-cli")
depends=("glibc")
makedepends=('go>=1.17', 'kustomize>=3.0')
optdepends=('bash-completion: auto-completion for flux in Bash',
'zsh-completions: auto-completion for flux in ZSH')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/fluxcd/flux2/archive/v${pkgver}.tar.gz"
)
sha256sums=(
  9bfa38503352e638e16cc5b4ca297ae5e42789526bcd06b5bf60d8e4a47534ae
)
_srcname=flux

build() {
  cd "flux2-${pkgver}"
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  make cmd/flux/.manifests.done
  go build -ldflags "-linkmode=external -X main.VERSION=${pkgver}" -o ${_srcname} ./cmd/flux
}

check() {
  cd "flux2-${pkgver}"
  case $CARCH in
    aarch64)
      export ENVTEST_ARCH=arm64
      ;;
    armv6h|armv7h)
      export ENVTEST_ARCH=arm
      ;;
  esac
  make test
}

package() {
  cd "flux2-${pkgver}"
  install -Dm755 ${_srcname} "${pkgdir}/usr/bin/${_srcname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  "${pkgdir}/usr/bin/${_srcname}" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${_srcname}"
  "${pkgdir}/usr/bin/${_srcname}" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${_srcname}.fish"
  "${pkgdir}/usr/bin/${_srcname}" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${_srcname}"
}
