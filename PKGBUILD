# Maintainer: Deposite Pirate <dpirate@metalpunks.info>
#
# Upstream: https://git.metalpunks.info/arch-ports

_pkgname=youtube
pkgname=youtubedr
pkgver=2.10.0
pkgrel=1
pkgdesc="Download YouTube videos"
arch=('x86_64')
url="https://github.com/kkdai/youtube"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
source=("git+$url#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${_pkgname}"
  GOOS=linux GOARCH=amd64 \
  CGO_CPPFLAGS="${CPPFLAGS}" \
  CGO_CFLAGS="${CFLAGS}" \
  CGO_CXXFLAGS="${CXXFLAGS}" \
  go build -v \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
    -o build ./cmd/...
}

check() {
  cd "${srcdir}/${_pkgname}"
  #go test
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm755 build "$pkgdir/usr/bin/${pkgname}"
  install -Dm644 README.md "$pkgdir/usr/share/doc/${pkgname}/README.md"
}
