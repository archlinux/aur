pkgname=tlstunnel
pkgver=0.3.0
pkgrel=1
pkgdesc='A TLS reverse proxy'
arch=('x86_64')
url="https://sr.ht/~emersion/tlstunnel"
license=('MIT')
makedepends=('go' 'scdoc')
conflicts=('tlstunnel-git')
source=(
  "https://git.sr.ht/~emersion/tlstunnel/refs/download/v$pkgver/tlstunnel-$pkgver.tar.gz"
  "https://git.sr.ht/~emersion/tlstunnel/refs/download/v$pkgver/tlstunnel-$pkgver.tar.gz.sig"
  'tlstunnel.service'
  'tlstunnel.tmpfiles'
  'tlstunnel.sysusers'
)
validpgpkeys=("34FF9526CFEF0E97A340E2E40FDE7BE0E88F5E48")
sha256sums=('409eafb46e86903293ab9b1ca94e7fe14fa2621c9bb86e7a150484e5073ffe07'
            'SKIP'
            'a298eb15cef1253c235c89e670a01f2ef9eb09276b0661c7b265cfd8bf43326a'
            '4a891acfb64531c8ff3a9b1d596df749614d89dd4edd4571f683b71c7c31a5a6'
            '068caae43739c591b84ed36db6545e7c694e17443d86bfdbc6568e49cdde103f')
backup=('etc/tlstunnel/config')

prepare() {
  cd "$pkgname-$pkgver"
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  make GOFLAGS="$GOFLAGS"
}

package() {
  cd "$pkgname-$pkgver"
  make install PREFIX=/usr DESTDIR="$pkgdir"
  install -Dm644 "$srcdir/tlstunnel.service" -t "$pkgdir/usr/lib/systemd/system"
  install -Dm644 "$srcdir/tlstunnel.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/tlstunnel.conf"
  install -Dm644 "$srcdir/tlstunnel.sysusers" "$pkgdir/usr/lib/sysusers.d/tlstunnel.conf"
  install -Dm644 "/dev/null" "$pkgdir/etc/tlstunnel/config"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
