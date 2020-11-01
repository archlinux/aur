# Maintainer: Roman Kvasnytskyi <culidesta@gmail.com>

pkgname=cartridge-cli-git
pkgrel=1
pkgver=2.4.0.r2.g55a16ec
pkgdesc='Tarantool Cartridge command-line utility'
arch=('x86_64')
url="https://tarantool.io/"
license=('BSD')
makedepends=('git' 'go' 'tarantool')
depends=('tarantool')
source=('cartridge-cli-git::git+https://github.com/tarantool/cartridge-cli/#branch=master')
sha256sums=('SKIP')

prepare(){
  cd "$pkgname"
  mkdir -p build/
}

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() { 
  cd "$pkgname"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -modcacherw"
  go mod download 
  go build -o ./build "./cli/..."
}

check() {
  printf "SKIP\n"
}

package() {
  cd "$pkgname"
  install -Dm755 ./build/cli "$pkgdir"/usr/bin/cartridge

  # License is BSD 2 clause type and needs to be installed
  install -m755 -d "${pkgdir}/usr/share/licenses/cartridge"
  install -m644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/cartridge/"
}