# Maintainer: ml <ml@visu.li>
pkgname=kubectl-ingress-nginx
_pkgname=${pkgname#kubectl-}-controller
_bin=kubectl-ingress_nginx
pkgver=0.33.0
pkgrel=1
pkgdesc='kubectl plugin for managing NGINX Ingress Controller for Kubernetes'
arch=('x86_64')
url='https://github.com/kubernetes/ingress-nginx'
license=('Apache')
depends=('glibc')
makedepends=('go' 'git')
groups=('kubectl-plugins')
source=("${url}/archive/controller-${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('a7977350b60bee377c441082067bd58b1dbc1cede504f66069b35efa5d6ea817')

prepare() {
  cd "${_pkgname}-${pkgver}"
  go mod download
}

build() {
  local commit=
  commit=$(bsdcat "${pkgname}-${pkgver}.tar.gz" | git get-tar-commit-id)

  local -a x=(
    COMMIT="${commit:?}"
    RELEASE="controller-${pkgver}"
    REPO="$url"
  )
  cd "${_pkgname}-${pkgver}"
  # enforce CGO_ENABLED=1 so the build does not break for AUR users having CGO_ENABLED=0
  export CGO_ENABLED=1
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export GOFLAGS='-buildmode=pie -trimpath -modcacherw -mod=readonly'
  go build -o "${_bin}" -ldflags "${x[*]/#/-X=k8s.io/ingress-nginx/version.}" ./cmd/plugin
}

# check(): no simple tests available for plugin only

package() {
  cd "${_pkgname}-${pkgver}"
  install -Dm755 ${_bin} -t "${pkgdir}/usr/bin"
  install -Dm644 docs/kubectl-plugin.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
