# Maintainer: csmantle <aur at csmantle dot top>
# Contributor: Nebulosa <nebulosa2007 at yandex dot ru>

pkgname=s-ui-git
_pkgname=s-ui
pkgver=1.3.7.r24.g0ef5db4
pkgrel=1
pkgdesc='Advanced web panel, built for SagerNet/Sing-Box'
arch=(aarch64 armv7h i686 x86_64 loong64)
url='https://github.com/alireza0/s-ui'
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
provides=("$_pkgname")
conflicts=("$_pkgname")
options=(!debug)
source=(
  "git+$url.git"
  "git+$url-frontend.git"
)
b2sums=('SKIP'
        'SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  sed -i "s|WorkingDirectory=/usr/local/s-ui/|WorkingDirectory=/usr/lib/$_pkgname/|" "$_pkgname".service
  sed -i "s|ExecStart=/usr/local/s-ui/sui|ExecStart=/usr/lib/$_pkgname/$_pkgname|"   "$_pkgname".service
}

build() {
  export TMPDIR="$srcdir"/tmp
  mkdir -p "$TMPDIR"

  # Build Frontend
  echo 'Building frontend...'
  cd "$srcdir"/"$_pkgname"-frontend
  npm install
  npm run build -- --outDir="$srcdir"/"$_pkgname"/web/html --emptyOutDir

  # Build Backend
  echo 'Building backend...'
  cd "$srcdir"/"$_pkgname"
  export GOCACHE="$srcdir"/go-build
  export GOPATH="$srcdir"/go
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS -D_LARGEFILE64_SOURCE"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_ENABLED=1
  export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'

  go build \
    -ldflags="-linkmode=external -w -s -X main.version=$pkgver" \
    -tags 'with_quic,with_grpc,with_utls,with_acme,with_gvisor' \
    -o build/"$_pkgname" main.go
}

package() {
  cd "$_pkgname"
  install -vDm 755 build/"$_pkgname"      "$pkgdir"/usr/lib/"$_pkgname"/"$_pkgname"
  install -vDm 644 "$_pkgname".service -t "$pkgdir"/usr/lib/systemd/system/
}
