# Maintainer: Christian Pfeiffer <cpfeiffer@live.de>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgname=gotlsaflare
pkgver=2.8.4
pkgrel=2
pkgdesc="Update TLSA DANE records on Cloudflare from X509 certificate"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/Stenstromen/gotlsaflare"
depends=('glibc')
license=('MIT')
makedepends=('go' 'git')
source=("git+$url#tag=v$pkgver")
sha512sums=('6c86a707887296e0ef718b88383665e6ba80d59e90d94f7fc9b55268d7926846d8f2425a415f1f0ba9ab54d47d546514d67a3aa730a08d47bbf784b6759fe490')
b2sums=('a2c87a4203d99777bc66c7d9968fdaa76596bd9ebc903c576f00ce9486c0c33bf4088d4e97ab3904f455feeb17d0d840409c2d449694534ae3758244fbb56f53')

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
