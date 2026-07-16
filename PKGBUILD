# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=pvetui
pkgver=1.4.3
pkgrel=1
pkgdesc='A terminal user interface (TUI) for Proxmox VE'
url='https://github.com/devnullvoid/pvetui'
arch=('aarch64' 'x86_64')
license=('MIT')
conflicts=('pvetui-bin' 'pvetui-git')
depends=('glibc')
makedepends=('git' 'go')
optdepends=('kitty: Better terminal support' 'alacritty: Better terminal support')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('3d87fcf9ffca7d25daac2c1ef7f6275633d2793925537f6893f350bf1b4f463a')

prepare() {
  cd "${pkgname}-${pkgver}"
  export GOPATH="${srcdir}"
  go mod download -modcacherw
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -ldflags="-w -s -linkmode=external -X github.com/devnullvoid/pvetui/internal/version.version=${pkgver}" ./cmd/pvetui
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 ./pvetui "${pkgdir}/usr/bin/pvetui"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
