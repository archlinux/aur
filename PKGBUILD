# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=ops
pkgver=0.1.24
pkgrel=1
pkgdesc="Build and run nanos unikernels"
arch=('x86_64')
url='https://ops.city'
license=('MIT')
depends=('glibc')
optdepends=('qemu')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nanovms/ops/archive/${pkgver}.tar.gz")
sha256sums=('4d15c49e7780d2772e0b324c78d90851fe1547bbd1c7b581b75de01d536c9027')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p build/
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -o build ./...
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 build/ops "${pkgdir}/usr/bin/ops"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/ops/LICENSE"
}
