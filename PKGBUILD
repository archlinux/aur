# Maintainer: Amolith <amolith@secluded.site>
pkgname=watt-wiser
pkgdesc='A software energy consumption estimation tool'
arch=("any")
url="https://git.sr.ht/~whereswaldon/watt-wiser"
pkgver=v0.1.3
pkgrel=1
license=("Unlicense")
makedepends=("go" "gcc" "vulkan-headers" "pkgconf" "wayland" "wayland-protocols" "libx11" "libxkbcommon-x11" "libxcursor")
depends=("watt-wiser-sensors" "xdg-desktop-portal")
conflicts=("watt-wiser-git" "watt-wiser-sensors-git")

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
b2sums=('5f9377878c235513345a6aff4618715933157a06b22c513b5e807852674cab7814634f5697ef91f3d47ad723290dd78253a5a81c7dfcc23d7b15075078c301f0')

build() {
  cd "${pkgname}-${pkgver}"

  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -o "${pkgname}" .
}

check() {
  cd "${pkgname}-${pkgver}"
  go test ./...
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "$pkgname" "$pkgdir/usr/local/bin/$pkgname"
}
