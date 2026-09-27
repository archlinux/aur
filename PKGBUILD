# Maintainer: Alexandru Zbarcea <alexz@apache.org>

pkgname=prompt-exporter-git
_pkgname=prompt-exporter
pkgver=2.2.0.r28.g65c0da5
pkgrel=1
pkgdesc="CLI to sync AI conversation prompts from multiple sources (ChatGPT, Lumo, …)"
arch=('any')
url="https://github.com/azbarcea/prompt-exporter"
license=('Apache-2.0')
depends=('nodejs' 'chromium')
makedepends=('git' 'npm')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  local _ver
  _ver="$(sed -n 's/.*"version": *"\([^"]*\)".*/\1/p' package.json | head -1)"
  printf "%s.r%s.g%s" "${_ver}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  rm -rf node_modules dist
}

build() {
  cd "${srcdir}/${_pkgname}"
  npm install --cache "${srcdir}/npm-cache"
  npm run build
}

package() {
  cd "${srcdir}/${_pkgname}"

  # Fully bundled CLI — no node_modules at runtime.
  install -Dm755 dist/index.cjs "${pkgdir}/usr/bin/prompt-exporter"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 NOTICE "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  if [[ -d docs ]]; then
    install -dm755 "${pkgdir}/usr/share/doc/${_pkgname}"
    install -Dm644 docs/*.md "${pkgdir}/usr/share/doc/${_pkgname}/"
  fi
}
