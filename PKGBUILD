# Maintainer: Chmouel Boudjnah <chmouel@chmouel.com>

pkgname=tkn-pac
pkgver=0.5.2
pkgrel=1
pkgdesc="CLI for interacting with Openshift Pipelines as Code"
arch=('x86_64')
url="https://github.com/openshift-pipelines/pipelines-as-code"
license=('Apache')
makedepends=('go')
depends=('glibc' 'kubectl' 'tekton-cli')
source=( ${pkgname}_${pkgver}-${pkgrel}.tar.gz::https://github.com/openshift-pipelines/pipelines-as-code/archive/refs/tags/${pkgver}.tar.gz )
sha512sums=('b6d34f2830addd3916e011f88b5f86d90289af6d4d9a68b0d8915cb632d414bcc25633103d99ceec675002169cd5ebe27b824716351048abe57dff2549edbcb1')

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
