# Maintainer: Aurel Canciu <aurelcanciu@gmail.com>
# Maintainer: Hidde Beydals <hello@hidde.co>

pkgname=flux-go
pkgver=2.2.2
pkgrel=1
_srcname=flux
_srcver=2.2.2
pkgdesc="Open and extensible continuous delivery solution for Kubernetes"
url="https://fluxcd.io/"
arch=("x86_64" "armv7h" "aarch64")
license=("APACHE")
provides=("flux-bin")
conflicts=("flux-bin")
replaces=("flux-cli")
depends=("glibc")
makedepends=('go>=1.20', 'kustomize>=5.0')
optdepends=('bash-completion: auto-completion for flux in Bash',
'zsh-completions: auto-completion for flux in ZSH')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/fluxcd/flux2/archive/v${_srcver}.tar.gz"
)
sha256sums=(
  08dcc510f840fb06047e83f8fa4b1f69495d787e64edb1ce918c24cef5fd992c
)

build() {
  cd "flux2-${_srcver}"
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  make cmd/flux/.manifests.done
  go build -ldflags "-linkmode=external -X main.VERSION=${_srcver}" -o ${_srcname} ./cmd/flux
}

check() {
  cd "flux2-${_srcver}"
  case $CARCH in
    aarch64)
      export ENVTEST_ARCH=arm64
      ;;
    armv7h)
      export ENVTEST_ARCH=arm
      ;;
  esac
  make test
}

package() {
  cd "flux2-${_srcver}"
  install -Dm755 ${_srcname} "${pkgdir}/usr/bin/${_srcname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  "${pkgdir}/usr/bin/${_srcname}" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${_srcname}"
  "${pkgdir}/usr/bin/${_srcname}" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${_srcname}.fish"
  "${pkgdir}/usr/bin/${_srcname}" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${_srcname}"
}
