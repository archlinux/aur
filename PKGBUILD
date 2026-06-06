# Maintainer: James <jfoh96@gmail.com>
# Upstream: https://github.com/xiangechen/chili3d

pkgname=chili3d
pkgver=0.6.1
pkgrel=2
pkgdesc='Browser-based 3D CAD application (OpenCascade WASM + Three.js)'
arch=('any')
url='https://chili3d.com'
license=('AGPL-3.0-or-later')
depends=(
  'python'
  'xdg-utils'
)
makedepends=(
  'nodejs'
  'npm'
)
source=(
  "https://github.com/xiangechen/chili3d/archive/refs/tags/${pkgver}.tar.gz"
  'chili3d.in'
  'chili3d.desktop'
)
sha256sums=(
  '6844f4b917dd64e12a0918bbab37e6f9f3174d308589b3c3f4fa2e50b85f0488'
  '8c806cf555f90e13f384414f9d8fd0c1c9ca68d39b8ffb3374ba44fc3ae659c7'
  '5fbaf0a8f85a34770ccb73ffc4caa10df7766ce94f087ee16958b373a9797489'
)
options=('!debug' '!strip')

build() {
  cd "chili3d-${pkgver}"

  export CI=1
  export npm_config_cache="${srcdir}/.npm"
  export npm_config_update_notifier=false
  export npm_config_fund=false
  export npm_config_audit=false

  npm install
  npm run build
}

package() {
  cd "chili3d-${pkgver}"

  install -dm755 "${pkgdir}/usr/share/chili3d"
  cp -a dist/. "${pkgdir}/usr/share/chili3d/"

  # Rspack/emscripten embed absolute file:// paths from the build tree.
  find "${pkgdir}/usr/share/chili3d" -name '*.js' -exec sed -i \
    -e "s#file://${srcdir}/chili3d-${pkgver}/packages/chili-wasm/lib/#.#g" \
    -e "s#${srcdir}/chili3d-${pkgver}/##g" \
    {} +

  install -Dm755 "${srcdir}/chili3d.in" "${pkgdir}/usr/bin/chili3d"
  install -Dm644 "${srcdir}/chili3d.desktop" "${pkgdir}/usr/share/applications/chili3d.desktop"
  install -Dm644 public/favicon.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/chili3d.svg"
}
