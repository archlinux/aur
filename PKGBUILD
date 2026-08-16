# Maintainer: Ismet Togay <ismet.togay at gmail dot com>
pkgname=auggie
_npmname=@augmentcode/auggie
pkgver=0.35.0
pkgrel=2
pkgdesc="Augment Code's agentic AI CLI for context-aware code analysis and automation"
arch=('any')
url="https://www.augmentcode.com"
license=('LicenseRef-auggie')
depends=('nodejs>=20')
makedepends=('npm')
provides=('auggie-bin')
conflicts=('auggie-bin')
replaces=('auggie-bin')
source=("https://registry.npmjs.org/${_npmname}/-/${pkgname}-${pkgver}.tgz"
        "auggie.js")
noextract=("${pkgname}-${pkgver}.tgz")
b2sums=('40776a4e76700c7c1eafc4df5c0f76c5c80edcc11f82ec664985f5665212f0e3db5ef742d710bdbaa5beb38a7de351a983e5735dbb5ea5103fa2793109c79824'
        '38b4443caf787bf354e9b64fe09eb3f1e995fa6d58502ca4a3f8a094585d44aab4370e326009d1938a790afd291138c7906f7a66ef2995720c98382b779ef3b5')

check() {
  local _tmpdir="${srcdir}/check-src"
  mkdir -p "${_tmpdir}"
  tar -xf "${srcdir}/${pkgname}-${pkgver}.tgz" -C "${_tmpdir}"
  local _ver
  _ver="$(node "${_tmpdir}/package/augment.mjs" --version)"
  [[ "${_ver}" == "${pkgver}"* ]]

  # Wrapper must refuse self-upgrade without contacting the npm registry
  local _out
  _out="$(node "${srcdir}/auggie.js" update --skip-confirmation 2>&1)" && return 1
  [[ "${_out}" == *"AUR helper"* ]]
  _out="$(node "${srcdir}/auggie.js" --quiet update 2>&1)" && return 1
  [[ "${_out}" == *"AUR helper"* ]]
}

package() {
  # Keep npm cache out of $HOME
  npm install -g --prefix "${pkgdir}/usr" \
    --cache "${srcdir}/npm-cache" \
    --userconfig /dev/null \
    --offline --ignore-scripts \
    --no-audit --no-fund \
    "${srcdir}/${pkgname}-${pkgver}.tgz"

  # npm may chmod dirs 777 (https://github.com/npm/npm/issues/9359)
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +

  # Drop optional node-pty ELF prebuilds (invalid with arch=any)
  rm -rf "${pkgdir}/usr/lib/node_modules/${_npmname}/node_modules"

  # Block npm self-upgrade (AUGMENT_DISABLE_AUTO_UPDATE only stops the daemon)
  install -Dm755 "${srcdir}/auggie.js" "${pkgdir}/usr/bin/auggie"

  install -Dm644 "${pkgdir}/usr/lib/node_modules/${_npmname}/LICENSE.md" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
