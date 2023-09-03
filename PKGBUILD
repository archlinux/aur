# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=mosint
pkgver=2.3.1
pkgrel=2
pkgdesc="An automated e-mail OSINT tool"
arch=(x86_64 i686 aarch64)
url="https://github.com/alpkeskin/mosint"
license=(MIT)
depends=(glibc)
makedepends=(go)

source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
  "$pkgname-$pkgver.LICENSE::https://raw.githubusercontent.com/alpkeskin/mosint/1fcdcef01fe1b3868ecc7e41d77a1dae539a03f2/LICENSE"
)
sha256sums=(
  'c4d72e482b85570a1a73776eef47e993b5f8fa6c204e0b1caa794e4df4f13521'
  'd11e911bf756cdff4ff8b338686a0ff3fb7a6d116dbe610bf1c4aad99ce5a4eb'
)

_archive="$pkgname-$pkgver"

build() {
  cd "$_archive"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -v .
}

package() {
  cd "$_archive"

  install -Dm755 mosint "${pkgdir}/usr/bin/mosint"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "$srcdir/$pkgname-$pkgver.LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
