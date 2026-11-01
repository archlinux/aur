# Maintainer: marang <1550038+marang@users.noreply.github.com>
# Release template: the AUR workflow replaces pkgver and sha256sums from the
# pushed version tag, resets pkgrel to 1, verifies the resulting source, and
# builds it before push.
pkgname=sway-title-animator
pkgver=0.10.2
pkgrel=1
pkgdesc="Animated Unicode titlebars for Sway"
arch=('x86_64' 'aarch64')
url="https://automation.izoone.com/releases/sway-title-animator"
license=('MIT')
depends=('sway')
makedepends=('go>=1.26.10')
options=('!debug')
source=("sway-title-animator-$pkgver.tar.gz::$url/v$pkgver/sway-title-animator-7597ad2be20b3c98a263e78e3dbf9307b409267e.tar.gz")
sha256sums=('b2a81cd9135aac0b21913c96f842bcb669f3f7c11eb39ef059330770fb322628')

_go_build_flags=(-buildmode=pie -trimpath -buildvcs=false -mod=readonly -modcacherw)
_go_ldflags=(-s -w -buildid=)

build() {
  cd "sway-title-animator-7597ad2be20b3c98a263e78e3dbf9307b409267e"
  if [[ -d cmd/sway-session ]]; then
    printf '%s\n' 'This animator-only recipe requires split source (v0.10.0 or newer).' 'Use the released v0.9.3 recipe for the combined package, or wait for the v0.10.0 metadata sync.' >&2
    return 1
  fi
  export GOCACHE="$srcdir/go-build"
  export GOMODCACHE="$srcdir/go-mod"
  export GOTOOLCHAIN=local

  CGO_ENABLED=0 go build "${_go_build_flags[@]}" -ldflags="${_go_ldflags[*]}" -o sway-title-animator ./cmd/sway-title-animator
}

check() {
  cd "sway-title-animator-7597ad2be20b3c98a263e78e3dbf9307b409267e"
  export GOCACHE="$srcdir/go-build"
  export GOMODCACHE="$srcdir/go-mod"
  export GOTOOLCHAIN=local

  CGO_ENABLED=0 go test "${_go_build_flags[@]}" -count=1 ./...
}

package() {
  cd "sway-title-animator-7597ad2be20b3c98a263e78e3dbf9307b409267e"
  install -Dm755 sway-title-animator "$pkgdir/usr/bin/sway-title-animator"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 config.example.toml "$pkgdir/usr/share/doc/$pkgname/config.example.toml"
  install -Dm644 contrib/sway/45-title-animator.conf "$pkgdir/usr/share/doc/$pkgname/45-title-animator.conf"
}
