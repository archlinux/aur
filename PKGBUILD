# Maintainer: Ismet Togay <ismet dot togay at gmail dot com>
pkgname=auggie-bin
pkgver=0.35.0
pkgrel=4
pkgdesc="Augment Code's agentic AI CLI for context-aware code analysis and automation"
arch=('any')
url="https://github.com/augmentcode/auggie"
license=('LicenseRef-auggie')
depends=('nodejs>=20')
makedepends=('npm')
source=("https://registry.npmjs.org/@augmentcode/auggie/-/auggie-${pkgver}.tgz"
        "LICENSE")
noextract=("auggie-${pkgver}.tgz")
sha512sums=('2ccf32ce0a239457a546cecce7e0a4dcb5e64be84d9651e3f6fd2ce822aec198f620be685740b4d07d45df4b04dc07f7edf439d6b33ce4ed7c5d35d66ced9ef4'
            '3d195f09523a15f7e406e345ba95015e05df571f5d7bdc7af1444922c2a3f3cf795292fb72897b51f3bbb006db5e947c7cb0ded8dcf09c32b80aef97db3f9910')

package() {
  # Use a local npm cache to avoid polluting the user's home directory
  local _npm_cache="${srcdir}/npm-cache"
  mkdir -p "${_npm_cache}"

  # Install npm package globally into package directory
  # Using --cache and --userconfig to isolate the build environment
  npm install -g --prefix "${pkgdir}/usr" \
    --cache "${_npm_cache}" \
    --userconfig /dev/null \
    --no-audit --no-fund \
    "${srcdir}/auggie-${pkgver}.tgz"

  # Fix permissions (npm race condition gives 777 to random directories)
  # See: https://github.com/npm/npm/issues/9359
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
  find "${pkgdir}/usr/lib/node_modules" -type f -exec chmod 644 {} +
  # node-pty's spawn-helper is a native executable helper (used on macOS);
  # restore its exec bit stripped by the chmod above
  find "${pkgdir}/usr/lib/node_modules" -type f -name 'spawn-helper' -exec chmod 755 {} +
  # Ensure the CLI entry point is executable (chmod the real file, not the bin symlink)
  chmod +x "${pkgdir}/usr/lib/node_modules/@augmentcode/auggie/augment.mjs"

  # Install the proprietary software license
  install -Dm644 "${pkgdir}/usr/lib/node_modules/@augmentcode/auggie/LICENSE.md" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"

  # Install the 0BSD license for the AUR packaging files
  install -Dm644 "${srcdir}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-AUR.md"
}
