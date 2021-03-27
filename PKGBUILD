# Maintainer: Andrea Denisse Gómez-Martínez <aur at denisse dot dev>

pkgname=arpfox
pkgdesc='An arpspoof alternative (written in Go) that injects spoofed ARP packets into a LAN.'
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/malfunkt/arpfox'
_branch='master'
pkgver=1.0.0
pkgrel=1
license=('MIT')
makedepends=(go)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('f2b24dc840381264ea6f010cc5f0949089611083d9310a91ffda2a770a074ec4')
sha512sums=('150ea193235c555a528de2bfe5a0f6e06fd91a46cc979004f103acc1f8175381633c4817a1bf0d37cd142d72d20f610b55ef94ebabf41fbd27152bdc430219c0')
provides=($pkgname)
conflicts=($pkgname)

prepare() {
  cd "${pkgname}-${pkgver}"
  mkdir build
  go mod tidy
}

build() {
  cd "${pkgname}-${pkgver}"

  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -o build/ .
}

check() {
  cd "${pkgname}-${pkgver}"
  go test ./...
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
