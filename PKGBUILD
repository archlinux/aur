# Maintainer: lzsnyy <710080675@qq.com>

# Repack of the official Kimi Work desktop client for the system Electron
# runtime. Upstream ships Windows and macOS only; this package follows the
# proven kimi-bin layout (NSIS -> app-64.7z -> app.asar + daimon bundle) and
# replaces the Windows-only launchers with offline wrappers running through
# electron43's Node mode.

pkgname=kimi-work-bin
pkgver=3.2.26
pkgrel=2
pkgdesc='Kimi Work desktop client, repackaged for the system Electron runtime'
arch=('x86_64')
url='https://www.kimi.com/products/kimi-work'
license=('LicenseRef-proprietary')
depends=(
  'electron43'
  'git'
  'python'
  'uv'
)
makedepends=('7zip' 'asar')
conflicts=('kimi-bin')
options=('!strip')
source=(
  'LICENSE'
  'kimi-work.sh'
  'kimi-work.desktop'
  'daimon.sh'
  'node.sh'
)
source_x86_64=("kimi_${pkgver}.exe::https://kimi-img.moonshot.cn/app/download/windows/kimi_${pkgver}.exe")
noextract=("kimi_${pkgver}.exe")
sha256sums=(
  'ab973d8d007cfed09bf051378baf4fd220f545a5533ab5e9269aad8674e7f468'
  '5a2c99f51625b057dd0d3c561d67efce62b75d1bfd158def4d91ad83dd1b24a8'
  'c47de36fda4c29968fac150b2d54fc91bede6233e1723f5a5762e17e9d0858a0'
  '85e9c4268a8ee267755f0f3faa4b7cd957db27d57d0c22d53cb2c691d34f0ec2'
  '817e0d47bca30dfb87aa2e9df40fb94ba1d3704305d2b6b0f2b4359e4ab7e304'
)
sha256sums_x86_64=('cdaf24b59918379cd7e3f539f0434fbafbf92b0497968a0baf2a22dcb7f03e39')

prepare() {
  local _res="${srcdir}/payload/resources/resources"
  local _daimon="${_res}/daimon-bundle"

  rm -rf "${srcdir}/nsis" "${srcdir}/payload" "${srcdir}/app" \
    "${srcdir}/kimi.asar"
  mkdir -p "${srcdir}/nsis" "${srcdir}/payload"

  7z x -y "${srcdir}/kimi_${pkgver}.exe" -o"${srcdir}/nsis"
  7z x -y "${srcdir}/nsis/\$PLUGINSDIR/app-64.7z" -o"${srcdir}/payload"
  asar extract "${srcdir}/payload/resources/app.asar" "${srcdir}/app"
  install -dm755 "${_daimon}"
  tar -xzf "${_res}/daimon-bundle.tar.gz" -C "${_daimon}"

  # Windows executables and the bundled win32 toolchain cannot run here; the
  # package depends on the system git/python/uv instead.
  find "${srcdir}/app" "${_daimon}" -type f -iname '*.exe' -delete
  find "${_res}" -maxdepth 1 -type f -iname '*.exe' -delete
  # The extracted bundle is used directly; the tarball is only consulted on
  # win32, so it is dead weight here.
  rm -f "${_res}/daimon-bundle.tar.gz" "${_res}/daimon-bundle.tar.gz.stamp"
  find "${_res}/runtime" -maxdepth 1 -type f -iname '*.cmd' -delete
  find "${_daimon}/runtime" -type f \( \
    -iname '*.dll' -o \
    -iname '*.cmd' -o \
    -iname '*.ps1' -o \
    -iname '*.bat' \
  \) -delete
  find "${_daimon}/runtime" -type d -empty -delete

  # TypeScript sources are not runtime code.
  find "${srcdir}/app" "${_daimon}" -type f \( \
    -iname '*.ts' -o \
    -iname '*.mts' -o \
    -iname '*.cts' -o \
    -iname '*.tsx' \
  \) -delete

  # daimon's bundled package.json lists build-time devDependencies.
  sed -i \
    '/^  "devDependencies": {$/,/^  },$/d' \
    "${_daimon}/app/daimon/package.json"

  # Offline replacements for the Windows-only launchers: the upstream
  # kimi-daimon wrapper would download Node v24.15.0 at runtime, and the
  # payload has no bin/daimon on Linux.
  install -Dm755 "${srcdir}/daimon.sh" "${_daimon}/bin/daimon"
  install -Dm755 "${srcdir}/node.sh" "${_daimon}/runtime/node"

  asar pack "${srcdir}/app" "${srcdir}/kimi.asar"
}

package() {
  install -Dm644 "${srcdir}/kimi.asar" \
    "${pkgdir}/usr/lib/kimi/app.asar"

  # The packaged app resolves everything through process.resourcesPath +
  # "/resources"; when run under the system Electron that path is
  # /usr/lib/electron43/resources, so the upstream resources tree has to live
  # there. The 64-bit electron43 package owns only its own files; these paths
  # are new and survive package upgrades.
  install -dm755 "${pkgdir}/usr/lib/electron43/resources/resources"
  cp -a "${srcdir}/payload/resources/resources/." \
    "${pkgdir}/usr/lib/electron43/resources/resources/"
  find "${pkgdir}/usr/lib/electron43/resources/resources" \
    -type d -exec chmod 755 '{}' +

  install -Dm755 "${srcdir}/kimi-work.sh" \
    "${pkgdir}/usr/bin/kimi-work"
  install -Dm644 "${srcdir}/kimi-work.desktop" \
    "${pkgdir}/usr/share/applications/kimi-work.desktop"
  # Upstream 3.2.26 only ships tray-sized PNGs; install the 64px one as-is so
  # hicolor finds a real asset instead of an upscaled placeholder.
  install -Dm644 "${srcdir}/app/assets/tray-icon@2x.png" \
    "${pkgdir}/usr/share/icons/hicolor/64x64/apps/kimi-work.png"
  install -Dm644 "${srcdir}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
