# Maintainer: Alexandru Zbarcea <alexz@apache.org>

pkgname=prompt-exporter
pkgver=2.0.1
pkgrel=1
pkgdesc="CLI to sync AI conversation prompts from multiple sources (ChatGPT first)"
arch=('any')
url="https://github.com/azbarcea/prompt-exporter"
license=('Apache-2.0')
depends=('nodejs' 'chromium')
makedepends=('npm')
conflicts=("${pkgname}-git")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ed396c0dbd095c911603a98f1d793896e7c20a1a0ed2466a5205f1377cddda85')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  rm -rf node_modules dist
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  npm install --cache "${srcdir}/npm-cache"
  npm run build
  npm prune --omit=dev --cache "${srcdir}/npm-cache"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  local _libdir="${pkgdir}/usr/lib/${pkgname}"
  install -dm755 "${_libdir}"

  cp -a dist package.json node_modules "${_libdir}/"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 NOTICE "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  if [[ -d docs ]]; then
    install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"
    install -Dm644 docs/*.md "${pkgdir}/usr/share/doc/${pkgname}/"
  fi

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/usr/lib/${pkgname}/dist/index.js" "${pkgdir}/usr/bin/prompt-exporter"
}
