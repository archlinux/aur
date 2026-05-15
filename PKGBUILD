# Maintainer: Ismet Togay <ismet.togay@gmail.com>
pkgname=auggie-bin
pkgver=0.27.2
pkgrel=1
pkgdesc="Augment Code's agentic AI CLI for context-aware code analysis and automation"
arch=('any')
url="https://github.com/augmentcode/auggie"
license=('custom')
depends=('nodejs>=20')
makedepends=('npm')
optdepends=('bash: for bash completion'
            'zsh: for zsh completion'
            'fish: for fish completion')
source=("https://registry.npmjs.org/@augmentcode/auggie/-/auggie-${pkgver}.tgz"
        "LICENSE")
noextract=("auggie-${pkgver}.tgz")
sha512sums=('cf8197913772e73c89dc76eeec825a61407ba20bc704f186cf0595d1bd963c33ede61327e18262c8fa3dda4cc4b53678a6bd63e915f0dca01ac42b13288062fa'
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
    "${srcdir}/auggie-${pkgver}.tgz"

  # Fix permissions (npm race condition gives 777 to random directories)
  # See: https://github.com/npm/npm/issues/9359
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
  find "${pkgdir}/usr/lib/node_modules" -type f -exec chmod 644 {} +
  chmod +x "${pkgdir}/usr/bin/auggie"

  # Install the proprietary software license
  install -Dm644 "${pkgdir}/usr/lib/node_modules/@augmentcode/auggie/LICENSE.md" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"

  # Install the 0BSD license for the AUR packaging files
  install -Dm644 "${srcdir}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-AUR.md"
}
