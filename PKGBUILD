# Maintainer: Kcocoa <kamforzn2@proton.me>

pkgname=cpa-usage-keeper
pkgver=1.15.0
pkgrel=1
pkgdesc="CPA usage persistence and analytics dashboard"
arch=('x86_64' 'aarch64')
url="https://github.com/Willxup/cpa-usage-keeper"
license=('MIT')
depends=('glibc' 'ca-certificates')
# ca-certificates is needed by Go's x509 system trust store for HTTPS CPA endpoints.
makedepends=('go' 'npm')
conflicts=('cpa-usage-keeper-systemd-bin')
backup=('etc/cpa-usage-keeper/cpa-usage-keeper.env')
install='cpa-usage-keeper.install'
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
  'cpa-usage-keeper.service'
  'cpa-usage-keeper.sysusers'
  'cpa-usage-keeper.tmpfiles'
)
sha256sums=('4cc7542f1733a508e508f6c707ac59697443022525d4ba530374c5d2d19c95bb'
            'bb8358668d819291ca111df9ba81dbbbcc7ee47f2bae22fce8da616aca2a2ad7'
            '881ae236ce3f3e5c1bf8aa806a288ac67accf1a0bb848fd4baa3d16df84d81a0'
            '69319d4ab7251749afddd8cdb697020a438b18e93edc6bfaac7db4ebe10608cd')

prepare() {
  cd "$pkgname-$pkgver"

  export GOPATH="$srcdir/gopath"
  go mod download -modcacherw
  npm --prefix web ci
}

build() {
  cd "$pkgname-$pkgver"

  npm --prefix web run build

  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOPATH="$srcdir/gopath"

  CGO_ENABLED=1 go build \
    -buildvcs=false \
    -buildmode=pie \
    -trimpath \
    -mod=readonly \
    -modcacherw \
    -ldflags="-linkmode=external -X cpa-usage-keeper/internal/version.Version=v$pkgver" \
    -o cpa-usage-keeper \
    ./cmd/server
}

check() {
  cd "$pkgname-$pkgver"

  export GOPATH="$srcdir/gopath"
  go test ./cmd/... ./internal/...
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 cpa-usage-keeper "$pkgdir/usr/bin/cpa-usage-keeper"

  # This file will contain management and login credentials after setup.
  install -Dm640 .env.example \
    "$pkgdir/etc/cpa-usage-keeper/cpa-usage-keeper.env"
  sed -i \
    's|^WORK_DIR=./data$|WORK_DIR=/var/lib/cpa-usage-keeper|' \
    "$pkgdir/etc/cpa-usage-keeper/cpa-usage-keeper.env"

  install -Dm644 "$srcdir/cpa-usage-keeper.service" \
    "$pkgdir/usr/lib/systemd/system/cpa-usage-keeper.service"
  install -Dm644 "$srcdir/cpa-usage-keeper.sysusers" \
    "$pkgdir/usr/lib/sysusers.d/cpa-usage-keeper.conf"
  install -Dm644 "$srcdir/cpa-usage-keeper.tmpfiles" \
    "$pkgdir/usr/lib/tmpfiles.d/cpa-usage-keeper.conf"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
