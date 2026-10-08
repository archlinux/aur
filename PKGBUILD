pkgname=aicoworker-bin
pkgver=2026.8.3
pkgrel=1
pkgdesc='Graphical AI assistant powered by OpenClaw (official binary)'
arch=('x86_64')
url='https://github.com/Neurons-AI/aicoworker'
license=('LicenseRef-PolyForm-Perimeter-1.0.0' 'MIT' 'BSD-3-Clause')
depends=(
  'alsa-lib' 'at-spi2-core' 'bubblewrap' 'cairo' 'dbus' 'expat'
  'glib2' 'glibc' 'gtk3' 'libcups' 'libgcc' 'libgomp' 'libnotify'
  'libstdc++' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext'
  'libxfixes' 'libxkbcommon' 'libxrandr' 'libxss' 'libxtst' 'mesa'
  'nspr' 'nss' 'pango' 'socat' 'systemd-libs' 'util-linux-libs'
  'vulkan-icd-loader' 'xdg-utils'
)
optdepends=('libappindicator: tray integration on desktops using AppIndicator')
makedepends=('patchelf')
provides=("aicoworker=$pkgver")
conflicts=('aicoworker')
# Preserve upstream prebuilt runtimes, native modules, and their debug data.
options=('!strip' '!debug')
source=("https://github.com/Neurons-AI/aicoworker/releases/download/v${pkgver}/AICoworker-${pkgver}-linux-amd64.deb")
noextract=("AICoworker-${pkgver}-linux-amd64.deb")
sha256sums=('ac28a6a7ab729f6bab7563f59bd8f2f8b0645cdc878805cf3b4aadfe5c462b84')

prepare() {
  bsdtar -xf "AICoworker-${pkgver}-linux-amd64.deb" data.tar.xz
}

package() {
  bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir"

  # Keep sibling-library lookup without searching the current working directory.
  local runtime library
  for runtime in \
    "$pkgdir/opt/AICoworker/resources/app.asar.unpacked/node_modules/node-llama-cpp/llama/localBuilds" \
    "$pkgdir/opt/AICoworker/resources/openclaw/node_modules/node-llama-cpp/llama/localBuilds"; do
    for library in "$runtime"/linux-x64*/Release/*.so; do
      if [[ $(patchelf --print-rpath "$library") == "\$ORIGIN:" ]]; then
        patchelf --set-rpath "\$ORIGIN" "$library"
      fi
    done
  done

  install -d "$pkgdir/usr/bin"
  ln -s /opt/AICoworker/aicoworker "$pkgdir/usr/bin/aicoworker"

  # Repair the upstream desktop file's unescaped multiline Comment value.
  sed -i '/^Comment=/c\Comment=AI Assistant powered by OpenClaw' \
    "$pkgdir/usr/share/applications/aicoworker.desktop"
  sed -i '/^OpenClaw Gateway to provide intelligent automation and assistance$/d; /^across multiple messaging platforms\.$/d' \
    "$pkgdir/usr/share/applications/aicoworker.desktop"

  # Chromium's setuid sandbox fallback requires a root-owned mode-4755 helper.
  chmod 4755 "$pkgdir/opt/AICoworker/chrome-sandbox"

  install -Dm644 "$pkgdir/opt/AICoworker/resources/app-source/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -m644 "$pkgdir/opt/AICoworker/LICENSE.electron.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.electron.txt"
  install -m644 "$pkgdir/opt/AICoworker/LICENSES.chromium.html" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSES.chromium.html"
}
