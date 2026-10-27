# Maintainer: Christian Pfeiffer <cpfeiffer@live.de>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgname=gotlsaflare
pkgver=2.9.0
pkgrel=1
pkgdesc="Update TLSA DANE records on Cloudflare from X509 certificate"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/Stenstromen/gotlsaflare"
depends=('glibc')
license=('MIT')
makedepends=('go' 'git')
source=("git+$url#tag=v$pkgver")
sha512sums=('6c5583b0d997098f6f8e76e7574d66dbe8ad75aa679cf674af91720cc2509d15ee2b246e9bf67dcdcad8643989b3221b3b1925dd9e0af9f76ebbd0f19a45771c')
b2sums=('21872771842ec3d5566d44a610b01fc63750f3f0b7f430a29f871b3d663599472123b992dfa538490b9fe2caa15632961aafe113d01a16a98476023844730a54')

build() {
  cd "${srcdir}/${pkgname}" || exit

  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOPATH="$srcdir"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  go build -ldflags "-compressdwarf=false -linkmode external" .
}

package() {
  cd "$srcdir/${pkgname}" || exit
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
