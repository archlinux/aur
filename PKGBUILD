# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=s-ui
pkgver=1.3.10
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
b2sums=('0f5a23e86e7fc99e02a8dfc22d725916261b6b5790d4ca641408539cbb603989b20b80de0be8cb17e566e5184f871f117657abfe205eeeebd47b4633861cc18d'
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
