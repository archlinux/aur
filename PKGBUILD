# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=webcrack
pkgver=2.16.0
pkgrel=2
pkgdesc="Deobfuscate, unminify and unpack bundled javascript"
arch=('x86_64')
url="https://webcrack.netlify.app"
license=('MIT')
depends=('nodejs' 'gcc-libs')
makedepends=('npm')
options=('!debug')
source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
sha256sums=('979f66ce4c10be28f502ab461cd1006027a88ad625f0d4dc68e7f84b38d788ab')

latestver() {
  curl -s "https://registry.npmjs.org/${pkgname}" | python3 -c "import sys,json; print(json.load(sys.stdin)['dist-tags']['latest'])"
}

build() {
  cd "${srcdir}"

  # Override isolated-vm to v6 which ships prebuilt binaries for Node 24+
  # (upstream pins ^5.0.1 which lacks prebuilds and fails to compile)
  cat > package.json << 'EOF'
{
  "overrides": {
    "isolated-vm": "^6.0.0"
  }
}
EOF

  npm install --cache "${srcdir}/npm-cache" \
    --omit=dev \
    "${srcdir}/${pkgname}-${pkgver}.tgz"
}

package() {
  local node_root="${pkgdir}/usr/lib/node_modules/${pkgname}"

  # Copy webcrack package
  install -dm755 "${pkgdir}/usr/lib/node_modules"
  cp -a "${srcdir}/node_modules/${pkgname}" "${node_root}"

  # Copy all dependencies into webcrack's node_modules
  rm -rf "${srcdir}/node_modules/${pkgname}" "${srcdir}/node_modules/.bin" "${srcdir}/node_modules/.package-lock.json"
  cp -a "${srcdir}/node_modules" "${node_root}/node_modules"

  # Bin link
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "../lib/node_modules/${pkgname}/src/cli-wrapper.js" "${pkgdir}/usr/bin/${pkgname}"
  chmod 755 "${node_root}/src/cli-wrapper.js"

  # Remove non-linux native binaries
  find "${node_root}" -type f -name '*.node' \
    \( -name '*darwin*' -o -name '*win32*' -o -name '*win64*' -o -name '*android*' -o -name '*freebsd*' -o -name '*.musl.node' \) \
    -delete

  find "${node_root}" -type d -path '*/prebuilds/linux-arm64' -exec rm -rf {} + 2>/dev/null || true

  # Remove stray man pages from transitive deps
  find "${node_root}/node_modules" -type d -name man -exec rm -rf {} + 2>/dev/null || true

  install -Dm644 "${node_root}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
