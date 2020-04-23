# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=immortal
pkgver=0.24.3
pkgrel=1
pkgdesc="A *nix cross-platform (OS agnostic) supervisor"
arch=('x86_64')
url='https://immortal.run'
license=('BSD-3-Clause')
makedepends=('dep' 'go-pie')
source=("https://github.com/immortal/immortal/archive/${pkgver}.tar.gz")
sha256sums=('e31d5afb9028fb5047b5a2cc5f96c844f6480d600643a12075550f497e65f5cb')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p $srcdir/go
  export GOPATH="${srcdir}"/go
  export PATH=$PATH:$GOPATH/bin
  go get -d -v ./...
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/cmd/immortal"
  export GOPATH="${srcdir}"/go
  export PATH=$PATH:$GOPATH/bin
  go build \
    -mod=mod \
    -trimpath \
    -ldflags "-extldflags $LDFLAGS" \
    -o $srcdir/immortal .
  cd "${srcdir}/${pkgname}-${pkgver}/cmd/immortalctl"
  go build \
    -mod=mod \
    -trimpath \
    -ldflags "-extldflags $LDFLAGS" \
    -o $srcdir/immortalctl .
  cd "${srcdir}/${pkgname}-${pkgver}/cmd/immortaldir"
  go build \
    -mod=mod \
    -trimpath \
    -ldflags "-extldflags $LDFLAGS" \
    -o $srcdir/immortaldir .
  cd "${srcdir}/${pkgname}-${pkgver}"
  gzip --force man/immortal.8
  gzip --force man/immortalctl.8
  gzip --force man/immortaldir.8
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 ../immortal -t "${pkgdir}/usr/bin/"
  install -Dm755 ../immortalctl -t "${pkgdir}/usr/bin/"
  install -Dm755 ../immortaldir -t "${pkgdir}/usr/bin/"
  install -Dm644 man/immortal.8.gz -t "${pkgdir}/usr/share/man/man8"
  install -Dm644 man/immortalctl.8.gz -t "${pkgdir}/usr/share/man/man8"
  install -Dm644 man/immortaldir.8.gz -t "${pkgdir}/usr/share/man/man8"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  mkdir -p "${pkgdir}/usr/share/doc/immortal/"
  cp -aR example "${pkgdir}/usr/share/doc/immortal/"
  go clean -modcache #Remove go libraries
}