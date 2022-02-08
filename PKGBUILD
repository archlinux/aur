# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=terraform-provider-ovirt
pkgver=0.99.0
pkgrel=2
pkgdesc="Terraform provider for oVirt 4.x"
arch=(x86_64)
url="https://github.com/oVirt/terraform-provider-ovirt"
license=(BSD)
depends=(glibc)
makedepends=(go)
source=("$pkgname-$pkgver.tar.gz::https://github.com/oVirt/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('4400d1bd199aa96e47b8d5a8715b5e07973f77a7355e970f9c38c687f020f76614f42f87cd892a355d8b058934fd86eeb71bc296fad4cf56512e797676e108ec')
b2sums=('ad2359a4aa8ccd7ee7af4dd60969f31ec8a0e878bb52679cde216f91305988564e666d4179835e561a402833ce0d93f94236b8eb2c0fef7a357e1ebedaf2cb65')

prepare() {
  mkdir -vp $pkgname-$pkgver/build
}

build() {
  cd $pkgname-$pkgver
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o "build/${pkgname}"
}

check() {
  cd $pkgname-$pkgver
  go test .
}

package() {
  cd $pkgname-$pkgver
  install -vDm 755 build/$pkgname -t "$pkgdir/usr/share/terraform/plugins/registry.terraform.io/ovirt/ovirt/$pkgver/linux_amd64/"
  install -vDm 644 {CHANGELOG,README}.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
