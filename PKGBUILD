# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

# https://github.com/mathworks/Emacs-MATLAB-Mode/blob/default/doc/matlab-language-server-lsp-mode.org#installation
# https://github.com/mathworks/MATLAB-language-server/issues/79
# https://github.com/zed-extensions/matlab?tab=readme-ov-file#installation-steps

pkgname="matlab-language-server"
pkgver=1.3.10
pkgrel=2
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
sha256sums=('0f767e2a0f955987ba00f4fbb7ccd346b2d99bc6c77c182b370a9df780853415')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  npm ci --cache "${srcdir}/.npm"
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  npm run project-install --cache "${srcdir}/.npm"
  npm run compile --cache "${srcdir}/.npm"
  npm run package --cache "${srcdir}/.npm"
}

check() {
  cd "${srcdir}/${_pkgsrc}"
  npm run test --cache "${srcdir}/.npm"
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  npm ci --omit=dev --cache "${srcdir}/.npm"

  sed -i '1i#!/usr/bin/env node' "out/index.js"
  chmod +x "out/index.js"

  install -vd "${pkgdir}/usr/lib/node_modules/${pkgname}"
  cp -a --no-preserve=ownership -t "${pkgdir}/usr/lib/node_modules/${pkgname}" \
    "out" "node_modules" "matlab" # "package.json"

  install -vd "${pkgdir}/usr/bin"
  ln -vsf "/usr/lib/node_modules/${pkgname}/out/index.js" "${pkgdir}/usr/bin/${pkgname}"
  ln -vsf "${pkgname}" "${pkgdir}/usr/bin/matlab_ls"

  install -vDm644 "CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
