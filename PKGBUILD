# Maintainer: Axel Navarro <navarroaxel gmail>
pkgname=meridian
pkgver=1.93.0
pkgrel=1
pkgdesc="Use your Claude Max subscription with OpenCode, OpenClaw, Pi, Droid, Aider, Crush, Cline."
arch=(any)
url="https://github.com/rynfar/meridian"
license=(MIT)
depends=(nodejs)
makedepends=(bun)
provides=(meridian)
source=(https://github.com/rynfar/$pkgname/archive/refs/tags/$pkgname-v$pkgver.tar.gz)
sha512sums=('30807c553d4d4dfc848f051651cff2f145d737075912ae83f8ffb8d3f9204a832016714e5a2c2b97d7e8dd065d50d44db74438f05d3da30009a8407b25811a03')

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
