# Maintainer: ml <ml@visu.li>
pkgname=kubectl-neat
pkgver=1.2.0
pkgrel=1
pkgdesc='Clean up Kuberntes yaml and json output to make it readable'
arch=('x86_64' 'aarch64')
url='https://github.com/itaysk/kubectl-neat'
license=('Apache')
depends=('kubectl')
makedepends=('go')
groups=('kubectl-plugins')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('c241d4cc5f5d13d4f496974f9c9580477d07a9e433d77f5412aa6e7be493afdc')

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
  export GOFLAGS='-buildmode=pie -trimpath -modcacherw -mod=readonly'
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
