# Maintainer: Haruue Icymoon <i@haruue.moe>

_pkgbase=hysteria
pkgname=$_pkgbase
pkgver=0.7.0
pkgrel=2
pkgdesc='TCP relay & SOCKS5/HTTP proxy tool optimized for poor network environments'
arch=('x86_64')
url="https://github.com/HyNetwork/hysteria"
license=('MIT')
makedepends=('go')
source=("$_pkgbase-$pkgver.tar.gz"::"$url/archive/refs/tags/v$pkgver.tar.gz"
        hysteria@.service
        hysteria-server@.service
        sysusers.conf
        )
sha256sums=('86b416970335a0b5d266a929af795e3d79f7fa94c9d140dc91a3c69ff218e1d3'
            '2b0057f4f0e236ca59c91035e406c7c55df9b2420fd45c3dfe3efbc21c1fa046'
            'facb84351432dbac9a2bdfc9a4564fd87c0823a51d52b0bb6b7af5170feab676'
            'abaab463035e67c1e1728e5378b8f4a50960bf80d5005e02b3b2c9468f06150d')

prepare(){
  mkdir -p "$srcdir/gopath"
  export GOPATH="$srcdir/gopath"
  cd "$srcdir/$_pkgbase-$pkgver"
  mkdir -p build/
}

_commit_hash() {
  # magic to obtain commit hash without makedepends git
  curl -sA 'git/2.31.1' "$url.git/info/refs?service=git-upload-pack" \
      | sed 's/\^{}/\n/g' \
      | grep -a "refs/tags/v$pkgver" \
      | grep '0041' \
      | cut -b 5-44
}

build() {
  cd "$srcdir/$_pkgbase-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  export GOLDFLAGS="-w -s"
  export GOLDFLAGS="$GOLDFLAGS -X 'main.appVersion=$pkgver'"
  export GOLDFLAGS="$GOLDFLAGS -X 'main.appCommit=$(_commit_hash)'"
  export GOLDFLAGS="$GOLDFLAGS -X 'main.appDate=$(date "+%F %T")'"
  go build -o build/$_pkgbase -ldflags "$GOLDFLAGS" ./cmd/...
}

#check() {
#  cd "$srcdir/$_pkgbase-$pkgver"
#  go test ./...
#}

package() {
  # install hysteria
  install -Dm755 "$srcdir/$_pkgbase-$pkgver/build/$_pkgbase" "$pkgdir/usr/bin/$_pkgbase"

  # install sysusers
  install -Dm644 "$srcdir/sysusers.conf" "$pkgdir/usr/lib/sysusers.d/hysteria.conf"

  # install systemd service
  install -Dm644 "$srcdir/hysteria@.service" "$pkgdir/usr/lib/systemd/system/hysteria@.service"
  install -Dm644 "$srcdir/hysteria-server@.service" "$pkgdir/usr/lib/systemd/system/hysteria-server@.service"

  # install config directory
  install -dm755 "$pkgdir/etc/hysteria"
}
