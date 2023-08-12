# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="xdpcap-git"
pkgver=r45.417804f
pkgrel=1
pkgdesc="tcpdump like XDP packet capture"
url="https://github.com/cloudflare/xdpcap"
license=("BSD3")
arch=("x86_64" "aarch64" "armv7h")
makedepends=("go")
source=("git+$url")
sha256sums=("SKIP")

pkgver(){
 cd "xdpcap"
 printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare(){
 cd "xdpcap"
 mkdir -p build
}

build(){
 cd "xdpcap"
 export CGO_CPPFLAGS="${CPPFLAGS}"
 export CGO_CFLAGS="${CFLAGS}"
 export CGO_CXXFLAGS="${CXXFLAGS}"
 export CGO_LDFLAGS="${LDFLAGS}"
 export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
 go build -o build ./cmd/...
}

package(){
 cd "xdpcap"
 install -D -m 755 "build/xdpcap" -t "$pkgdir/usr/bin"
}
