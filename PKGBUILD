# Maintainer: guglovich <guglovich164@gmail.com>
# Created with assistance from Claude (Anthropic)

_pkgname=llm-checker
pkgname=llm-checker
pkgver=3.5.3
pkgrel=2
pkgdesc="CLI tool that scans hardware and recommends optimal LLM models for local inference with Ollama integration"
arch=('any')
url="https://github.com/Pavelevich/llm-checker"
license=('LicenseRef-NPDL-1.0')
depends=('nodejs')
makedepends=('npm')
optdepends=('ollama: for running recommended models locally')
options=('!debug')
source=("${_pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${_pkgname}/-/${_pkgname}-${pkgver}.tgz")
b2sums=('0e82ec17a38d55abfa4773b961112f5c4067aa134de287602e7d6e4d4b88bb1cd207ed8485a4f33441146fd4791d0f63e4c8aec8b7734aa30db6dc6b74a2198e')

prepare() {
  bsdtar -xf "${srcdir}/${_pkgname}-${pkgver}.tgz" \
    --strip-components=1 \
    -C "${srcdir}"

  npm install \
    --cache "${srcdir}/npm-cache" \
    --no-fund \
    --no-audit \
    --prefix "${srcdir}"
}

package() {
  local _moduledir="${pkgdir}/usr/lib/node_modules/${_pkgname}"

  install -dm755 "${_moduledir}"
  install -dm755 "${pkgdir}/usr/bin"

  cp -r "${srcdir}/bin"          "${_moduledir}/bin"
  cp -r "${srcdir}/src"          "${_moduledir}/src"
  cp -r "${srcdir}/analyzer"     "${_moduledir}/analyzer"
  cp -r "${srcdir}/node_modules" "${_moduledir}/node_modules"
  install -m644 "${srcdir}/package.json" "${_moduledir}/package.json"

  find "${pkgdir}" -type d -exec chmod 755 {} +
  find "${pkgdir}" -type f -exec chmod 644 {} +
  find "${_moduledir}/bin" -type f -name '*.js' -exec chmod 755 {} +

  ln -sf "/usr/lib/node_modules/${_pkgname}/bin/enhanced_cli.js" \
    "${pkgdir}/usr/bin/llm-checker"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 "${srcdir}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"
  for _doc in README.md CHANGELOG.md ADVANCED_USAGE.md USAGE_GUIDE.md; do
    if [[ -f "${srcdir}/${_doc}" ]]; then
      install -m644 "${srcdir}/${_doc}" \
        "${pkgdir}/usr/share/doc/${pkgname}/${_doc}"
    fi
  done
}