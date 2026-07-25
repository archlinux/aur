# Maintainer: myuki <mioki dot cinnamon650 at 8shield dot net>

_pkgname=metacubexd-desktop
pkgname=${_pkgname}-electron
pkgver=1.270.5
pkgrel=1
pkgdesc="MetaCubeXD official desktop client (system-wide Electron and Mihomo)"
arch=('any')
url="https://github.com/MetaCubeX/metacubexd"
license=('MIT')
depends=('electron' 'hicolor-icon-theme' 'mihomo')
makedepends=('pnpm' 'nodejs')
provides=("${_pkgname}")
conflicts=(
  "${_pkgname}"
  "${_pkgname}-git"
  "${_pkgname}-bin"
  "${_pkgname}-electron-bin"
  "${_pkgname}-electron-git"
)
source=(
  "${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
  "${pkgname}.desktop"
)
b2sums=('cc8afad788e5b9ff87859cd06f733bbd51671f33632bb9ad63e7e501f339f96e92b13b77bf46661d3eac4b145c966cf2b6037052677cbef9986e0421ece8e755'
        '32fc7f1255170819e175875d25566a27e4b3655b90ee6fd01c97259e1297e4eea722fd9cfc97bc43837618b1e99ddf46ee160bb1da207766674335497dd5feaa')

prepare() {
  cd "metacubexd-${pkgver}"

  export store_dir="${srcdir}/pnpm-store"
  export ELECTRON_SKIP_BINARY_DOWNLOAD=1
  export PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD=1
  export NUXT_TELEMETRY_DISABLED=1
  export CI=true

  # With system electron, process.resourcesPath points to electron's own
  # resources dir, not ours. Redirect to the directory containing app.asar.
  sed -i 's|process\.resourcesPath|join(app.getAppPath(), "..")|g' \
    apps/desktop/src/main/index.ts

  mkdir -p apps/desktop/resources
  touch apps/desktop/resources/mihomo
  local _node_arch
  case "${CARCH}" in
    x86_64) _node_arch="x64" ;;
    aarch64) _node_arch="arm64" ;;
    *) _node_arch="${CARCH}" ;;
  esac
  echo "linux-${_node_arch}" > apps/desktop/resources/.mihomo-target

  pnpm fetch --store-dir="${store_dir}"
}

build() {
  cd "metacubexd-${pkgver}"

  export store_dir="${srcdir}/pnpm-store"
  export ELECTRON_SKIP_BINARY_DOWNLOAD=1
  export PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD=1
  export NUXT_TELEMETRY_DISABLED=1
  export CI=true

  pnpm install --offline --frozen-lockfile --store-dir="${store_dir}"
  pnpm build
  pnpm --filter @metacubexd/desktop build

  cd apps/desktop
  pnpm exec electron-builder --linux dir \
    -c.electronDist=/usr/lib/electron \
    -c.electronVersion=$(cat /usr/lib/electron/version)
}

package() {
  cd "metacubexd-${pkgver}"

  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE

  local _icons="apps/desktop/build/icons"
  while IFS= read -r -d '' icon; do
    local size="${icon##*/}"
    size="${size%.png}"
    install -Dm644 "${icon}" "${pkgdir}/usr/share/icons/hicolor/${size}/apps/${_pkgname}.png"
  done < <(find "${_icons}" -name '*.png' -print0 2>/dev/null)

  local _res="apps/desktop/dist/linux-unpacked/resources"
  rm -f "${_res}/default_app.asar" "${_res}/mihomo"

  install -d "${pkgdir}/usr/lib/${_pkgname}"
  cp -a "${_res}/." "${pkgdir}/usr/lib/${_pkgname}/"
  ln -s /usr/bin/mihomo "${pkgdir}/usr/lib/${_pkgname}/mihomo"

  install -d "${pkgdir}/usr/bin"
  cat << 'EOF' > "${pkgdir}/usr/bin/${_pkgname}"
#!/bin/sh
exec electron /usr/lib/metacubexd-desktop/app.asar "$@"
EOF
  chmod 755 "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
