# Maintainer: kohbo <kohbosan@gmail.com>

pkgname=dirt
pkgver=0.10.1
pkgrel=1
pkgdesc='k9s-style TUI for libvirt / KVM virtual machines, with htop-style live stats'
arch=('x86_64' 'aarch64')
url='https://github.com/llcoolkm/dirt'
license=('GPL-3.0-only')
depends=('libvirt' 'glibc')
makedepends=('go')
options=('!lto')
optdepends=(
  'virt-install: clone VMs (virt-clone)'
  'virt-viewer: graphical console'
  'openssh: SSH into guests'
  'qemu-img: disk image info'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3cd988413adb033ee2380bb2baa17b0db87a2ac90a756d93d2b0d5c7a65cb282')

prepare() {
  cd "$pkgname-$pkgver"
  export GOPATH="$srcdir/gopath"
  export GOFLAGS='-modcacherw'
  go mod download
}

build() {
  cd "$pkgname-$pkgver"
  export GOPATH="$srcdir/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'
  go build -ldflags "-linkmode=external -X main.version=v$pkgver" -o dirt .
}

check() {
  cd "$pkgname-$pkgver"
  export GOPATH="$srcdir/gopath"
  export GOFLAGS='-mod=readonly -modcacherw'
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 dirt -t "$pkgdir/usr/bin/"
  install -Dm644 README.md CHANGELOG.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
