# Maintainer: Axel Navarro <navarroaxel gmail>
pkgname=meridian
pkgver=1.65.0
pkgrel=1
pkgdesc="Use your Claude Max subscription with OpenCode, OpenClaw, Pi, Droid, Aider, Crush, Cline."
arch=(any)
url="https://github.com/rynfar/meridian"
license=(MIT)
depends=(nodejs)
makedepends=(bun)
provides=(meridian)
source=(https://github.com/rynfar/$pkgname/archive/refs/tags/$pkgname-v$pkgver.tar.gz)
sha512sums=('ec019496e4cda28ed360baa0d4c6243720c2795ce8b0615a5b5da69dd499384e5f3caa8e353c61efb17c853963f70883772a08aaf1dd5fcbfa2fd4da78c3abd9')

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
