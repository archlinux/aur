# Maintainer: Haruue Icymoon <i@haruue.moe>

_pkgbase=mwgp
pkgname="$_pkgbase"
pkgver=2.1.7
pkgrel=1
pkgdesc='A WireGuard proxy designed to reuse one UDP port for multiple WireGuard interfaces'
arch=('x86_64')
url="https://github.com/apernet/mwgp"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
_srcbase="github-apernet-$_pkgbase"
source=("$_srcbase"::"git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

prepare(){
  mkdir -p "$srcdir/gopath"
  export GOPATH="$srcdir/gopath"
  cd "$srcdir/$_srcbase"
  mkdir -p build/
}

build() {
  cd "$srcdir/$_srcbase"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  local _goldflags="-w -s -linkmode=external"
  local _goldflags="$_goldflags -X 'main.MWGPVersion=$(git describe --tags)'"
  go build \
    -buildmode=pie -trimpath -mod=readonly -modcacherw \
    -o "build/$_pkgbase" \
    -ldflags "$_goldflags" \
    ./cmd/mwgp
}

#check() {
#  cd "$srcdir/$_pkgbase"
#  go test ./...
#}

package() {
  # install mwgp
  install -Dm755 "$srcdir/$_srcbase/build/$_pkgbase" "$pkgdir/usr/bin/$_pkgbase"

  # install sysusers & tmpfiles
  install -Dm644 "$srcdir/$_srcbase/release/sysusers.conf" "$pkgdir/usr/lib/sysusers.d/$_pkgbase.conf"
  install -Dm644 "$srcdir/$_srcbase/release/tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/$_pkgbase.conf"

  # install systemd units
  install -Dm644 "$srcdir/$_srcbase/release/mwgp-client@.service" "$pkgdir/usr/lib/systemd/system/mwgp-client@.service"
  install -Dm644 "$srcdir/$_srcbase/release/mwgp-server@.service" "$pkgdir/usr/lib/systemd/system/mwgp-server@.service"

  # install license
  install -Dm644 "$srcdir/$_srcbase/LICENSE" "$pkgdir/usr/share/licenses/$_pkgbase/LICENSE"

  # install config directory
  install -dm755 "$pkgdir/etc/mwgp"
}
