# Maintainer: Marc Straube <email@marcstraube.de>

pkgname=socket-cli
pkgver=1.1.173
pkgrel=1
pkgdesc='Socket CLI — find and fix vulnerabilities, malware and supply chain risks in your dependencies'
arch=('any')
url='https://github.com/SocketDev/socket-cli'
license=('MIT')
depends=('nodejs>=18.20.8')
makedepends=('pnpm')
optdepends=('npm: socket-npm and socket-npx wrappers'
            'pnpm: socket-pnpm wrapper'
            'yarn: socket-yarn wrapper'
            'socket-patch: support for the "socket patch" command (separate Rust binary)')
provides=('socket')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2d3ba887cfd993cfe5cd0884bb4aef7c5c050f1ad9e5b1475d1539e63075ab35')

build() {
  cd "$srcdir/socket-cli-$pkgver"

  # --ignore-scripts blocks arbitrary postinstall scripts from the ~500
  # transitive npm dependencies; nothing in this build should need them.
  # If the build fails needing a postinstall-fetched binary, drop this flag.
  pnpm install --frozen-lockfile --ignore-scripts
  pnpm run build
}

package() {
  cd "$srcdir/socket-cli-$pkgver"

  local instdir="$pkgdir/usr/lib/$pkgname"

  # Mirrors package.json's "files" allowlist (what npm would publish),
  # built locally instead of trusting the prebuilt npm tarball.
  install -d "$instdir"
  cp -a bin dist external shadow-bin "$instdir/"
  install -Dm644 package.json      "$instdir/package.json"
  install -Dm644 requirements.json "$instdir/requirements.json"
  install -Dm644 translations.json "$instdir/translations.json"
  install -Dm644 CHANGELOG.md      "$instdir/CHANGELOG.md"
  install -Dm644 DISCLOSURE        "$instdir/DISCLOSURE"

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
  install -Dm644 "$instdir/dist/socket-completion.bash" \
    "$pkgdir/usr/share/bash-completion/completions/socket"

  # License
  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
