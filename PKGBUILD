# Maintainer: Amolith <amolith@secluded.site>
pkgname=watt-wiser
pkgdesc='A software energy consumption estimation tool'
arch=("any")
url="https://git.sr.ht/~whereswaldon/watt-wiser"
pkgver=v0.0.4
pkgrel=2
license=("Unlicense")
makedepends=("go" "gcc" "vulkan-headers" "pkgconf" "wayland" "wayland-protocols" "libx11" "libxkbcommon-x11" "libxcursor")
depends=("watt-wiser-sensors" "xdg-desktop-portal")
provides=($pkgname)
conflicts=("$pkgname" "watt-wiser-git" "watt-wiser-sensors-git")

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('1e03f78d148ceb5909d877c883130dcafeb260e298c7ad9ae0d9ad80ae0d8980')
sha512sums=('82a7712fb90d636cafd18e56257a713714dbceebf07740413a8c0023db9bf098a66899a851942dd9ea2ad909232a2f1f88a7164a708ba2bd764c995b40968e63')
b2sums=('88dfe0a2f1492feeaf0ac4bc364459147c77a4fb22082f5b223468338a635f7f309d91eb7afd842a1915b26d16aee5466d5043677609821236ac6be1ba1a0fb2')

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
