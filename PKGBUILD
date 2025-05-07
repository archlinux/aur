# Maintainer: Fuero <fuerob@gmail.com>
pkgname=xeol
# renovate: datasource=github-releases depName=noqcks/xeol
pkgver=0.10.8
_pkgver=v${pkgver}
pkgrel=1
pkgdesc='An End Of Life (EOL) package scannner for container images and filesystems.'
arch=(x86_64)
url='https://github.com/noqcks/xeol'
license=(APACHE)
makedepends=(git go podman-docker goreleaser)
options=('!lto')
source=("${pkgname}-${_pkgver}.tar.gz::${url}/archive/refs/tags/${_pkgver}.tar.gz")
sha256sums=('d26842a3ef75feef22270db4250d16d106e7f9d3ac5f4300ede1b6fc795cdaeb')
options=('!lto')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  mkdir .tmp
  VERSION="$pkgver" \
  GOOS=linux \
  GOARCH=amd64 \
    goreleaser build --clean --parallelism=$(nproc) --single-target --snapshot --verbose
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # Dies on building inside a container. Beware!
  sed -i -e 's/ -race//' Makefile
  make test || true
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 "dist/linux-build_linux_amd64_v1/${pkgname}" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
