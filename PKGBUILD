# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=grok-desktop
pkgver=1.4.8
pkgrel=1
pkgdesc="Desktop GUI for the Grok Build coding agent"
arch=('x86_64')
url="https://github.com/liaan/grok-desktop"
license=('MIT')
depends=(
  'alsa-lib'
  'grok'
  'gtk3'
  'nss'
  'xdg-utils'
)
optdepends=('bubblewrap: sandboxed agent terminals')
# Upstream builds with Node 22. The official linux-x64 tarball is the toolchain
# so this does not replace the system nodejs package.
_nodever=22.23.4
makedepends=('python')
options=('!strip' '!debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/liaan/grok-desktop/archive/refs/tags/v${pkgver}.tar.gz"
        "https://nodejs.org/dist/v${_nodever}/node-v${_nodever}-linux-x64.tar.xz"
        "disable-updater.patch"
        "grok-desktop.sh"
        "grok-desktop.desktop")
sha512sums=('5f98eeb36568b293d7df0ec082312f8cd17c254cbcc6641858e8cfaec696e75cf7fe6d80189db8e206c75c0d01c1475a5a51dfc82c5bb98168844b37c5112691'
            'fb72434120aec53aae61ac328bdf711bde4341208dd735a6e4d4004452e0f232ecac19b10d1c5e978c85d615b5ddd96e67f01134d9d39c89b46488415265ce48'
            '19f83375b3d55b8ae9b057c27b09df4c0b151f96334e60d2c86be32511adb6dada88646684beea2dbb96eb9350155b5a6e7fc748c486a5cf8b4cab9c18d1fdb2'
            '7825e307d63d951d9e8c58f1e4cd0caa06f0673f1f75727c6439259dbac419296213ad727d3ab290ccaadeb187fbe67633f46c668d9df15664ac3e92ed54a5ee'
            'e22a2649db3b0e6f594180469b42f4c1de94a4910dc3438c9dbbb41156dc326f9476af2769308f974f4a0c7acfc1a9d7490cc905e12c933883be8d84843194bb')

prepare() {
  cd "$pkgname-$pkgver"
  patch -Np1 -i "$srcdir/disable-updater.patch"
}

build() {
  local _node="${srcdir}/node-v${_nodever}-linux-x64"
  export PATH="${_node}/bin:${PATH}"
  export npm_config_cache="${srcdir}/npm-cache"
  export ELECTRON_CACHE="${srcdir}/electron-cache"
  export ELECTRON_BUILDER_CACHE="${srcdir}/electron-builder-cache"
  export HOME="${srcdir}/home"
  export CSC_IDENTITY_AUTO_DISCOVERY=false
  mkdir -p "$npm_config_cache" "$ELECTRON_CACHE" "$ELECTRON_BUILDER_CACHE" "$HOME"

  cd "$pkgname-$pkgver"
  # dir only: AppImage auto-update is disabled in the launcher.
  python - << 'PY'
import json
with open("package.json") as f:
    data = json.load(f)
linux = data["build"].setdefault("linux", {})
linux["target"] = [{"target": "dir", "arch": ["x64"]}]
linux["executableName"] = "grok-desktop"
with open("package.json", "w") as f:
    json.dump(data, f, indent=2)
    f.write("\n")
PY

  local attempt max=3 status
  for attempt in 1 2 3; do
    echo "=== npm ci attempt ${attempt}/${max} ==="
    if npm ci --no-audit --no-fund; then
      status=0
      break
    fi
    status=$?
    rm -rf node_modules
    sleep $((attempt * 5))
  done
  [ "$status" -eq 0 ]

  npm run build
  ./node_modules/.bin/electron-builder --linux dir --x64 --publish never
}

package() {
  local _unpacked="${srcdir}/$pkgname-$pkgver/release/linux-unpacked"
  install -d "${pkgdir}/usr/lib/${pkgname}"
  cp -a "${_unpacked}/." "${pkgdir}/usr/lib/${pkgname}/"
  chmod 4755 "${pkgdir}/usr/lib/${pkgname}/chrome-sandbox"
  # In-app updater installs GitHub AppImages. Pacman owns this tree.
  rm -f "${pkgdir}/usr/lib/${pkgname}/resources/app-update.yml"

  install -Dm755 "${srcdir}/grok-desktop.sh" "${pkgdir}/usr/bin/grok-desktop"
  install -Dm644 "${srcdir}/grok-desktop.desktop" "${pkgdir}/usr/share/applications/grok-desktop.desktop"
  install -Dm644 "${srcdir}/$pkgname-$pkgver/build/icon.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/grok-desktop.svg"
  install -Dm644 "${srcdir}/$pkgname-$pkgver/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
