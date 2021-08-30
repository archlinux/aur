# Maintainer: Andrea Denisse Gómez-Martínez <aur at denisse dot dev>

pkgname=teleirc
pkgdesc='Go implementation of a Telegram <=> IRC bridge for use with any IRC channel and Telegram group.'
arch=(any)
url='https://github.com/RITlug/teleirc'
_branch='master'
pkgver=2.2.0
pkgrel=1
license=('GPL3')
makedepends=(go)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('63c870e4a1f1c0625ee7afa0f4bac084429d58da73c106a32ffd74ef609e1310')
sha512sums=('161c7f7b19a0d4e21f5aaf33d3f99eb1bfdbf9c2a591dfda456d932825408b2cbddd630f762512eb8a27a3b8c6ed676d608afa2a8e0817cf80ad684dc080eaa9')
b2sums=('8fd9c0aa66c94eabc919093df2bc5f4d2ef1ed4b16bba5c283f2d5de22e25f9d642219ef84216bb2ba016e0145728664c15b3522452f85d7a775731df6e861c6')
provides=($pkgname)
conflicts=($pkgname)

prepare() {
  mkdir -p "${pkgname}-${pkgver}/build"
}

build() {
  cd "${pkgname}-${pkgver}"

  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -o build/ cmd/$pkgname.go
}

check() {
  cd "${pkgname}-${pkgver}"
  go test ./...
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
