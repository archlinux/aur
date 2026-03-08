# Maintainer: guglovich <your@email.com>
# Created with assistance from Claude (Anthropic)

_pkgname=llm-checker
pkgname=llm-checker
pkgver=3.5.4
pkgrel=1
pkgdesc="CLI tool that scans hardware and recommends optimal LLM models for local inference with Ollama integration"
arch=('any')
url="https://github.com/Pavelevich/llm-checker"
license=('LicenseRef-NPDL-1.0')
depends=('nodejs')
makedepends=('npm')
optdepends=('ollama: for running recommended models locally')
options=('!debug')
source=("${_pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${_pkgname}/-/${_pkgname}-${pkgver}.tgz")
b2sums=('f56e187ccdb32ac5c1cff7247ddb841ef9cd0362482a70a527eca161ae74938752abf2884e057896cd534def5b9bc4f1a1c747374b478f2eb9449e0f9b2ce440')

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
