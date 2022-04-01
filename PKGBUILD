# Maintainer: Chmouel Boudjnah <chmouel@chmouel.com>

pkgname=tkn-pac
pkgver=0.5.6
pkgrel=1
pkgdesc="CLI for interacting with Openshift Pipelines as Code"
arch=('x86_64')
url="https://github.com/openshift-pipelines/pipelines-as-code"
license=('Apache')
makedepends=('go')
depends=('glibc' 'kubectl' 'tekton-cli')
source=( ${pkgname}_${pkgver}-${pkgrel}.tar.gz::https://github.com/openshift-pipelines/pipelines-as-code/archive/refs/tags/${pkgver}.tar.gz )
sha512sums=('679db0bbd5a676bbc4271a9536d45404d41a9ee8b881e844f1fb96c41600fae079179000e37809675ee53c7574b079dd7d088cda46c30170f0edb28211974e82')

build() {
  cd "pipelines-as-code-${pkgver}/cmd/tkn-pac"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -ldflags="-linkmode=external -X github.com/openshift-pipelines/pipelines-as-code/pkg/params/version.Version=${pkgver}" .
  chmod +x ./tkn-pac
  ./tkn-pac completion bash > "${pkgname}-completion.bash"
  ./tkn-pac completion zsh > "${pkgname}-completion.zsh"
}

package() {
  cd "pipelines-as-code-${pkgver}/cmd/tkn-pac"
  install -Dsm755 ./tkn-pac "${pkgdir}/usr/bin/tkn-pac"
  install -Dm644 "${pkgname}-completion.bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  install -Dm644 "${pkgname}-completion.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
}
