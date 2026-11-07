# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=gh-axi
pkgver=0.1.50
pkgrel=1
pkgdesc="AXI-compliant GitHub CLI wrapper with token-efficient output and suggestions"
arch=('any')
url="https://github.com/kunchenguid/gh-axi"
license=('MIT')
depends=('nodejs' 'github-cli')
makedepends=('npm')
options=('!debug')
source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
sha512sums=('ed667a473e865ed2a75764574a40caa82be91af04854d4d532f103dbd358a709a3988526df3baaab95ccfb015a1fa474f0a4de299d33da78a331e8082c853989')

latestver() {
  curl -fsSL "https://registry.npmjs.org/${pkgname}/latest" | jq -r '.version'
}

build() {
  cd "${srcdir}/package"
  npm install --cache "${srcdir}/npm-cache" --omit=dev --ignore-scripts
}

package() {
  local node_root="${pkgdir}/usr/lib/node_modules/${pkgname}"

  install -dm755 "${pkgdir}/usr/lib/node_modules"
  cp -a "${srcdir}/package" "${node_root}"
  chmod 755 "${node_root}/dist/bin/gh-axi.js"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "../lib/node_modules/${pkgname}/dist/bin/gh-axi.js" "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 "${node_root}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
