# Maintainer: teraflops <cprieto.ortiz@gmail.com>
pkgname=nodejs-mpris-service
pkgver=2.1.2
pkgrel=1
pkgdesc="Node.js implementation for the MPRIS D-Bus Interface (library)"
arch=('any')
url='https://github.com/dbusjs/mpris-service'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/mpris-service/-/mpris-service-${pkgver}.tgz")
sha256sums=('SKIP')

prepare() {
  rm -rf "${srcdir}/package" "${srcdir}/npm-cache"
  mkdir -p "${srcdir}/package" "${srcdir}/npm-cache"
  tar -xzf "${srcdir}/mpris-service-${pkgver}.tgz" -C "${srcdir}/package" --strip-components=1

  cd "${srcdir}/package"
  npm install \
    --omit=dev \
    --ignore-scripts \
    --no-audit \
    --no-fund \
    --cache "${srcdir}/npm-cache"
}

package() {
  local moddir="${pkgdir}/usr/lib/node_modules/mpris-service"
  install -dm755 "${moddir}"
  cp -a "${srcdir}/package/"* "${moddir}/"

  install -Dm644 "${srcdir}/package/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 /dev/stdin "${pkgdir}/usr/share/doc/${pkgname}/README.arch" <<'EOF'
This package installs the mpris-service Node.js library under:
/usr/lib/node_modules/mpris-service

To use it in your app, set NODE_PATH or use bundlers/resolvers that look into
/usr/lib/node_modules, or vendor it in your project.
EOF
}

