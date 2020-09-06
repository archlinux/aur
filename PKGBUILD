# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=upcmd
pkgver=latest
pkgrel=2
pkgdesc="Ultimate Provisioner: the modern configuration management, build and automation tool"
arch=('x86_64')
url='https://github.com/upcmd/up'
license=('MPL2')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/upcmd/up/archive/${pkgver}.tar.gz")
sha256sums=('SKIP')

prepare() {
  cd "up-${pkgver}"
  mkdir -p build/
}

build() {
  cd "up-${pkgver}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -o build ./app/...
}

package() {
  cd "up-${pkgver}"
  install -Dm755 build/up "${pkgdir}/usr/bin/upcmd"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/upcmd/LICENSE"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/upcmd/"
  install -Dm644 up.yml -t "${pkgdir}/etc/${pkgname}"
}