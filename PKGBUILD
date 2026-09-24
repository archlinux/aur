# Maintainer: Alexandru Zbarcea <alexz@apache.org>

pkgname=prompt-exporter-git
_pkgname=prompt-exporter
pkgver=2.0.1.r15.ge6b01fb
pkgrel=1
pkgdesc="CLI to sync AI conversation prompts from multiple sources (ChatGPT first)"
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
  npm prune --omit=dev --cache "${srcdir}/npm-cache"
}

package() {
  cd "${srcdir}/${_pkgname}"

  local _libdir="${pkgdir}/usr/lib/${_pkgname}"
  install -dm755 "${_libdir}"

  cp -a dist package.json node_modules "${_libdir}/"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 NOTICE "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  if [[ -d docs ]]; then
    install -dm755 "${pkgdir}/usr/share/doc/${_pkgname}"
    install -Dm644 docs/*.md "${pkgdir}/usr/share/doc/${_pkgname}/"
  fi

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/usr/lib/${_pkgname}/dist/index.js" "${pkgdir}/usr/bin/prompt-exporter"
}
