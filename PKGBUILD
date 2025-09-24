# Maintainer: Bipp <me@bipp.dev>
pkgname=llxprt-code
_pkgrealname=llxprt
pkgver=0.3.4
pkgrel=1
pkgdesc="A fork of Gemini CLI enhanced with additional features and support for multiple providers."
arch=('x86_64')
url="https://github.com/acoliver/llxprt-code"
license=('Apache-2.0')
depends=('nodejs')
makedepends=('npm')
provides=("${_pkgrealname}")
conflicts=("${_pkgrealname}")
options=('!debug') # Do not create a debug package.
source=("$pkgname-v$pkgver.tar.gz::https://github.com/acoliver/llxprt-code/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e043d85c60ffa7ff35f08b1de67fbce528c7842dbbe616607944e9598b5df01e')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  npm install
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  npm run build
}

package() {
  local SOURCEDIR="${srcdir}/${pkgname}-${pkgver}"

  install -d "${pkgdir}/usr/lib/${pkgname}"
  install -d "${pkgdir}/usr/lib/${pkgname}/node_modules"

  # Install the main script from the build's output directory.
  install -Dm755 "${SOURCEDIR}/bundle/llxprt.js" "${pkgdir}/usr/lib/${pkgname}/llxprt.js"

  # Install the required WebAssembly tokenizer.
  install -Dm644 "${SOURCEDIR}/node_modules/@dqbd/tiktoken/tiktoken_bg.wasm" "${pkgdir}/usr/lib/${pkgname}/tiktoken_bg.wasm"

  # Install the provider prompt configurations.
  cp -rT "${SOURCEDIR}/packages/core/src/prompt-config/defaults" "${pkgdir}/usr/lib/${pkgname}/"
  
  # Copy the required native node modules.
  cp -r "${SOURCEDIR}/node_modules/@lydell" "${pkgdir}/usr/lib/${pkgname}/node_modules/"

  # Create the final symlink in /usr/bin for the user to run.
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/lib/${pkgname}/llxprt.js" "${pkgdir}/usr/bin/${_pkgrealname}"
}
