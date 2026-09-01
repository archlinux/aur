# Maintainer: marang <1550038+marang@users.noreply.github.com>
# Release template: the AUR workflow replaces pkgver and sha256sums from the
# pushed version tag, resets pkgrel to 1, verifies the resulting source, and
# builds it before push.
pkgname=sway-title-animator
pkgver=0.4.0
pkgrel=1
pkgdesc="Animated Unicode titlebars for Sway"
arch=('x86_64' 'aarch64')
url="https://github.com/marang/sway-title-animator"
license=('MIT')
depends=('sway')
optdepends=(
  'libpulse: sound-reactive animation presets via parec'
  'alacritty: persistent work-session windows'
  'herdr>=0.8.2: persistent terminal panes, history, and agent sessions'
  'flatpak: restore explicitly registered Flatpak desktop applications'
  'glib2: restore desktop-entry applications through gio'
  'noto-fonts: recommended Noto Sans Mono glyph coverage for desktop-app indicators'
  'apparmor: secure Codex resume boundary'
)
makedepends=('go>=1.26.5')
options=('!debug')
source=("sway-title-animator-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5894bf6542444887124d0cdd4fa8aca0475e6c7173ae59a60bf252d5b6632593')

_go_build_flags=(-buildmode=pie -trimpath -buildvcs=false -mod=readonly -modcacherw)
_go_ldflags=(-s -w -buildid=)

build() {
  cd "sway-title-animator-$pkgver"
  export GOCACHE="$srcdir/go-build"
  export GOMODCACHE="$srcdir/go-mod"
  export GOTOOLCHAIN=local

  CGO_ENABLED=0 go build "${_go_build_flags[@]}" -ldflags="${_go_ldflags[*]}" -o sway-title-animator ./cmd/sway-title-animator
  CGO_ENABLED=0 go build "${_go_build_flags[@]}" -ldflags="${_go_ldflags[*]}" -o sway-session ./cmd/sway-session
  CGO_ENABLED=0 go build "${_go_build_flags[@]}" -ldflags="${_go_ldflags[*]}" -o sway-herdr-init ./cmd/sway-herdr-init
}

check() {
  cd "sway-title-animator-$pkgver"
  export GOCACHE="$srcdir/go-build"
  export GOMODCACHE="$srcdir/go-mod"
  export GOTOOLCHAIN=local

  CGO_ENABLED=0 go test "${_go_build_flags[@]}" -count=1 ./...
}

package() {
  cd "sway-title-animator-$pkgver"
  install -Dm755 sway-title-animator "$pkgdir/usr/bin/sway-title-animator"
  install -Dm755 sway-session "$pkgdir/usr/bin/sway-session"
  install -Dm755 sway-herdr-init "$pkgdir/usr/bin/sway-herdr-init"
  install -Dm644 contrib/completions/bash/sway-session "$pkgdir/usr/share/bash-completion/completions/sway-session"
  install -Dm644 contrib/completions/zsh/_sway-session "$pkgdir/usr/share/zsh/site-functions/_sway-session"
  install -Dm644 contrib/completions/fish/sway-session.fish "$pkgdir/usr/share/fish/vendor_completions.d/sway-session.fish"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 config.example.toml "$pkgdir/usr/share/doc/$pkgname/config.example.toml"
  install -Dm644 contrib/sway/45-title-animator.conf "$pkgdir/usr/share/doc/$pkgname/45-title-animator.conf"
  install -Dm644 contrib/herdr/config.toml "$pkgdir/usr/share/doc/$pkgname/contrib/herdr/config.toml"
  install -Dm644 contrib/codex/hooks-system.json "$pkgdir/usr/share/doc/$pkgname/contrib/codex/hooks.json"
  install -Dm644 contrib/apparmor/codex-home-guard "$pkgdir/usr/share/doc/$pkgname/contrib/apparmor/codex-home-guard"
  install -Dm755 scripts/verify-codex-boundary.sh "$pkgdir/usr/share/doc/$pkgname/scripts/verify-codex-boundary.sh"
}
