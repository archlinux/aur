# Maintainer: Axel Navarro <navarroaxel gmail>
pkgname=meridian
pkgver=1.66.0
pkgrel=1
pkgdesc="Use your Claude Max subscription with OpenCode, OpenClaw, Pi, Droid, Aider, Crush, Cline."
arch=(any)
url="https://github.com/rynfar/meridian"
license=(MIT)
depends=(nodejs)
makedepends=(bun)
provides=(meridian)
source=(https://github.com/rynfar/$pkgname/archive/refs/tags/$pkgname-v$pkgver.tar.gz)
sha512sums=('1c98bcb8847b9aeda9af2f937aa8bbabc7c0628f80fe07594bbe418a15d0a1a644d1f0cc174e4aa5e941a55905ada17d0c88fe26915f8abd8590b17ea646d7de')

build() {
  cd "$srcdir/$pkgname-${pkgname}-v${pkgver}"

  bun install
  bun run build

  # Drop devDependencies now that dist/ is built; keep only runtime deps.
  # bun install --production won't remove already-installed devDeps on its
  # own, so wipe node_modules first to force a clean production-only install.
  rm -rf node_modules
  bun install --production

  # Bun doesn't filter optionalDependencies by the "libc" field, so it
  # installs both glibc and musl native binaries for @anthropic-ai/*;
  # Arch is glibc-only, so drop the musl copies (~460 MiB of dead weight)
  rm -rf node_modules/@anthropic-ai/claude-code-linux-x64-musl
  rm -rf node_modules/@anthropic-ai/claude-agent-sdk-linux-x64-musl
}

package() {
  cd "$srcdir/$pkgname-${pkgname}-v${pkgver}"

  install -dm755 "${pkgdir}/usr/lib/${pkgname}"
  cp -a dist plugin node_modules package.json "${pkgdir}/usr/lib/${pkgname}/"

  install -d "$pkgdir/usr/bin"
  ln -s "/usr/lib/${pkgname}/dist/cli.js" "$pkgdir/usr/bin/${pkgname}"
}
