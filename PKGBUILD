# Maintainer: ml <ml CALLME visu.li>
pkgname=kubectl-krew
_pkgname=${pkgname#kubectl-}
pkgver=0.4.0
pkgrel=3
pkgdesc='Plugin manager for kubectl command-line tool'
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://krew.sigs.k8s.io/'
license=('Apache')
depends=('kubectl' 'git')
makedepends=('go')
install=kubectl-krew.install
provides=('krew')
groups=('kubectl-plugins')
source=("https://github.com/kubernetes-sigs/krew/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('1950c8cbd76bbe27589b7e76ed8b79a2d1b97faef238376bf68a3c2a8f48b182')

build() {
  local _commit=
  _commit=$(bsdcat "${pkgname}-${pkgver}.tar.gz" | git get-tar-commit-id)
  local -a x=(
    sigs.k8s.io/krew/internal/version.gitCommit="${_commit:?}"
    sigs.k8s.io/krew/internal/version.gitTag="v${pkgver}"
  )
  cd "${_pkgname}-${pkgver}"
  export CGO_ENABLED=1
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export GOFLAGS='-buildmode=pie -trimpath -modcacherw -mod=readonly'
  go build -o . -ldflags "-linkmode=external ${x[*]/#/-X=}" ./cmd/{krew,validate-krew-manifest}
}

check() {
  cd "${_pkgname}-${pkgver}"
  # unit- and integrationtests
  KREW_BINARY="${PWD}/${pkgname#kubectl-}" go test -short ./...
}

package() {
  cd "${_pkgname}-${pkgver}"
  install -Dm755 krew -t "${pkgdir}/usr/bin"
  ln -srfT "$pkgdir/usr/bin/krew" "$pkgdir/usr/bin/kubectl-krew"
  install -m755 validate-krew-manifest -t "${pkgdir}/usr/bin"

  # docs
  install -Dm755 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  cp -a docs/* -t "${pkgdir}/usr/share/doc/${pkgname}"
}
