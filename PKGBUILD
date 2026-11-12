# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=lichii-shader-sync
pkgver=1.2.1
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
sha256sums=('de40babe73240bcddb542a879216f0bd0b66a46fa2f248d47a59a4a379888bda')

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
  # -buildvcs=false: makepkg runs inside a git checkout (this repository in
  # CI), and Go fails to read its VCS status there
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw -buildvcs=false"
  # the command line tool; ./gui is the Windows-only GUI
  go build -o lichii-sync .
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 lichii-sync -t "$pkgdir/usr/bin"
}
