# Maintainer: tarball <bootctl@gmail.com>
# Contributor: Philip Goto <philip.goto@gmail.com>
# Contributor: fortea

pkgname=apx
pkgver=1.8.2
pkgrel=2
pkgdesc='Package manager with support for multiple sources'
arch=(x86_64 aarch64)
url='https://github.com/Vanilla-OS/apx'
license=(GPL3)
depends=(
  distrobox
  glibc
)
makedepends=(go)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('615f1fce06db9e84f7ce1a421d60af5f4b3ad6de6faa2accd913b0520f46ce70285d959277bd90ec94febabd114279a1035535cfebc2c99ebf86271ace795cd1')

prepare() {
  cd "${pkgname}-${pkgver}"
  mkdir -p build/
  sed -i 's|share/apx|bin|' config/config.json
}

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "config/config.json" "${pkgdir}/etc/apx/config.json"
}
