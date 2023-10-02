# Contributor: Modelmat <modelmat@outlook.com.au>
# Maintainer: Modelmat <modelmat@outlook.com.au>
# Comaintainer: gilcu3 <gilcu3 [at] gmail [dot] com>

_pkgname=psiphon-tunnel-core
pkgname="$_pkgname-git"
pkgver=2.0.29.r3855.b2279f7b
pkgrel=2
GOVERSION=go1.19.8
epoch=3
pkgdesc='Psiphon Tunnelling Proxy'
arch=('i686' 'x86_64')
url="https://github.com/Psiphon-Labs/psiphon-tunnel-core"
license=('GPL3')
makedepends=('go')
conflicts=('psiphon-console-client' 'psiphon-server')
source=("git+$url.git"
        "client.config"
        "psiphon-client.service"
        "psiphon-server.service"
        "quic_disabled.go.patch"
        "https://storage.googleapis.com/golang/${GOVERSION}.linux-amd64.tar.gz"
        )
install=psiphon.install
backup=('etc/psiphon/client.config' 'usr/lib/systemd/user/psiphon-client.service' 'usr/lib/systemd/user/psiphon-server.service')
sha256sums=('SKIP'
            'c2c414831ad29bdeecd00313c473fbaa448f4750e70df1c10e863870bde179aa'
            '6711a12112a594ba70bbae51c66ee23302e08c54c4e059c92b67adba9451c037'
            '373c1eb939118055f799237df3e665680b8dc4b4a281505cce32e957a9554c56'
            '4257724404190434e6e45de83fb0ca1270d1f3e2d66ae18028bafb054b03319d'
            'e1a0bf0ab18c8218805a1003fd702a41e2e807710b770e787e5979d1cf947aba')


pkgver() {
  cd $_pkgname
  TAG=$(git describe --tags $(git rev-list --tags --max-count=1) | sed 's/^v//')
  COMMIT=$(git rev-parse --short HEAD)
  REVISION=$(git rev-list --count HEAD)
  printf "%s.r%s.%s" "$TAG" "$REVISION" "$COMMIT"
}

prepare(){
  cd "$srcdir/${_pkgname}"
  patch --strip=1 --input=../quic_disabled.go.patch
}


export GO111MODULE=off
export CGO_CPPFLAGS="$CPPFLAGS"
export CGO_CFLAGS="$CFLAGS"
export CGO_CXXFLAGS="$CXXFLAGS"
export CGO_LDFLAGS="$LDFLAGS"
export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
console_binary=psiphon-console-client
server_binary=psiphon-server

build() {
  cw=$(pwd)
  export GOPATH=$cw/home/go
  mkdir -p $GOPATH
  export GOROOT=$cw/go
  mkdir -p $GOROOT
  export PATH=$GOROOT/bin:$GOPATH/bin:$PATH

  mkdir -p "${GOPATH}/src/github.com/Psiphon-Labs"
  rm -rf "${GOPATH}/src/github.com/Psiphon-Labs/${_pkgname}"
  ln -srf  "$srcdir/${_pkgname}/" "${GOPATH}/src/github.com/Psiphon-Labs/${_pkgname}"

  go build -o bin/$console_binary "github.com/Psiphon-Labs/$_pkgname/ConsoleClient"
  go build -o bin/$server_binary "github.com/Psiphon-Labs/$_pkgname/Server"
}

package() {
  install -Dm755 "$srcdir/bin/$console_binary" "$pkgdir/usr/bin/$console_binary"
  install -Dm755 "$srcdir/bin/$server_binary" "$pkgdir/usr/bin/$server_binary"
  ln -srf "$pkgdir/usr/bin/psiphon-server" "$pkgdir/usr/bin/psiphond"
  install -Dm644 "$srcdir/client.config" "$pkgdir/etc/psiphon/client.config"
  install -Dm644 "$srcdir/psiphon-client.service" "$pkgdir/usr/lib/systemd/user/psiphon-client.service"
  install -Dm644 "$srcdir/psiphon-server.service" "$pkgdir/usr/lib/systemd/user/psiphon-server.service"
}
