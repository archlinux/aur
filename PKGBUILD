# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>

pkgname="dendrite"
pkgver=0.15.2
pkgrel=1
pkgdesc="A second-generation Matrix homeserver written in Go"
url="https://element-hq.github.io/dendrite/"
license=("AGPL-3.0-or-later")
arch=("x86_64" "i686" "armv6h" "armv7h" "aarch64")
# https://github.com/quic-go/quic-go/wiki/quic-go-and-Go-versions
makedepends=("go")
optdepends=("postgresql: recommended database for large instances")
source=("$pkgname-$pkgver.tar.gz::https://github.com/element-hq/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
        "$pkgname.sysusers"
        "$pkgname.tmpfiles"
        "$pkgname.service")
b2sums=('c2dc31ede9377e13458b59851bd22433c5fc3729111388cd83174ad85cc83cefca1a7b8388e02b5855c57cfb0ab7d3f94ca1d430b5ed3eb2a0dc66a6b6cc5a57'
        'bd0cf2ee02603340cb0066a6786896ee5dec048e665516ad4e66913969175876e480470503093dff274377cabf7d9fe5fbe70ded605c9e6d05531a6298a634bc'
        'b35856b8d5a289f5333b0a20658b602da588676cbbc12f543044b014d8b9a244053763bae39acf7ec54387eb738cd518e460996fc687787592c63fd2d7bbd69b'
        '43d6f636b7d8e6d00e0a8f9a5ae7c9ded223d19d22713b7e77314929f76df5d59e58a1ae3685cd8e4123e8300679c2c535207c64d14183894d2fe613dbfce746')
install="$pkgname.install"

build(){
 cd "$pkgname-$pkgver"
 export CGO_CPPFLAGS="${CPPFLAGS}"
 export CGO_CFLAGS="${CFLAGS}"
 export CGO_CXXFLAGS="${CXXFLAGS}"
 export CGO_LDFLAGS="${LDFLAGS}"
 export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
 install -d -m 755 "bin"
 go build -v -o "bin/" ./cmd/...
}

check(){
 cd "$pkgname-$pkgver/cmd/$pkgname"
 export CGO_CPPFLAGS="${CPPFLAGS}"
 export CGO_CFLAGS="${CFLAGS}"
 export CGO_CXXFLAGS="${CXXFLAGS}"
 export CGO_LDFLAGS="${LDFLAGS}"
 export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
 go test
}

package(){
 cd "$pkgname-$pkgver"
 # configuration
 install -d -m 750                                 "$pkgdir/etc/$pkgname"
 install -D -m 644 "$pkgname-sample.yaml"          "$pkgdir/etc/$pkgname/config-example.yaml"
 # systemd
 install -D -m 644 "$srcdir/$pkgname.service"      "$pkgdir/usr/lib/systemd/system/$pkgname.service"
 install -D -m 644 "$srcdir/$pkgname.sysusers"     "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
 install -D -m 644 "$srcdir/$pkgname.tmpfiles"     "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
 # if the command does not start with "dendrite-", then rename it
 cd "bin"
 for bin in *; do
  if [[ "$bin" =~ ^$pkgname-* ]]; then
   install -D -m 755 "$bin" "$pkgdir/usr/bin/$bin"
  else
   install -D -m 755 "$bin" "$pkgdir/usr/bin/$pkgname-$bin"
  fi
 done
}
