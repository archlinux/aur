# Maintainer: Ismet Togay <ismet.togay at gmail dot com>
pkgname=auggie
_npmname=@augmentcode/auggie
pkgver=1.2.3
pkgrel=1
pkgdesc="Augment Code's agentic AI CLI for context-aware code analysis and automation"
arch=('any')
url="https://www.augmentcode.com"
license=('LicenseRef-auggie')
depends=('nodejs>=20.6.0')
makedepends=('npm')
provides=('auggie-bin')
conflicts=('auggie-bin')
replaces=('auggie-bin')
source=("https://registry.npmjs.org/${_npmname}/-/${pkgname}-${pkgver}.tgz"
        "auggie.js")
noextract=("${pkgname}-${pkgver}.tgz")
b2sums=('92ef1775eb94d03d5cd5017a5eef2d746ff0a76edc76b4ad88c52ee9eef568c4f60c944db9e898c2aa11d4c1aa66d93157dc8c096b42aa2bd0fb0491319c4c8c'
        '2c8f1a5c09118a74bac9f426dd5602652c71325e61a001198753b64337567e5696a44ba29d6cea3ee344842d71ad89b5f71137f017166f3a2bd140d2295a7308')

check() {
  local _tmpdir="${srcdir}/check-src"
  mkdir -p "${_tmpdir}"
  tar -xf "${srcdir}/${pkgname}-${pkgver}.tgz" -C "${_tmpdir}"
  local _ver
  _ver="$(node "${_tmpdir}/package/auggie-v2.mjs" --version)"
  [[ "${_ver}" == "${pkgver}"* ]]

  # Wrapper must refuse self-upgrade without contacting the npm registry
  local _out
  _out="$(node "${srcdir}/auggie.js" upgrade --skip-confirmation 2>&1)" && return 1
  [[ "${_out}" == *"AUR helper"* ]]
  _out="$(node "${srcdir}/auggie.js" --quiet upgrade 2>&1)" && return 1
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

  # Block npm self-upgrade (AUGMENT_DISABLE_AUTO_UPDATE only disables the version check)
  install -Dm755 "${srcdir}/auggie.js" "${pkgdir}/usr/bin/auggie"

  install -Dm644 "${pkgdir}/usr/lib/node_modules/${_npmname}/LICENSE.md" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
