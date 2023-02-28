# Maintainer: Aurel Canciu <aurelcanciu@gmail.com>
# Maintainer: Hidde Beydals <hello@hidde.co>

pkgname=flux-scm
pkgver=0.40.2
pkgrel=1
pkgdesc="Open and extensible continuous delivery solution for Kubernetes"
url="https://fluxcd.io/"
arch=("x86_64" "armv6h" "armv7h" "aarch64")
license=("APACHE")
provides=("flux-bin")
conflicts=("flux-bin")
depends=("glibc")
makedepends=('go>=1.17', 'kustomize>=3.0', 'git')
optdepends=('bash-completion: auto-completion for flux in Bash',
'zsh-completions: auto-completion for flux in ZSH')
source=(
  "git+https://github.com/fluxcd/flux2.git"
)
md5sums=('SKIP')
_srcname=flux

pkgver() {
  cd "flux2"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "flux2"
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  make cmd/flux/.manifests.done
  go build -ldflags "-linkmode=external -X main.VERSION=${pkgver}" -o ${_srcname} ./cmd/flux
}

check() {
  cd "flux2"
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
  cd "flux2"
  install -Dm755 ${_srcname} "${pkgdir}/usr/bin/${_srcname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  "${pkgdir}/usr/bin/${_srcname}" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${_srcname}"
  "${pkgdir}/usr/bin/${_srcname}" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${_srcname}.fish"
  "${pkgdir}/usr/bin/${_srcname}" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${_srcname}"
}
