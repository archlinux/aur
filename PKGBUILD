# Maintainer: Amolith <amolith@secluded.site>
pkgname=watt-wiser
pkgdesc='A software energy consumption estimation tool'
arch=("any")
url="https://git.sr.ht/~whereswaldon/watt-wiser"
pkgver=v0.0.8
pkgrel=1
license=("Unlicense")
makedepends=("go" "gcc" "vulkan-headers" "pkgconf" "wayland" "wayland-protocols" "libx11" "libxkbcommon-x11" "libxcursor")
depends=("watt-wiser-sensors" "xdg-desktop-portal")
provides=($pkgname)
conflicts=("$pkgname" "watt-wiser-git" "watt-wiser-sensors-git")

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('2bfad5bffb794d03466d11e6813ba832879efacf1e3f223b59c2a8e7d809e59e')
sha512sums=('52d928d0e4275d46d1e9abd27076e935677f24dadd3e7dab6c693e55f83ebe69aedbb2d9068f163a8bb8a2ea57cf33edd77ad6acd6404531af0b7608af847c5c')
b2sums=('b65ce2952f2c7b41e5dc0eeb6216025bb38466bba2b2e8707e80b8d627556537f0322f9b7d7d44c16c29c56e8ab2d8b4e7bed15245796b06346a0b1aa32b3641')

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
