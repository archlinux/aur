# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

# https://github.com/mathworks/Emacs-MATLAB-Mode/blob/default/doc/matlab-language-server-lsp-mode.org#installation
# https://github.com/mathworks/MATLAB-language-server/issues/79
# https://github.com/zed-extensions/matlab?tab=readme-ov-file#installation-steps
# https://github.com/mathworks/MATLAB-extension-for-vscode/blob/main/README.md#matlab-install-path-setting

: "${MAKEPKG_MATLAB_PREFIX:=/opt}"
: "${MAKEPKG_MATLAB_ROOT:=${MAKEPKG_MATLAB_PREFIX}/MATLAB}"

_basename="matlab-language-server"
_release="R2021a"
pkgname="${_basename/matlab/matlab-${_release,,}}"
pkgver=1.2.7
pkgrel=1
pkgdesc="Implementation of the Microsoft Language Server Protocol for the MATLAB language (${_release})"
arch=(
  'any'
)
_url="https://github.com/mathworks/MATLAB-language-server"
url="${_url}/tree/v${pkgver}"
license=(
  'MIT'
)
depends=(
  # "matlab-${_release,,}"
  'nodejs'
  'sh'
)
makedepends=(
  'npm'
)
_pkgsrc="${_url##*/}-${pkgver}"
source=(
  "${_url}/archive/refs/tags/v${pkgver}/${_pkgsrc}.tar.gz"
  "${_basename}.sh"
)
sha256sums=('4034c3e83e8a64f707439f66e238e74b1cc88496298fa291c62c052a63722b8a'
            '7008369134d1ed4f938acf7de2f443691522c4484d13c3f60fb9deae861eb120')

_source() {
  export NPM_CONFIG_CACHE="${srcdir}/.npm"
}

prepare() {
  _source

  cd "${srcdir}"
  sed -e "s|@@MATLAB_LANGUAGE_SERVER_ROOT@@|/usr/lib/node_modules/${pkgname}|g" \
      -e "s|@@MATLAB_ROOT@@|${MAKEPKG_MATLAB_ROOT}|g" \
      -e "s|@@MATLAB_RELEASE@@|${_release}|g" \
      -i "${_basename}.sh"

  cd "${_pkgsrc}"
  npm ci
}

build() {
  _source

  cd "${srcdir}/${_pkgsrc}"
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

  cd "${srcdir}"
  install -vDm755 "${_basename}.sh" "${pkgdir}/usr/bin/${_basename}-${_release}"

  cd "${_pkgsrc}"
  npm ci --omit=dev

  sed -i '1i#!/usr/bin/env node' "out/index.js"
  chmod +x "out/index.js"

  install -vd "${pkgdir}/usr/lib/node_modules/${pkgname}"
  cp -a --no-preserve=ownership -t "${pkgdir}/usr/lib/node_modules/${pkgname}" \
    "out" "node_modules" "matlab" # "package.json"

  install -vDm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -vDm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"

  ln -vsf "${_basename}-${_release}" "${pkgdir}/usr/bin/matlab_ls-${_release}"
}
