# Maintainer: duanluan <duanluan@outlook.com>

pkgname=apifox
pkgver=2.8.46
pkgrel=1
pkgdesc='API documentation, debugging, mocking, and automated testing tool'
arch=('x86_64')
url='https://apifox.com/'
license=('LicenseRef-Proprietary')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'cairo'
  'dbus'
  'expat'
  'gcc-libs'
  'glib2'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libcups'
  'libnotify'
  'libsecret'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxkbcommon'
  'libxrandr'
  'libxss'
  'libxtst'
  'mesa'
  'nspr'
  'nss'
  'pango'
  'systemd-libs'
  'util-linux-libs'
  'xdg-utils'
)
optdepends=(
  'java-runtime: run the bundled Java database executors'
  'libappindicator-gtk3: system tray icon support'
)
conflicts=('api-fox-bin' 'apifox-bin' 'apifox-appimage')
options=('!strip' '!lto')
_source_archive="Apifox-linux-manual-${pkgver}.tar.gz"
source=(
  "${_source_archive}::https://file-assets-cdn.oss-cn-hangzhou.aliyuncs.com/download/Apifox-linux-manual-latest.tar.gz"
  'apifox.desktop'
)
sha256sums=(
  '2bb6b678596aa61a67fd6e05e6f8426f41e36aa0df16ff5bd3c0329523056c79'
  '86dbe67fed5b4159d14ed5c3cdf1415714f8a48033ad9f8f0debfae704de35ca'
)

package() {
  local upstream_dir="${srcdir}/apifox-${pkgver}"
  local install_root="${pkgdir}/opt/Apifox"

  for required_path in \
    "${upstream_dir}/apifox" \
    "${upstream_dir}/chrome-sandbox" \
    "${upstream_dir}/resources/app.asar" \
    "${upstream_dir}/resources/app.asar.unpacked/package.json" \
    "${upstream_dir}/resources/app.asar.unpacked/dist/assets/logo.png" \
    "${upstream_dir}/LICENSE.electron.txt" \
    "${upstream_dir}/LICENSES.chromium.html"; do
    [[ -e "${required_path}" ]] || {
      printf 'missing required upstream path: %s\n' "${required_path}" >&2
      return 1
    }
  done

  install -dm755 "${install_root}"
  cp -a "${upstream_dir}/." "${install_root}/"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/Apifox/apifox" "${pkgdir}/usr/bin/apifox"

  # Electron's sandbox helper must retain its setuid bit for sandboxed renderers.
  chmod 4755 "${install_root}/chrome-sandbox"

  install -Dm644 "${srcdir}/apifox.desktop" \
    "${pkgdir}/usr/share/applications/apifox.desktop"
  install -Dm644 \
    "${upstream_dir}/resources/app.asar.unpacked/dist/assets/logo.png" \
    "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/apifox.png"

  install -Dm644 "${upstream_dir}/LICENSE.electron.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
  install -Dm644 "${upstream_dir}/LICENSES.chromium.html" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
}
