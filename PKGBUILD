# Maintainer: k8rit0 <angelalvarezferrero@gmail.com>
# Forked from: https://aur.archlinux.org/packages/vortex-linux by Tymon3310
pkgname=vortex-linux-fix
pkgver=2.0.1
pkgrel=13
epoch=1
pkgdesc="Nexus Mods' mod manager - unofficial fix fork of Tymon3310's vortex-linux with native Linux compatibility patches"
arch=('x86_64')
url="https://github.com/Nexus-Mods/Vortex"
license=('GPL-3.0-or-later')

depends=('gtk3' 'nss' 'libxss' 'libsecret' 'dotnet-runtime-9.0' 'python')
optdepends=('libappindicator: system tray icon support'
            'libnotify: desktop notifications')
makedepends=('git' 'pnpm' 'npm' 'python-setuptools')

provides=('vortex')
conflicts=('vortex' 'vortex-git' 'vortex-linux')
install=vortex.install

source=("git+https://github.com/Nexus-Mods/Vortex.git#tag=v${pkgver}"
  "vortex.desktop"
  "vortex.sh"
  "patch-pkg.js"
  "patch-asar.py"
  "patch-ext-cp2077.py"
  "patch-ext-gamebryo.py"
  "patch-ext-bepinex.py"
  "gamebryo-pm-index.js"
  "gamebryo-pm-info.json"
  "https://github.com/BepInEx/BepInEx/releases/download/v5.4.23.2/BepInEx_linux_x64_5.4.23.2.zip")

sha256sums=('ea217e24864525a323a848e0b3ff15a4f04dfeccaacf1ef885afe57d0ce61f65'
  '7e66931a83d05fb7ca0d086b27ab3fc3b926df02caf71826ee4ee4e8654ea4e5'
  '19420a1af334187b2ba68f0fab3b5170bff5b6096f9e2a30000e712013fd378b'
  'd261f1ef78bb21d72cedeedfd935b099e3d707be709404e894d4aeb47254f1ef'
  'be631151db42a4b9860a80d828697e28d08b7d9571419b61186d550fec494c14'
  '014b52e419cd627044d6e7ceed3735243ce001ad8c611672e4f972be91a216cc'
  '32004e0074ea72ee005f5730961ed7e5923645d1bbec9db3f0ba9976633a29cb'
  '02dfb85811f023ed0b63d0b909a806cd23cdabc81e19965722bc8de1f4d48a9d'
  'df91e09151bff8c55a5a29f79659c7560f275cca370d644603aec3e2e48b2757'
  'd5333c97079ccf7108c3906bdd929fea408792b7729a3b730f25d7c325bac67f'
  'ddc446143a0a277ed92eb7a1f5bf794ff4fdd0023bddc0491f85eafd1898225b')

options=('!strip' '!debug')

prepare() {
  cd "$srcdir/Vortex"

  msg2 "Injecting compiler and TypeScript overrides..."
  node "$srcdir/patch-pkg.js"

  msg2 "Enabling gamebryo archive extensions for Linux build..."
  python3 - <<'EOF'
import json, pathlib
for ext in ['gamebryo-ba2-support', 'gamebryo-bsa-support']:
    p = pathlib.Path(f'extensions/{ext}/package.json')
    pkg = json.loads(p.read_text())
    for s in ['build', 'dist']:
        old = pkg['scripts'][s]
        if '|| ' in old:
            pkg['scripts'][s] = old.split('|| ', 1)[1].strip('()')
    p.write_text(json.dumps(pkg, indent=2) + '\n')
EOF

  if [ -f "pnpm-workspace.yaml" ]; then
    sed -i 's/engineStrict: true/engineStrict: false/g' pnpm-workspace.yaml
  fi

  export npm_config_runtime="electron"
  export npm_config_target="39.8.0"
  export npm_config_disturl="https://electronjs.org/headers"

  pnpm install --no-frozen-lockfile
}

build() {
  cd "$srcdir/Vortex"

  export VORTEX_VERSION="$pkgver"

  export npm_config_runtime="electron"
  export npm_config_target="39.8.0"
  export npm_config_disturl="https://electronjs.org/headers"

  export VORTEX_SKIP_SUBMODULES="1"
  export npm_config_yes=true
  export CI=1

  msg2 "Building project via pnpm..."
  pnpm run dist:all

  msg2 "Packaging Electron application..."
  cd src/main
  node ./prepare-dist-package.mjs

  echo "packages:" >>dist/pnpm-workspace.yaml
  echo "  - '.'" >>dist/pnpm-workspace.yaml

  node "$srcdir/patch-pkg.js" dist/package.json

  pnpm install --dir=./dist --no-frozen-lockfile

  msg2 "Cleaning up conflicting Windows-only native modules..."
  rm -rf dist/node_modules/winapi-bindings 2>/dev/null || true
  rm -rf dist/node_modules/windows-shortcuts-rs 2>/dev/null || true

  rm -rf "$srcdir/Vortex/dist/linux-unpacked" 2>/dev/null || true

  pnpm exec electron-builder --config ./electron-builder.config.json \
    --publish never \
    --linux dir \
    --x64 \
    -c.compression=store
}

package() {
  cd "$srcdir/Vortex/dist/linux-unpacked"

  install -dm755 "$pkgdir/opt/Vortex"
  cp -a . "$pkgdir/opt/Vortex/"

  install -dm755 "$pkgdir/opt/Vortex/resources/app.asar.unpacked/assets"
  install -Dm755 "$srcdir/Vortex/assets/dotnetprobe" \
    "$pkgdir/opt/Vortex/resources/app.asar.unpacked/assets/dotnetprobe" 2>/dev/null || true

  chmod 4755 "$pkgdir/opt/Vortex/chrome-sandbox" 2>/dev/null || true

  msg2 "Installing gamebryo-plugin-management Linux stub..."
  local _bp="$pkgdir/opt/Vortex/resources/app.asar.unpacked/bundledPlugins"
  install -dm755 "$_bp/gamebryo-plugin-management"
  install -Dm644 "$srcdir/gamebryo-pm-index.js" "$_bp/gamebryo-plugin-management/index.js"
  install -Dm644 "$srcdir/gamebryo-pm-info.json" "$_bp/gamebryo-plugin-management/info.json"

  msg2 "Patching bundled plugins — Linux compatibility..."
  export _VORTEX_BP="$_bp"
  export _VORTEX_ASAR="$pkgdir/opt/Vortex/resources/app.asar"

  python3 "$srcdir/patch-asar.py"

  install -Dm644 "$srcdir/patch-ext-cp2077.py" "$pkgdir/opt/Vortex/patch-ext-cp2077.py"
  install -Dm644 "$srcdir/patch-ext-gamebryo.py" "$pkgdir/opt/Vortex/patch-ext-gamebryo.py"
  install -Dm644 "$srcdir/patch-ext-bepinex.py" "$pkgdir/opt/Vortex/patch-ext-bepinex.py"

  msg2 "Bundling libdoorstop.so for BepInEx Linux support..."
  install -Dm644 "$srcdir/libdoorstop.so" "$pkgdir/opt/Vortex/resources/libdoorstop.so"

  install -Dm755 "$srcdir/vortex.sh" "$pkgdir/usr/bin/vortex"
  install -Dm644 "$srcdir/vortex.desktop" "$pkgdir/usr/share/applications/vortex.desktop"
  install -Dm644 "$srcdir/Vortex/assets/images/vortex.png" "$pkgdir/usr/share/pixmaps/vortex.png" 2>/dev/null || true

  chmod -R 755 "$pkgdir/opt/Vortex/resources/app.asar.unpacked/assets"
}
