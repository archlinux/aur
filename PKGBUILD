# Maintainer: Marc Straube <email@marcstraube.de>

pkgname=socket-cli
_pkgname=socket
pkgver=1.1.158
pkgrel=1
pkgdesc='Socket CLI — find and fix vulnerabilities, malware and supply chain risks in your dependencies'
arch=('any')
url='https://github.com/SocketDev/socket-cli'
license=('MIT')
depends=('nodejs>=18.20.8')
optdepends=('npm: socket-npm and socket-npx wrappers'
            'pnpm: socket-pnpm wrapper'
            'yarn: socket-yarn wrapper'
            'socket-patch: support for the "socket patch" command (separate Rust binary)')
provides=('socket')
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/${_pkgname}/-/${_pkgname}-$pkgver.tgz")
sha256sums=('6b983c01aa841fecf132db39d09caeef8636ee6d00bcaa35358bb8f2d059fde8')

package() {
  local instdir="$pkgdir/usr/lib/$pkgname"

  # The npm tarball is fully self-contained: every runtime dependency is
  # vendored under external/, so a plain file copy is enough. This avoids
  # running npm during package() (no network, no $srcdir/$pkgdir references
  # leaking into package.json), unlike the generic npm-install approach.
  install -d "$instdir"
  cp -a "$srcdir/package/." "$instdir/"

  # Drop build-time-only artifacts not used at runtime (TypeScript .d.mts
  # declarations and the tsc incremental build cache).
  rm -rf "$instdir/dist/types" "$instdir/dist"/*.tsbuildinfo

  # Expose the bin entries declared in package.json.
  install -d "$pkgdir/usr/bin"
  ln -s "/usr/lib/$pkgname/bin/cli.js"      "$pkgdir/usr/bin/socket"
  ln -s "/usr/lib/$pkgname/bin/npm-cli.js"  "$pkgdir/usr/bin/socket-npm"
  ln -s "/usr/lib/$pkgname/bin/npx-cli.js"  "$pkgdir/usr/bin/socket-npx"
  ln -s "/usr/lib/$pkgname/bin/pnpm-cli.js" "$pkgdir/usr/bin/socket-pnpm"
  ln -s "/usr/lib/$pkgname/bin/yarn-cli.js" "$pkgdir/usr/bin/socket-yarn"

  # Bash completion shipped inside the package.
  install -Dm644 "$srcdir/package/dist/socket-completion.bash" \
    "$pkgdir/usr/share/bash-completion/completions/socket"

  # License (MIT).
  install -Dm644 "$srcdir/package/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
