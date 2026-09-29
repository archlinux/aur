# Maintainer: Axel Navarro <navarroaxel gmail>
pkgname=meridian
pkgver=1.78.0
pkgrel=1
pkgdesc="Use your Claude Max subscription with OpenCode, OpenClaw, Pi, Droid, Aider, Crush, Cline."
arch=(any)
url="https://github.com/rynfar/meridian"
license=(MIT)
depends=(nodejs)
makedepends=(bun)
provides=(meridian)
source=(https://github.com/rynfar/$pkgname/archive/refs/tags/$pkgname-v$pkgver.tar.gz)
sha512sums=('ba9029fcf0a062615cd7e8731c9b84853bb17563b8d44c5ce8157c180b1fffe673c304497d307de407323a36861bd9e57951fe9d535a8f5c42b8797aee00e3fa')

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
