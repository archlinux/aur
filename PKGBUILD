# Maintainer: Felipe BF <fprgw32 at gmail dot com>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>

export _electron=electron41

pkgname=alto
pkgver=0.13.0
pkgrel=2
pkgdesc="GUI file synchronization client that can sync with any cloud provider (uses system-wide Electron and rclone)"
arch=('x86_64')
url="https://github.com/hwittenborn/${pkgname}"
license=('GPL-3.0-or-later')
conflicts=('celeste')
depends=(
  "$_electron"
  'rclone'
  'libadwaita'
  'alsa-lib'
  'nss'
  'nspr'
  'mesa'
  'libgcc'
  'expat'
  'libxcb'
  'pango'
  'hicolor-icon-theme'
  'libxext'
  'libxrandr'
  'systemd-libs'
  'libxdamage'
  'glib2'
  'libxfixes'
  'libxcomposite'
  'gtk3'
  'at-spi2-core'
  'libx11'
  'dbus'
  'libxkbcommon'
  'glibc'
  'cairo'
  'libcups'
)
makedepends=(
  'npm'
  'python'
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a12ea6e1244b4d89b729e5c5c072b4798808f21dba637aa7fa26d9259cd1b59f')

_get_arch() {
  local given_arch="$1"
  
  case "$given_arch" in
    x86_64)
      echo "x64"
      ;;
    *)
      echo "$given_arch"
      ;;
  esac
}

_patch_forge_local_electron() {
  python - <<'PY'
import os, re
from pathlib import Path

electron = os.environ["_electron"]

p = Path("forge.config.ts")
s = p.read_text()

plugin = (
    "    { name: '@electron-forge/plugin-local-electron', "
    f"config: {{ electronPath: '/usr/lib/{electron}' }} }},\n"
)

# Insert the plugin right after the opening bracket of the plugins array
s = re.sub(r"(plugins\s*:\s*\[)", r"\1\n" + plugin, s, count=1)
p.write_text(s)
PY
}

_patch_forge_local_rclone() {
  python - <<'PY'
import re
from pathlib import Path

p = Path("forge.config.ts")
s = p.read_text()

# 1. In generateAssets, replace the rclone download loop with a no-op.
#    We'll use the system rclone instead.
s = re.sub(
    r"for \(const each of arch\.split\(','\)\) await fetchRclone\(each\);",
    "// rclone is provided by the system package",
    s,
    count=1,
)

# 2. In packageAfterExtract, replace the copyFile of rclone with a symlink.
#    This makes the app use /usr/bin/rclone at runtime.
s = re.sub(
    r"await copyFile\(await fetchRclone\(arch\), path\.join\(bin, 'rclone'\)\);",
    "await symlink('/usr/bin/rclone', path.join(bin, 'rclone'));",
    s,
    count=1,
)

# 3. The 'copyFile' import is no longer used; replace it with 'symlink'.
s = s.replace(
    "import { chmod, copyFile, mkdir, readdir, rm } from 'node:fs/promises';",
    "import { chmod, symlink, mkdir, readdir, rm } from 'node:fs/promises';",
    1,
)

p.write_text(s)
PY
}

_patch_app_asset_paths() {
  # Patch paths.ts to load assets from the system install location
  python - <<'PY'
from pathlib import Path
p = Path("src/main/paths.ts")
s = p.read_text()

old = "const base = app.isPackaged ? path.join(process.resourcesPath, 'assets') : path.join(app.getAppPath(), 'assets');"
new = ("const base = app.isPackaged "
       "? (process.env.ALTO_ASSETS_DIR ?? '/usr/lib/alto/assets') "
       ": path.join(app.getAppPath(), 'assets');")

if old not in s:
    raise SystemExit("Could not find assetPath base line in paths.ts")

p.write_text(s.replace(old, new, 1))
PY
}

prepare() {
  cd "$pkgname-$pkgver"

  _patch_forge_local_electron
  _patch_forge_local_rclone
  _patch_app_asset_paths
}

build() {
  cd "$pkgname-$pkgver"

  npm install
  npm install --save-dev --no-audit --no-fund @electron-forge/plugin-local-electron
}

check() {
  cd "$pkgname-$pkgver"
  npm run test
}

package() {
  cd "$pkgname-$pkgver"
  npm run package

  local short_arch=$(_get_arch "${arch}")
  local out_dir="out/Alto-linux-${short_arch}/resources"

  install -dm755 "${pkgdir}/usr/lib/${pkgname}"

  cp -r "${out_dir}"/* "${pkgdir}/usr/lib/${pkgname}"

  find "${pkgdir}/usr/lib/${pkgname}" -type d -exec chmod 755 {} \;
  find "${pkgdir}/usr/lib/${pkgname}" -type f -exec chmod 644 {} \;

  install -d "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/${pkgname}" <<EOF
#!/bin/sh
export ALTO_RCLONE=/usr/bin/rclone
export ALTO_ASSETS_DIR=/usr/lib/alto/assets
exec /usr/bin/${_electron} /usr/lib/${pkgname}/app.asar "\$@"
EOF
  chmod 755 "${pkgdir}/usr/bin/${pkgname}"

  install -d "${pkgdir}/usr/share/applications"
  install -Dm755 "assets/linux/${pkgname}.desktop" "${pkgdir}/usr/share/applications/"

  for size in 16 32 48 64 128 256 512; do
    local icon_folder="icons/hicolor/${size}x${size}"
    install -Dm644 "assets/${icon_folder}/com.hunterwittenborn.Alto.png" "${pkgdir}/usr/share/${icon_folder}/apps/${pkgname}.png"
  done

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

