# Maintainer: Clever Cloud <ci@clever-cloud.com>
# Contributor: doclic <doclic@tutanota.com>

pkgname=clever-tools
pkgver=5.1.1
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
sha512sums=('3844dcf7b31b66b751df2ddcc18c246e7417a3a70e64c325b2f4096de6a3a17ec4316fcb2ccbf49afdd33a45bf8f74b80b173cb482f5eb3e7a0fe888f820aa18'
            '083dd3719a4cb1b8922c84b6af794f477839c0d64a820f3fef66359e621889b9f9260a0ccc1ed485a1513e94aa17866ca206f334aa0309850e1e4bd925cad93c')

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
