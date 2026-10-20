# Maintainer: Rasi <rasi@xssn.at>

pkgname=dropwatch-music
pkgver=0.1.4
pkgrel=1
pkgdesc='Shows which albums by the artists in your music library you are missing'
arch=('x86_64' 'aarch64')
url='https://github.com/carnager/dropwatch'
license=('GPL-3.0-only')
depends=('glibc' 'tar' 'xz')
makedepends=('go>=2:1.27')
conflicts=('dropwatch')
backup=('etc/dropwatch.env')
source=("dropwatch-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        'dropwatch.service'
        'dropwatch.user.service'
        'dropwatch.sysusers'
        'dropwatch.env')
sha256sums=('bf3ef09a2848a29c345ced9756e6f26c8514fcea7682e1824588042553934d23'
            'd030f79827ae4c556868d3b10ed54247483c74614dc33a94f47c8e0a9bf38fd3'
            '9e41d816ec93882ebca7e2072282da348fe8dc1ea6b84b4dd6ba3a69d48f4b34'
            'e41d085e0f85d65e37a1df36c32adbd2485d21f152da90ea53a365e815ca65cb'
            'c3d5e1b72384c664aa94a482be791b8a5df3d94fc7e1b77a0944420ae160d52b')

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
  install -Dm644 "$srcdir/dropwatch.service" "$pkgdir/usr/lib/systemd/system/dropwatch.service"
  install -Dm644 "$srcdir/dropwatch.user.service" "$pkgdir/usr/lib/systemd/user/dropwatch.service"
  install -Dm644 "$srcdir/dropwatch.sysusers" "$pkgdir/usr/lib/sysusers.d/dropwatch.conf"
  install -Dm600 "$srcdir/dropwatch.env" "$pkgdir/etc/dropwatch.env"
}
