# Maintainer: Clever Cloud <ci@clever-cloud.com>
# Contributor: doclic <doclic@tutanota.com>

pkgname=clever-tools
pkgver=5.0.0
pkgrel=1
pkgdesc="Command Line Interface for Clever Cloud. (Node.js)"
arch=('any')
url="https://github.com/CleverCloud/clever-tools"
license=('Apache-2.0')
depends=('nodejs>=22')
makedepends=('npm')
conflicts=('clever-tools-bin')

# Pure JavaScript package: nothing to strip, no debug symbols to extract
options=(!strip !debug)

# The npm registry tarball is the reference artifact: it is exactly what
# "npm install -g clever-tools" installs, published with provenance attestation.
source=("clever-tools-$pkgver.tgz::https://registry.npmjs.org/clever-tools/-/clever-tools-$pkgver.tgz"
        "clever-tools-$pkgver-package-lock.json::https://raw.githubusercontent.com/CleverCloud/clever-tools/$pkgver/package-lock.json")
sha512sums=('2ad49fffb3335779b98b53c460fc9c2fe6e6c417614ba73ee9984dd3e987bb613c3ceaa6ec4d573178e1251ada983217da48508e89eb6b1d3ffcc2c86a69dced'
            'a901387f5d51683d1f286c5d0218db2e0f72139ac7b64cbcc16d975dec99c0f3a4c5f6a15344dac4d1ec6a1d6c50c886bd2733513d5181116078e998c9c29783')

prepare() {
  cd "${srcdir}/package"

  # npm strips package-lock.json from published tarballs, so we fetch it from the
  # matching git tag. It is not optional: without it, npm resolves the transitive
  # dependency tree to whatever happens to be the latest matching version at build
  # time, which is not what this release was tested against (52 transitive packages
  # differed when measured on 4.11.0). With it, users get the exact dependency tree
  # our CI builds and we test.
  cp "${srcdir}/clever-tools-$pkgver-package-lock.json" package-lock.json

  # --omit=dev       runtime dependencies only
  # --ignore-scripts no dependency lifecycle script runs while packaging
  # --cache          keep npm out of the packager's home directory
  npm ci --omit=dev --ignore-scripts --no-audit --no-fund --cache "${srcdir}/npm-cache"
}

package() {
  cd "${srcdir}/package"

  install -d "${pkgdir}/usr/lib/clever-tools"
  cp -r bin src node_modules package.json "${pkgdir}/usr/lib/clever-tools/"

  # /usr/bin/clever is a thin wrapper around the Node.js entry point.
  # NO_UPDATE_NOTIFIER disables the built-in update check: on Arch, updating is pacman's job.
  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/clever" <<'WRAPPER'
#!/bin/sh
export NO_UPDATE_NOTIFIER=1
exec /usr/bin/node /usr/lib/clever-tools/bin/clever.js "$@"
WRAPPER

  NO_UPDATE_NOTIFIER=1 node bin/clever.js --bash-autocomplete-script /usr/bin/clever \
    | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/clever"
  NO_UPDATE_NOTIFIER=1 node bin/clever.js --zsh-autocomplete-script /usr/bin/clever \
    | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_clever"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Dependencies ship their own man pages, which namcap flags as non FHS and
  # which are of no use here: the CLI documents itself through "clever help"
  find "${pkgdir}/usr/lib/clever-tools/node_modules" -type d -name man -exec rm -rf {} +

  chown -R root:root "${pkgdir}/usr/lib/clever-tools"
}
