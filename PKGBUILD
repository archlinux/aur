# Maintainer: ml <ml@visu.li>
pkgname=kubectl-neat
pkgver=2.0.1
pkgrel=2
pkgdesc='Clean up Kuberntes yaml and json output to make it readable'
arch=('x86_64' 'aarch64')
url='https://github.com/itaysk/kubectl-neat'
license=('Apache')
depends=('kubectl')
makedepends=('go')
groups=('kubectl-plugins')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('6393112f66e6a50ee6dfcadadc65d143a50fe6ae2466ec6d000a3ca8d8b304cd')

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_ENABLED=1
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export GOFLAGS='-buildmode=pie -trimpath -modcacherw -mod=readonly -ldflags=-linkmode=external'
  go build -o "$pkgname"
}

check() {
  cd "${pkgname}-${pkgver}"
  go test -short ./...
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 ${pkgname} -t "${pkgdir}/usr/bin"
  install -Dm644 demo.png Readme.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
