# Maintainer: Mindsaver <Mindsaver@users.noreply.github.com>
pkgname=linux-sensor-tray
pkgver=0.2.0
pkgrel=1
pkgdesc="Tray-first Electron app for live CPU/GPU/mainboard/storage stats on Linux"
arch=('x86_64')
url="https://github.com/Mindsaver/linux-sensor-tray"
license=('MIT')
depends=('electron41' 'hicolor-icon-theme')
makedepends=('npm' 'nodejs>=20' 'asar' 'git')
optdepends=(
  'lshw: richer System info enrichment'
  'polkit: pkexec-based root helpers'
  'zenpower3-dkms: extra AMD CPU sensors (Vcore, V SoC, per-CCD temps)'
)
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
  "${pkgname}.sh"
  "${pkgname}.desktop"
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Use the system Electron at runtime; don't waste bandwidth fetching one for node_modules.
  export ELECTRON_SKIP_BINARY_DOWNLOAD=1
  export npm_config_cache="${srcdir}/.npm-cache"

  # CI bumps the JSON to match the tag; do the same so app.getVersion() == pkgver.
  RELEASE_VERSION="v${pkgver}" node scripts/set-root-version.mjs

  npm ci --no-audit --no-fund
  npm run build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Stage the runtime tree (out/ + production node_modules + package.json + icon).
  local stage="${srcdir}/stage"
  rm -rf "$stage"
  install -dm755 "$stage"
  cp -a out package.json "$stage/"
  install -Dm644 build/icon.png "$stage/icon.png"

  # Production-only deps (no electron, no devDeps), ASAR-friendly.
  ( cd "$stage" \
    && export ELECTRON_SKIP_BINARY_DOWNLOAD=1 \
    && export npm_config_cache="${srcdir}/.npm-cache" \
    && npm install --omit=dev --omit=optional --no-audit --no-fund --ignore-scripts )

  install -dm755 "${pkgdir}/usr/lib/${pkgname}"
  asar pack "$stage" "${pkgdir}/usr/lib/${pkgname}/app.asar"

  install -Dm755 "${srcdir}/${pkgname}.sh" \
    "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 build/icon.png \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"
  install -Dm644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
