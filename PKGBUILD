# Maintainer: Rasi <rasi@xssn.at>

pkgname=dropwatch-music
pkgver=0.1.7
pkgrel=1
pkgdesc='Shows which albums by the artists in your music library you are missing'
arch=('x86_64' 'aarch64')
url='https://github.com/carnager/dropwatch'
license=('GPL-3.0-only')
depends=('glibc' 'tar' 'xz')
makedepends=('go>=2:1.27')
conflicts=('dropwatch')
backup=('etc/dropwatch.env')
source=("dropwatch-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('27c9969a3efc9eb07cda3e90b6c7574af36762ac8511a66083cadf6167e1cb53')

prepare() {
  cd "dropwatch-$pkgver"
  export GOPATH="$srcdir/gopath"
  go mod download
}

build() {
  cd "dropwatch-$pkgver"
  export GOPATH="$srcdir/gopath"
  export CGO_ENABLED=0
  export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'
  go build -ldflags "-X main.version=v$pkgver" -o dropwatch ./cmd/dropwatch
}

check() {
  cd "dropwatch-$pkgver"
  export GOPATH="$srcdir/gopath"
  export CGO_ENABLED=0
  go test ./...
}

package() {
  cd "dropwatch-$pkgver"
  install -Dm755 dropwatch "$pkgdir/usr/bin/dropwatch"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 contrib/dropwatch.service "$pkgdir/usr/lib/systemd/system/dropwatch.service"
  install -Dm644 contrib/dropwatch.user.service "$pkgdir/usr/lib/systemd/user/dropwatch.service"
  install -Dm644 contrib/dropwatch.sysusers "$pkgdir/usr/lib/sysusers.d/dropwatch.conf"
  install -Dm600 contrib/dropwatch.env "$pkgdir/etc/dropwatch.env"
}
