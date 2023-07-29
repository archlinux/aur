# Maintainer: Fuero <fuerob@gmail.com>
pkgname=xeol
# renovate: datasource=github-releases depName=noqcks/xeol
pkgver=0.4.8
_pkgver=v${pkgver}
pkgrel=1
pkgdesc='An End Of Life (EOL) package scannner for container images and filesystems.'
arch=(x86_64)
url='https://github.com/noqcks/xeol'
license=(APACHE)
makedepends=(git go podman-docker)
options=('!lto')
source=("${pkgname}-${_pkgver}.tar.gz::${url}/archive/refs/tags/${_pkgver}.tar.gz")
sha256sums=('949df4b05d8d5f0e4da94cce75daab98359a4dc9b772289ca913261ff1e1c053')
options=('!lto')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  make VERSION=$pkgver xeol
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # Dies on building inside a container. Beware!
  make unit || true
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 "${pkgname}/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
