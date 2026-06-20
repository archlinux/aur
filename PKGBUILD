# Maintainer: guglovich <guglovich164@gmail.com>
# Created with assistance from Qwen 3.6 (Alibaba).

_pkgname=llm-checker
pkgname=llm-checker
pkgver=3.7.0
pkgrel=1
pkgdesc="CLI tool that scans hardware and recommends optimal LLM models for local inference with Ollama integration"
arch=('any')
url="https://github.com/Pavelevich/llm-checker"
license=('LicenseRef-NPDL-1.0')
depends=('nodejs')
makedepends=('npm' 'git')
optdepends=('ollama: for running recommended models locally')
options=('!debug')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

prepare() {
  bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.tar.gz" \
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
