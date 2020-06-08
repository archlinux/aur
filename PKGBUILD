# Maintainer: ml <ml@visu.li>
pkgname=kpt
pkgver=0.29.0
pkgrel=1
pkgdesc='Toolkit to manage, manipulate, customize, and apply Kubernetes Resource configurations'
arch=('x86_64')
url='https://googlecontainertools.github.io/kpt/'
license=('Apache')
depends=('git')
makedepends=('go')
install=kpt.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/GoogleContainerTools/kpt/archive/v${pkgver}.tar.gz")
sha256sums=('64a7fe39605431dc15557e92dc761f5aa5598acc1e86e7b9f4bb6e5be989f295')

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
  # ./internal only. we don't want e2e tests
  # still git identity requires...
  #go test -short -failfast ./internal/...
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "$pkgname" -t "${pkgdir}/usr/bin"
}
