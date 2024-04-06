# Maintainer: fossdd <fossdd@pwned.life>
_pkgname=lyrebird-proxy
pkgname=lyrebird-proxy-git
pkgver=r241.aab4891
pkgrel=1
pkgdesc="pluggable transport proxy for Tor, implementing obfs4"
url="https://gitlab.torproject.org/tpo/anti-censorship/pluggable-transports/lyrebird"
license=('BSD-3-Clause')
arch=('x86_64' 'aarch64' 'armv7h')
depends=('glibc')
makedepends=('go')
conflicts=($_pkgname)
provides=($_pkgname)
source=("$pkgname::git+https://gitlab.torproject.org/tpo/anti-censorship/pluggable-transports/lyrebird.git"
        lyrebird-proxy.service)
sha256sums=('SKIP'
            '63b16cb083656a661d1cbe0198f2f3bb0fabc6bb09ad4501d1c470c7b3f832ab')
b2sums=('SKIP'
        'a5e898ccf657f541ed8c406c4f1970c5b8bd7389725899aced3f9d2b0f134d3f4e804d065f9018789a1403f209d5ad04e8af1dc4ffe719e844fabee53d1a7fe3')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"

  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -v -o lyrebird ./cmd/lyrebird
}

package() {
  cd "$srcdir/$pkgname"

  install -Dm0755 lyrepird "$pkgdir/usr/bin/lyrebird"
  install -Dm0644 "$srcdir/lyrebird-proxy.service" "$pkgdir/usr/lib/systemd/system/lyrebird-proxy.service"

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
