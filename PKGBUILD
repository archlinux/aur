# Maintainer: ml <ml@visu.li>
pkgname=kpt
pkgver=0.33.0
pkgrel=1
pkgdesc='Toolkit to manage, manipulate, customize, and apply Kubernetes Resource configurations'
arch=('x86_64')
url='https://googlecontainertools.github.io/kpt/'
license=('Apache')
depends=('git')
makedepends=('go')
optdepends=('asciinema: ttl command')
install=kpt.install
source=("https://github.com/GoogleContainerTools/kpt/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('6f50acd4bcebc7ad0668a43ba6e10651749d40ffb30ae0d331a31b5188cac25e')

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
  go build -o "$pkgname"
}

check() {
  cd "${pkgname}-${pkgver}"
  # ./internal only. we don't want e2e tests

  # not running any tests because they require configured Git identities
  #go test -short -failfast ./internal/...
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "$pkgname" -t "${pkgdir}/usr/bin"
}
