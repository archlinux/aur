# Maintainer: npil <npil>
# Contributor: fossdd <fossdd@pwned.life>
pkgname=lyrebird-proxy
pkgver=0.8.1
pkgrel=1
pkgdesc="pluggable transport proxy for Tor, implementing obfs4"
url="https://gitlab.torproject.org/tpo/anti-censorship/pluggable-transports/lyrebird"
license=('BSD-3-Clause' 'GPL-3.0-or-later')
arch=('x86_64' 'aarch64' 'armv7h')
depends=('glibc')
makedepends=('go' 'git')
source=("$pkgname::git+$url.git#tag=lyrebird-$pkgver?signed")
sha256sums=('SKIP')
# Shelikhoo <shelikhoo@torproject.org>
validpgpkeys=('40BBCBED223F5EB2A03EF657D7D7A110ABC79A6C')

build() {
  cd "$srcdir/$pkgname"

  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -v -o lyrebird ./cmd/lyrebird
}

check() {
  cd "$srcdir/$pkgname"

  go test ./...
}

package() {
  cd "$srcdir/$pkgname"

  install -Dm0755 lyrebird "$pkgdir/usr/bin/lyrebird"

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 LICENSE-GPL3.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE-GPL3.txt"
}
