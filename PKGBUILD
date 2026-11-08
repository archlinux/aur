# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=lichii-shader-sync
pkgver=1.1.2
pkgrel=1
pkgdesc="Downloads shared Vulkan shader caches into Lichii and Eden, so games stutter less on first play"
arch=('x86_64' 'aarch64')
url="https://github.com/oceanpacificpeace/lichii-shader-sync"
# upstream has no licence file
license=('unknown')
# pgrep: it refuses to sync while Lichii is running
depends=('glibc' 'procps-ng')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8f620db4beb121182c71d862400993c8249fdc84df359c32879949ca915a103d')

prepare() {
  cd "${pkgname}-${pkgver}"
  export GOPATH="$srcdir/gopath"
  go mod download -modcacherw
}

build() {
  cd "${pkgname}-${pkgver}"
  export GOPATH="$srcdir/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  # the command line tool; ./gui is the Windows-only GUI
  go build -o lichii-sync .
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 lichii-sync -t "$pkgdir/usr/bin"
}
