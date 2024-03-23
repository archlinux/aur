# Maintainer: Haruue Icymoon <i@haruue.moe>

_pkgbase=hysteria1
pkgname=$_pkgbase
pkgver=1.3.5
pkgrel=3
pkgdesc='A feature-packed network utility optimized for networks of poor quality (Legacy Version)'
_gover=1.20.14
arch=('x86_64')
url="https://v1.hysteria.network/"
license=('GPL3')
depends=('glibc' 'acl' 'shadow')
makedepends=('go' 'git')
install=$_pkgbase.install
source=("$_pkgbase-git"::"git+https://github.com/apernet/hysteria.git#tag=v$pkgver"
        hysteria1@.service
        hysteria1-server@.service
        sysusers.conf
        tmpfiles.conf
        "golang-go-${_gover}.src.tar.gz"::"https://go.dev/dl/go${_gover}.src.tar.gz"
        )
sha256sums=('SKIP'
            '4ebeed6fb5f0416470094557f2321a0a604f55953242bc6b2b184198cc9085dc'
            '59d9d1b722028b66028565d269fd5028577fc0cab80f514232b5e8fb919c6ffe'
            '44f1cb2fedfc94dc396ceb215e62237dbc8c74c035c45a3430c1f3748d266dd9'
            '1e93d9f2b312eaf02ac00229106cd796e0cd54a9a468a0a8d3ae843399c1c310'
            '1aef321a0e3e38b7e91d2d7eb64040666cabdcc77d383de3c9522d0d69b67f4e')

prepare(){
  mkdir -p "$srcdir/gopath"
  export GOPATH="$srcdir/gopath"
  cd "$srcdir/$_pkgbase-git"
  mkdir -p build/
}

build() {
  # Building go1.20 as hysteria v1 will never support go1.21
  # ref: https://github.com/apernet/hysteria/issues/647#issuecomment-1676421184
  cd "$srcdir/go/src"
  ./make.bash

  # Building hysteria with go1.20
  cd "$srcdir/$_pkgbase-git"
  #export GOAMD64=v3
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  local _goldflags="-w -s -linkmode=external"
  local _goldflags="$_goldflags -buildid="
  local _goldflags="$_goldflags -X 'main.appVersion=$(git describe --tags --always --match 'v*')'"
  local _goldflags="$_goldflags -X 'main.appCommit=$(git rev-parse HEAD)'"
  local _goldflags="$_goldflags -X 'main.appDate=$(date -u '+%F %T')'"
  "$srcdir/go/bin/go" build \
    -buildmode=pie -trimpath -mod=readonly -modcacherw \
    -o "build/$_pkgbase" \
    -ldflags "$_goldflags" \
    -tags=gpl \
    ./app/cmd
}

#check() {
#  cd "$srcdir/$_pkgbase-git"
#  go test ./...
#}

package() {
  # install hysteria
  install -Dm755 "$srcdir/$_pkgbase-git/build/$_pkgbase" "$pkgdir/usr/bin/$_pkgbase"

  # install sysusers
  install -Dm644 "$srcdir/sysusers.conf" "$pkgdir/usr/lib/sysusers.d/$_pkgbase.conf"
  install -Dm644 "$srcdir/tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/$_pkgbase.conf"

  # install systemd service
  install -Dm644 "$srcdir/hysteria1@.service" "$pkgdir/usr/lib/systemd/system/hysteria1@.service"
  install -Dm644 "$srcdir/hysteria1-server@.service" "$pkgdir/usr/lib/systemd/system/hysteria1-server@.service"

  # install config directory
  install -dm755 "$pkgdir/etc/hysteria"
}
