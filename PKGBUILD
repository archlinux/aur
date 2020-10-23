# Maintainer: David Runge <dvzrv@archlinux.org>

_name=terraform-provider-ovirt
pkgname=terraform-provider-ovirt-git
pkgver=0.4.2.r50.g15d9359
_ver="${pkgver%.*.*}"
pkgrel=1
pkgdesc="Terraform provider for oVirt 4.x"
arch=('x86_64')
url="https://github.com/oVirt/terraform-provider-ovirt"
license=('BSD')
depends=('glibc')
makedepends=('git' 'go')
provides=("${_name}=${_ver}")
conflicts=("${_name}=${_ver}")
source=("git+https://github.com/oVirt/${_name}")
md5sums=('SKIP')

pkgver() {
  cd "${_name}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g'
}

prepare() {
  cd "${_name}"
  mkdir -vp build
}

build() {
  cd "${_name}"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o "build/${pkgname}"
}

check() {
  cd "${_name}"
  go test .
}

package() {
  cd "${_name}"
  install -vDm 755 "build/$pkgname" \
    "$pkgdir/usr/share/terraform/plugins/registry.terraform.io/ovirt/ovirt/${_ver}/linux_amd64/${_name}"
  install -vDm 644 {CHANGELOG,README}.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
