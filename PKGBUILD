# Maintainer: agony <27015 at riseup dot net>

pkgname=kubecm
pkgver=0.36.0
pkgrel=1
pkgdesc='Manage your kubeconfig more easily'
arch=('x86_64' 'aarch64')
url='https://github.com/sunny0826/kubecm'
license=('Apache-2.0')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ae03e76d4401c1d705a4a2684d5ba2eef8e8eb47a30df5bb80abfb65ba19f34a')

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
  go build -v -ldflags="-linkmode=external -X github.com/sunny0826/kubecm/version.Version=${pkgver}" -o kubecm .
  for shell in bash fish zsh; do
    ./kubecm completion "${shell}" > "completion.${shell}"
  done
}

check() {
  cd "${pkgname}-${pkgver}"
  export GOPATH="${srcdir}/gopath"
  export GOFLAGS='-buildvcs=false -mod=readonly -modcacherw'
  go test ./cmd/... ./pkg/...
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 kubecm -t "${pkgdir}/usr/bin"
  install -Dm644 completion.bash "${pkgdir}/usr/share/bash-completion/completions/kubecm"
  install -Dm644 completion.fish "${pkgdir}/usr/share/fish/vendor_completions.d/kubecm.fish"
  install -Dm644 completion.zsh "${pkgdir}/usr/share/zsh/site-functions/_kubecm"
}
