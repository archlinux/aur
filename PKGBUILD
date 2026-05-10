# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

# https://github.com/mathworks/Emacs-MATLAB-Mode/blob/default/doc/matlab-language-server-lsp-mode.org#installation
# https://github.com/mathworks/MATLAB-language-server/issues/79
# https://github.com/zed-extensions/matlab?tab=readme-ov-file#installation-steps

pkgname="matlab-language-server"
pkgver=1.3.11
pkgrel=1
pkgdesc="Implementation of the Microsoft Language Server Protocol for the MATLAB language"
arch=(
  'any'
)
url="https://github.com/mathworks/MATLAB-language-server"
license=(
  'MIT'
)
depends=(
  'matlab-release>=R2021b'
  'nodejs'
)
makedepends=(
  'npm'
)
_pkgsrc="${url##*/}-${pkgver}"
source=(
  "${url}/archive/refs/tags/v${pkgver}/${_pkgsrc}.tar.gz"
)
sha256sums=('b82c644b10d5a1b06c4e51ba5e57fc69c7e9ab5cf52ea54d02890a265d4a5110')

_source() {
  export NPM_CONFIG_CACHE="${srcdir}/.npm"
}

prepare() {
  _source

  cd "${srcdir}/${_pkgsrc}"
  npm ci
}

build() {
  _source

  cd "${srcdir}/${_pkgsrc}"
  npm run project-install
  npm run compile
  npm run package
}

# check() {
#   _source

#   cd "${srcdir}/${_pkgsrc}"
#   npm run test
# }

package() {
  _source

  cd "${srcdir}/${_pkgsrc}"
  npm ci --omit=dev

  sed -i '1i#!/usr/bin/env node' "out/index.js"
  chmod +x "out/index.js"

  install -vd "${pkgdir}/usr/lib/node_modules/${pkgname}"
  cp -a --no-preserve=ownership -t "${pkgdir}/usr/lib/node_modules/${pkgname}" \
    "out" "node_modules" "matlab" # "package.json"

  install -vd "${pkgdir}/usr/bin"
  ln -vsf "/usr/lib/node_modules/${pkgname}/out/index.js" "${pkgdir}/usr/bin/${pkgname}"
  ln -vsf "${pkgname}" "${pkgdir}/usr/bin/matlab_ls"

  install -vDm644 "CHANGELOG.md" "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -vDm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
