# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=s-ui
pkgver=1.3.7
pkgrel=1
_suifrontendcommit="2d0e1fd"
pkgdesc="Advanced web panel, built for SagerNet/Sing-Box"
arch=(aarch64 armv7h i686 x86_64)
url="https://github.com/alireza0/$pkgname"
license=(GPL-3.0-only)
depends=(
  glibc
  sing-box
)
makedepends=(
  git
  go
  nodejs-lts-jod
  npm
)
options=(!debug)
source=(
  $url/archive/v$pkgver/$pkgname-$pkgver.tar.gz
  git+$url-frontend.git
)
b2sums=('b83c1c4868b54cd2c606aca57d3be929f4c645c6803f8b799d4d6763f8d7ac6cc96a50e2c3d17da7c9ec69352a6525133c31a7dbe8f609f1581f8e44aebea27c'
        'SKIP')

prepare() {
  cd $pkgname-$pkgver
  sed -i 's|WorkingDirectory=/usr/local/s-ui/|WorkingDirectory=/usr/lib/s-ui/|' $pkgname.service
  sed -i 's|ExecStart=/usr/local/s-ui/sui|ExecStart=/usr/lib/s-ui/sui|'         $pkgname.service
}

build() {
  export TMPDIR="$srcdir"/tmp
  mkdir -p "$TMPDIR"

  cd $pkgname-frontend
  git checkout --quiet $_suifrontendcommit
  npm i
  npm run build -- --outDir=../$pkgname-$pkgver/web/html --emptyOutDir

  cd ../$pkgname-$pkgver
  export GOCACHE="$srcdir"/go-build
  export GOPATH="$srcdir"/go
  export CGO_CPPFLAGS=$CPPFLAGS
  export CGO_CFLAGS="$CFLAGS -D_LARGEFILE64_SOURCE"
  export CGO_CXXFLAGS=$CXXFLAGS
  export CGO_LDFLAGS=$LDFLAGS
  export CGO_ENABLED=1
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  go build \
    -ldflags="-linkmode=external -w -s" \
    -tags "with_quic,with_grpc,with_utls,with_acme,with_gvisor" \
    -o build/$pkgname main.go
}

package() {
  cd $pkgname-$pkgver
  install -vDm 755 build/$pkgname       "$pkgdir"/usr/lib/$pkgname/${pkgname/-/}
  install -vDm 644 $pkgname.service  -t "$pkgdir"/usr/lib/systemd/system/
}
