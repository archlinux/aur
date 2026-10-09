# Maintainer: marang <1550038+marang@users.noreply.github.com>
# Release template: the AUR workflow resolves the requested immutable release
# tag, pins source to its verified commit and computes the archive checksum
# before verification, build and publication. Historical bootstrap placeholders
# must never reach the AUR.
pkgname=sway-session
pkgver=0.8.0
pkgrel=1
_commit=f61cc4a02b44e5c962c57a2db2fb1f148aea6811
pkgdesc="Persistent work sessions for Sway"
arch=('x86_64' 'aarch64')
url="https://github.com/marang/sway-session"
license=('MIT')
depends=('sway')
makedepends=('go>=1.26.5')
options=('!debug')
source=("sway-session-$pkgver.tar.gz::$url/archive/f61cc4a02b44e5c962c57a2db2fb1f148aea6811.tar.gz")
sha256sums=('3353b3d2511d366ca5193c014b0ef93813b8443bfeb1f5b37639c5dc2eccbe1d')

_go_build_flags=(-buildmode=pie -trimpath -buildvcs=false -mod=readonly -modcacherw)
_go_ldflags=(-s -w -buildid= -X "main.version=$pkgver" -X "main.commit=$_commit" -X "main.modified=false" -X "github.com/marang/sway-session/internal/buildmetadata.Stamp=sway-session-build-v1|$pkgver|$_commit|false|end-sway-session-build-v1")

build() {
  cd "sway-session-f61cc4a02b44e5c962c57a2db2fb1f148aea6811"
  export GOCACHE="$srcdir/go-build"
  export GOMODCACHE="$srcdir/go-mod"
  export GOTOOLCHAIN=local

  CGO_ENABLED=0 go build "${_go_build_flags[@]}" -ldflags="${_go_ldflags[*]}" -o sway-session ./cmd/sway-session
}

check() {
  cd "sway-session-f61cc4a02b44e5c962c57a2db2fb1f148aea6811"
  export GOCACHE="$srcdir/go-build"
  export GOMODCACHE="$srcdir/go-mod"
  export GOTOOLCHAIN=local

  CGO_ENABLED=0 go test "${_go_build_flags[@]}" -count=1 ./...
}

package() {
  cd "sway-session-f61cc4a02b44e5c962c57a2db2fb1f148aea6811"
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
