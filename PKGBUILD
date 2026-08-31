# Maintainer: Mindsaver <Mindsaver@users.noreply.github.com>
pkgname=linux-sensor-tray
pkgver=0.4.0
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
install="${pkgname}.install"
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
  "${pkgname}.sh"
  "${pkgname}.desktop"
)
# CI regenerates hashes via updpkgsums for the actual tag at deploy time;
# local makepkg should run `updpkgsums` first if you change pkgver.
sha256sums=('723045175ef1ca5e8d211fd92141f7652aebe2149f6be589f83bdface2bd7d68'
            '90267ebd6e338215d5358159ade24aaf9403008d19db1c81553bc5e8d94421d3'
            '4af4bed1cb787c29e0f5345330f7ba83bbcb97ea5d42dde20f3e77b56522697a')

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
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/scripts/linux-sensor-tray-setup" \
    "${pkgdir}/usr/bin/${pkgname}-setup"
  install -Dm644 "${srcdir}/${pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 build/icon.png \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"
  install -Dm644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
