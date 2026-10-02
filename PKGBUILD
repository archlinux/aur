# Maintainer: marang <1550038+marang@users.noreply.github.com>
# Release template: the AUR workflow replaces sha256sums from the immutable
# pushed v0.1.0 tag before it verifies, builds, and publishes this package.
# The bootstrap checksum is replaced before publication; an unverified source
# must never reach the AUR.
pkgname=sway-session
pkgver=0.5.2
pkgrel=1
_commit=0d79c2eb3454f9388440ab18c6a4603f905b4c1a
pkgdesc="Persistent work sessions for Sway"
arch=('x86_64' 'aarch64')
url="https://github.com/marang/sway-session"
license=('MIT')
depends=('sway')
makedepends=('go>=1.26.5')
options=('!debug')
source=("sway-session-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('795b56036eea12523a862c689fdd77a418d8db73b2d3b1f2004a49d93b152108')

_go_build_flags=(-buildmode=pie -trimpath -buildvcs=false -mod=readonly -modcacherw)
_go_ldflags=(-s -w -buildid= -X "main.version=$pkgver" -X "main.commit=$_commit" -X "main.modified=false" -X "github.com/marang/sway-session/internal/buildmetadata.Stamp=sway-session-build-v1|$pkgver|$_commit|false|end-sway-session-build-v1")

build() {
  cd "sway-session-$pkgver"
  export GOCACHE="$srcdir/go-build"
  export GOMODCACHE="$srcdir/go-mod"
  export GOTOOLCHAIN=local

  CGO_ENABLED=0 go build "${_go_build_flags[@]}" -ldflags="${_go_ldflags[*]}" -o sway-session ./cmd/sway-session
}

check() {
  cd "sway-session-$pkgver"
  export GOCACHE="$srcdir/go-build"
  export GOMODCACHE="$srcdir/go-mod"
  export GOTOOLCHAIN=local

  CGO_ENABLED=0 go test "${_go_build_flags[@]}" -count=1 ./...
}

package() {
  cd "sway-session-$pkgver"
  install -Dm755 sway-session "$pkgdir/usr/bin/sway-session"
  install -Dm644 contrib/completions/bash/sway-session "$pkgdir/usr/share/bash-completion/completions/sway-session"
  install -Dm644 contrib/completions/zsh/_sway-session "$pkgdir/usr/share/zsh/site-functions/_sway-session"
  install -Dm644 contrib/completions/fish/sway-session.fish "$pkgdir/usr/share/fish/vendor_completions.d/sway-session.fish"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  # Keep this recipe usable with the currently pinned pre-branding release.
  if [[ -f docs/branding.md ]]; then
    install -Dm644 docs/branding.md "$pkgdir/usr/share/doc/$pkgname/docs/branding.md"
    install -d "$pkgdir/usr/share/doc/$pkgname/docs/assets"
    install -m644 docs/assets/*.jpeg "$pkgdir/usr/share/doc/$pkgname/docs/assets/"
  fi
  install -Dm644 docs/sway-session-plan.md "$pkgdir/usr/share/doc/$pkgname/docs/sway-session-plan.md"
  if [[ -f docs/agent-reporting.md ]]; then
    install -Dm644 docs/agent-reporting.md "$pkgdir/usr/share/doc/$pkgname/docs/agent-reporting.md"
  fi
  # Keep the release template usable with the currently pinned older source.
  if [[ -f docs/lifecycle-recovery.md ]]; then
    install -Dm644 docs/lifecycle-recovery.md "$pkgdir/usr/share/doc/$pkgname/docs/lifecycle-recovery.md"
    install -Dm644 docs/research/herdr-plugin-session-deletion.md "$pkgdir/usr/share/doc/$pkgname/docs/research/herdr-plugin-session-deletion.md"
  fi
  install -Dm644 docs/sway-session-verification.md "$pkgdir/usr/share/doc/$pkgname/docs/sway-session-verification.md"
  install -Dm644 docs/releasing.md "$pkgdir/usr/share/doc/$pkgname/docs/releasing.md"
  install -Dm644 docs/workflow_conventions.md "$pkgdir/usr/share/doc/$pkgname/docs/workflow_conventions.md"
  install -Dm644 docs/adr/0001-sqlite-session-runtime-state.md "$pkgdir/usr/share/doc/$pkgname/docs/adr/0001-sqlite-session-runtime-state.md"
  install -Dm644 contrib/sway/50-sway-session.conf "$pkgdir/usr/share/doc/$pkgname/50-sway-session.conf"
  install -Dm644 contrib/herdr/config.toml "$pkgdir/usr/share/doc/$pkgname/contrib/herdr/config.toml"
  install -Dm644 contrib/sway-session/config.toml "$pkgdir/usr/share/doc/$pkgname/contrib/sway-session/config.toml"
  install -Dm644 contrib/codex/hooks-system.json "$pkgdir/usr/share/doc/$pkgname/contrib/codex/hooks.json"
  install -Dm644 contrib/apparmor/agent-home-guard "$pkgdir/usr/share/doc/$pkgname/contrib/apparmor/agent-home-guard"
  install -Dm755 scripts/verify-codex-boundary.sh "$pkgdir/usr/share/doc/$pkgname/scripts/verify-codex-boundary.sh"
}
