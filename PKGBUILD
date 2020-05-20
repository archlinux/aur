# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=ops
pkgver=0.1.10
pkgrel=1
pkgdesc="Build and run nanos unikernels"
arch=('x86_64')
url='https://ops.city'
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nanovms/ops/archive/${pkgver}.tar.gz")
sha256sums=('c45d094e3fe8fb51878e0befeefce90d7492cce03f9d17cf0f47420cc6c40d73')

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
  export GOFLAGS="-buildmode=pie -trimpath -modcacherw"
  # go get -d -v ./...
  go build -o build ./...
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 build/ops "${pkgdir}/usr/bin/ops"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/ops/LICENSE"
}