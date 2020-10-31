# Maintainer: ml <>
pkgname=kpt
pkgver=0.36.1
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
sha256sums=('b4dae0eb1c4160ec9a6ef7d9d949280855e32bad08f217929ecb54cd996da317')

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
  export GOFLAGS='-buildmode=pie -modcacherw -mod=readonly -trimpath'
  go build -o "$pkgname" -ldflags=-linkmode=external
}

# tests require configures Git identities
# @TODO find safe way to set Git identities without violating $HOME privacy
#check() {
#  cd "${pkgname}-${pkgver}"
#  # ./internal only. we don't want e2e tests
#  go test -short ./internal/...
#}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "$pkgname" -t "${pkgdir}/usr/bin"
}
