# Maintainer: akku <akkun11.open [at] gmail.com>
# Contributor: AlphaJack <alphajack at tuta dot io>
# Contributor: Stefan Tatschner <stefan@rumpelsepp.org>
# Contributor: Cedric Girard <cgirard [dot] archlinux [at] valinor [dot] fr>
# Contributor: Stefan Tatschner <stefan@rumpelsepp.org>

pkgname="dendrite-git"
_pkgname=${pkgname%-git}
pkgver=r2956.7cc7ebb4
pkgrel=1
pkgdesc="A second-generation Matrix homeserver written in Go"
url="https://element-hq.github.io/dendrite/"
license=("Apache")
arch=("x86_64" "i686" "armv6h" "armv7h" "aarch64")
# https://github.com/quic-go/quic-go/wiki/quic-go-and-Go-versions
makedepends=("git" "go")
provides=("dendrite")
conflicts=("dendrite")
optdepends=("postgresql: recommended database for large instances")
source=("git+https://github.com/element-hq/dendrite.git"
        "$_pkgname.sysusers"
        "$_pkgname.tmpfiles"
        "$_pkgname.service")
b2sums=('SKIP'
        'bd0cf2ee02603340cb0066a6786896ee5dec048e665516ad4e66913969175876e480470503093dff274377cabf7d9fe5fbe70ded605c9e6d05531a6298a634bc'
        'b35856b8d5a289f5333b0a20658b602da588676cbbc12f543044b014d8b9a244053763bae39acf7ec54387eb738cd518e460996fc687787592c63fd2d7bbd69b'
        '43d6f636b7d8e6d00e0a8f9a5ae7c9ded223d19d22713b7e77314929f76df5d59e58a1ae3685cd8e4123e8300679c2c535207c64d14183894d2fe613dbfce746')
install="$_pkgname.install"

pkgver() {
 cd "$_pkgname"
 printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build(){
 cd "$_pkgname"
 export CGO_CPPFLAGS="${CPPFLAGS}"
 export CGO_CFLAGS="${CFLAGS}"
 export CGO_CXXFLAGS="${CXXFLAGS}"
 export CGO_LDFLAGS="${LDFLAGS}"
 export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
 install -d -m 755 "bin"
 go build -v -o "bin/" ./cmd/...
}

check(){
 cd "$_pkgname/cmd/$_pkgname"
 export CGO_CPPFLAGS="${CPPFLAGS}"
 export CGO_CFLAGS="${CFLAGS}"
 export CGO_CXXFLAGS="${CXXFLAGS}"
 export CGO_LDFLAGS="${LDFLAGS}"
 export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
 go test
}

package(){
 cd "$_pkgname"
 # configuration
 install -d -m 750                                 "$pkgdir/etc/$_pkgname"
 install -D -m 644 "$_pkgname-sample.yaml"         "$pkgdir/etc/$_pkgname/config-example.yaml"
 # systemd
 install -D -m 644 "$srcdir/$_pkgname.service"     "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
 install -D -m 644 "$srcdir/$_pkgname.sysusers"    "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"
 install -D -m 644 "$srcdir/$_pkgname.tmpfiles"    "$pkgdir/usr/lib/tmpfiles.d/$_pkgname.conf"
 # if the command does not start with "dendrite-", then rename it
 cd "bin"
 for bin in *; do
  if [[ "$bin" =~ ^$_pkgname-* ]]; then
   install -D -m 755 "$bin" "$pkgdir/usr/bin/$bin"
  else
   install -D -m 755 "$bin" "$pkgdir/usr/bin/$_pkgname-$bin"
  fi
 done
}
