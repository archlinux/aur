# Maintainer: mingming

pkgname=ucloud-git
pkgver=0.3.3.r2.g45e6af8
pkgrel=1
pkgdesc='Command line interface for UCloud services'
arch=('x86_64' 'aarch64')
url='https://github.com/ucloud/ucloud-cli'
license=('Apache-2.0')
depends=('glibc')
makedepends=('git' 'go')
provides=('ucloud' 'ucloud-cli')
conflicts=('ucloud' 'ucloud-bin')
options=('!debug')
source=('git+https://github.com/ucloud/ucloud-cli.git')
sha256sums=('SKIP')

pkgver() {
  cd ucloud-cli

  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ucloud-cli

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=vendor -modcacherw"

  go build -ldflags "-X main.Version=${pkgver}" -o ucloud main.go
}

package() {
  cd ucloud-cli

  install -Dm755 ucloud "${pkgdir}/usr/bin/ucloud"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
