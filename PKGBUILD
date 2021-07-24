pkgname=tlstunnel-git
pkgver=r67.abe91778bd4e
pkgrel=1
pkgdesc='A TLS reverse proxy'
arch=('x86_64')
url="https://sr.ht/~emersion/tlstunnel"
license=('MIT')
makedepends=('git' 'go' 'scdoc')
source=(
  "$pkgname::git+https://git.sr.ht/~emersion/tlstunnel"
  'tlstunnel.service'
  'tlstunnel.tmpfiles'
  'tlstunnel.sysusers'
)
sha256sums=(
  'SKIP'
  'a298eb15cef1253c235c89e670a01f2ef9eb09276b0661c7b265cfd8bf43326a'
  'a7666fb90c919d1698ae0e0d270be1e40a73b3f20d686bd3822ce46d46800a57'
  '068caae43739c591b84ed36db6545e7c694e17443d86bfdbc6568e49cdde103f'
)
backup=('etc/tlstunnel/config')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  make GOFLAGS="$GOFLAGS"
}

package() {
  cd "$pkgname"
  make install PREFIX=/usr DESTDIR="$pkgdir"
  install -Dm644 "$srcdir/tlstunnel.service" -t "$pkgdir/usr/lib/systemd/system"
  install -Dm644 "$srcdir/tlstunnel.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/tlstunnel.conf"
  install -Dm644 "$srcdir/tlstunnel.sysusers" "$pkgdir/usr/lib/sysusers.d/tlstunnel.conf"
  install -Dm644 "/dev/null" "$pkgdir/etc/tlstunnel/config"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
