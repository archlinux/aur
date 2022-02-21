# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor dax <dev@dax.moe>

pkgname="xdcc-git"
pkgver=0.3.1.r1.g3a5ea97
_pkgver=0.3.1
pkgrel=1
pkgdesc="xdcc file downloader"
arch=("x86_64" "armv6" "armv7" "aarch64")
url="https://git.sr.ht/~dax/xdcc"
license=("ISC")
provides=("xdcc")
conflicts=("xdcc")
makedepends=("go" "scdoc")
source=("git+https://git.sr.ht/~dax/xdcc")
sha256sums=("SKIP")

pkgver(){
 cd "xdcc"
 git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build(){
 cd "xdcc"
 export CGO_CPPFLAGS="${CPPFLAGS}"
 export CGO_CFLAGS="${CFLAGS}"
 export CGO_CXXFLAGS="${CXXFLAGS}"
 export CGO_LDFLAGS="${LDFLAGS}"
 export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
 go build -o xdcc .
 scdoc < "xdcc.1.scd" > "xdcc.1"
 gzip -f9 "xdcc.1"
}

package(){
 cd "xdcc"
 install -D -m 0755 "xdcc" "$pkgdir/usr/bin/xdcc"
 install -D -m 0644 "xdcc.1.gz" "$pkgdir/usr/share/man/man1/xdcc.1"
 install -D -m 0644 "LICENSE" "$pkgdir/usr/share/licenses/xdcc/LICENSE"
 install -D -m 0644 "README.md" "$pkgdir/usr/share/doc/xdcc/README.md"
}
