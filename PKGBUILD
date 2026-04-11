# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=chrome-devtools-axi
pkgver=0.1.14
pkgrel=2
pkgdesc="AXI-compliant chrome-devtools-mcp wrapper with contextual suggestions"
arch=('any')
url="https://github.com/kunchenguid/chrome-devtools-axi"
license=('MIT')
depends=('nodejs' 'chrome-devtools-mcp')
makedepends=('npm')
options=('!debug')
source=(
  "${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz"
  "${pkgname}-runtime.patch"
)
sha512sums=('f1c2d3948836f64f2cdbc1e5cbb78f7c3fbc6a58c70af5c9eff981b5e97a373d3d38a26befc46240346acbc833cd6380d89b06f21de5bb0c1edfecd6cb743a00'
            'ec4f86f355168c32ed153eaa50f90ffecc8b9249579b1bab1dfecee48651806e7fa43a7a2214ebbf1904a3823bc596bb87779e18bc8b89c258f0a1de1b006b43')

latestver() {
  curl -fsSL "https://registry.npmjs.org/${pkgname}/latest" | jq -r '.version'
}

prepare() {
  cd "${srcdir}/package"

  patch -Np1 -i "${srcdir}/${pkgname}-runtime.patch"
}

build() {
  cd "${srcdir}/package"
  npm install --cache "${srcdir}/npm-cache" --omit=dev --ignore-scripts
}

package() {
  local node_root="${pkgdir}/usr/lib/node_modules/${pkgname}"

  install -dm755 "${pkgdir}/usr/lib/node_modules"
  cp -a "${srcdir}/package" "${node_root}"
  chmod 755 "${node_root}/dist/bin/chrome-devtools-axi.js"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "../lib/node_modules/${pkgname}/dist/bin/chrome-devtools-axi.js" "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 "${node_root}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
