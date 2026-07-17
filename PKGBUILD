# Maintainer: Duncan Mac-Vicar P. <duncan@mac-vicar.eu>
pkgname=agentjail
pkgver=0.9.0
pkgrel=1
pkgdesc='Local policy guardrails that intercept and validate AI coding-agent tool calls before they run'
arch=('x86_64' 'aarch64')
url='https://github.com/LuD1161/agentjail'
license=('Apache-2.0')
makedepends=('git' 'go')
options=(!debug)
install="$pkgname.install"
source=("git+https://github.com/LuD1161/agentjail.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"

  export CGO_ENABLED=0
  local _ldflags="-X github.com/LuD1161/agentjail/internal/buildinfo.Version=${pkgver} -s -w"

  # Two real binaries (upstream ships only these); the daemon/shield/netproxy/
  # secrets roles are argv[0] dispatches of the same agentjail multicall binary.
  # Output outside the tree: a same-named "agentjail/" module dir exists at the
  # repo root, so "-o agentjail" would collide with it.
  go build -trimpath -buildmode=pie -mod=readonly \
    -ldflags "$_ldflags" -o "$srcdir/out/agentjail" ./cmd/agentjail
  go build -trimpath -buildmode=pie -mod=readonly \
    -ldflags "$_ldflags" -o "$srcdir/out/agentjail-hook" ./cmd/agentjail-hook
}

package() {
  cd "$srcdir/$pkgname"

  install -Dm755 "$srcdir/out/agentjail" "$pkgdir/usr/bin/agentjail"
  install -Dm755 "$srcdir/out/agentjail-hook" "$pkgdir/usr/bin/agentjail-hook"

  # Role symlinks for the multicall binary (matches selfupdate.EnsureRoleSymlinks).
  for _role in daemon shield netproxy secrets; do
    ln -s agentjail "$pkgdir/usr/bin/agentjail-${_role}"
  done

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 THIRD_PARTY_LICENSES \
    "$pkgdir/usr/share/licenses/$pkgname/THIRD_PARTY_LICENSES"
}
