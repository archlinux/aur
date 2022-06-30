# Maintainer: Michael William Le Nguyen <michael at mail dot ttp dot codes>
# Co-Maintainer: Victor Roest <victor at xirion dot net>
pkgname=rke
pkgver=1.3.12
pkgrel=1
pkgdesc="An extremely simple, lightning fast Kubernetes installer that works everywhere."
arch=('x86_64')
url="https://github.com/rancher/rke"
license=('Apache')

makedepends=(
  "git"
  # Cannot be built with go-pie due to rke's build flags.
  "go>=1.11"
  "golangci-lint"
)
source=(
  "rke-${pkgver}::git+https://github.com/rancher/rke#tag=v${pkgver}"
  "build.patch"
  "ci.patch"
  "version.patch"
  "validate.patch"
)
sha512sums=('SKIP'
            'cf18becc521bedafb13658d15e2a7ab8f847e375f4b4f6326320f587a11c657af6b4acd2d13e5fe885138a6c337336ed3d18001b6deb54425f96cfe6862d0331'
            '097d6211104ac7772d6f96c792902f690513b6e780a686c3fdda32ef66c6dd530c7c97a575fd380c4c627e8f7c1192cd877c1512d07a118ff1ad005a2f0cc14b'
            'e586996e0acc0736116cd6bd085c5bfa01bb67bf73a99fc9dcddb0c56597485a78612456dd1bcf2d8d97e54cef3b61429df4874877c88fa24b1944a04093f6f4'
            '2707143f518c076b25ab46ae9e4bb6eb2959e80d594a2c671faf8797aded21615f2881a1462a1e136544caed7051b0c2c4d10d8c910d90359468aa905fd4ba0b')

prepare () {
  cd "${pkgname}-${pkgver}"
  patch --forward --strip=1 --input="${srcdir}/build.patch"
  patch --forward --strip=1 --input="${srcdir}/ci.patch"
  patch --forward --strip=1 --input="${srcdir}/version.patch"
  patch --forward --strip=1 --input="${srcdir}/validate.patch"
}
build () {
  export GOPATH="${srcdir}/go"
  cd "${pkgname}-${pkgver}"
  ./scripts/entry build
}
check () {
  export GOPATH="${srcdir}/go"
  export PATH="$PATH:${srcdir}/go/bin"
  cd "${pkgname}-${pkgver}"
  ./scripts/entry test
  ./scripts/entry validate
  # Integration tests not run due to requiring a ton of kernel modules just to test locally.
}
package() {
  export GOPATH="${srcdir}/go"
  # *sigh*: https://github.com/golang/go/issues/27455
  go clean -modcache
  install -D -m755 "${srcdir}/${pkgname}-${pkgver}/bin/rke" "${pkgdir}/usr/bin/${pkgname}"
}
