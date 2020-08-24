# Maintainer: ml <ml@visu.li>
pkgname=kubectl-unused-volumes
pkgver=0.1.2
pkgrel=1
pkgdesc='Clean up Kuberntes yaml and json output to make it readable'
arch=('x86_64' 'i686')
url='https://github.com/dirathea/kubectl-unused-volumes'
license=('Apache')
depends=('kubectl')
makedepends=('go')
groups=('kubectl-plugins')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('4743b53246ed24593a522c7d45710ff7e2808ee7eed87b69e9b5ea406844fbdb')

prepare() {
  cd "${pkgname}-${pkgver}"
  go mod download
}

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_ENABLED=1
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export GOFLAGS='-buildmode=pie -ldflags=-linkmode=external -modcacherw -mod=readonly -trimpath'
  go build -o "$pkgname" ./cmd/plugin
}

check() {
  cd "${pkgname}-${pkgver}"
  go test -short ./...
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm644 doc/USAGE.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
