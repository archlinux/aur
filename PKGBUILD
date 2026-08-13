# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

pkgname=stably-orca
pkgver=1.4.182
pkgrel=1
pkgdesc='Stably AI Orca agentic coding IDE and headless runtime (built from source)'
arch=('x86_64' 'aarch64')
url='https://github.com/stablyai/orca'
license=('MIT')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'dbus'
  'electron43'
  'gdk-pixbuf2'
  'gtk3'
  'hicolor-icon-theme'
  'libdrm'
  'libnotify'
  'libsecret'
  'libxcomposite'
  'libxdamage'
  'libxfixes'
  'libxkbcommon'
  'libxrandr'
  'libxss'
  'libxtst'
  'mesa'
  'nss'
  'python'
  'python-gobject'
  'systemd-libs'
  'zlib'
)
optdepends=(
  'kwin: optional KWin virtual Wayland compositor service'
  'wl-clipboard: Wayland clipboard support for computer-use'
  'xclip: X11 clipboard support for computer-use'
  'xsel: alternative X11 clipboard support for computer-use'
  'xdotool: X11 hotkey and window activation support for computer-use'
  'xorg-server-xvfb: automatic virtual X display when no DISPLAY is provided'
  'xorg-xauth: Xwayland authentication for the KWin virtual display service'
  'xorg-xdpyinfo: external X display readiness validation'
  'xorg-xwayland: Xwayland support for the KWin virtual display service'
)
makedepends=(
  'nodejs>=24'
  'nodejs<25'
  'python-setuptools'
)
provides=("orca-ide=$pkgver")
conflicts=('stably-orca-bin' 'stably-orca-git' 'orca-ide' 'orca-ide-bin')
options=('!strip' '!debug')
install=stably-orca.install

_pnpmver=10.24.0
_electronmajor=43
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
  "pnpm-$_pnpmver.tgz::https://registry.npmjs.org/pnpm/-/pnpm-$_pnpmver.tgz"
  'stably-orca.sh'
  'orca-ide.sh'
  'stably-orca.desktop'
  'stably-orca-serve@.service'
  'stably-orca-serve-systemd'
  'stably-orca-kwin-virtual@.service'
  'stably-orca-kwin-display'
  'stably-orca-serve.env.example'
  'stably-orca-serve-kwin.conf.example'
)
sha256sums=('e04668da7e121ffd8132f826bd7b5e3a369552e6b38f768d918f88e405ed2533'
            '196f4bd174ebcbd99786b33452f144cb2dc32ef4e7138ed44491e9d43d702d75'
            'd76ba8a9856aa7181a41bccb1bb7a09b10cc990b0a6d680c328af75eb185c90d'
            '0d8e816f7dd5d46b9da40748ac7a0d709adfd7f09d79ffe71327b60c5c5abbb7'
            '77a10524dc1b971fecd99a5be47b13f93021b0882495ed32a37d12a2f7fed835'
            '0d262438d6ca1de562db33ba8373ccc08298f3fdfa18209864d4189bddfaf742'
            'd423881ade5704432cbe9afea626438991a1dcda3dda3ed18811e1b3fd721e1e'
            '3b1943f5b65997ce52196f055b3c10b30dd5e81ae934a91bff096d42c7fcc425'
            'aba5146aed46aa61abf4000285460f088698f618991d81ef9730d408173cc253'
            'c97fe80d1e55c274207f62c6b388ae4573627028624ae73bcabd0eabcc7d76e5'
            'eacec99a44af83ed452e367f343e69042a21f8d9750f15a6447b7de2991146a0')
noextract=("pnpm-$_pnpmver.tgz")

prepare() {
  rm -rf "$srcdir/pnpm"
  install -d "$srcdir/pnpm"
  bsdtar -xf "$srcdir/pnpm-$_pnpmver.tgz" --strip-components 1 -C "$srcdir/pnpm"

  cd "$srcdir/orca-$pkgver"
  python - <<'PY'
from pathlib import Path

path = Path("config/electron-builder.config.cjs")
data = path.read_text()
import_line = (
    "const { verifyLinuxGlibcFloor } = "
    "require('./scripts/verify-linux-glibc-floor.cjs')\n"
)
check_block = """    // Why: a Linux runner-image glibc bump silently shipped a node-pty pty.node
    // requiring GLIBC_2.34, crashing the app on startup on Ubuntu 20.04 (#9902).
    // Fail packaging if any bundled native binary exceeds the supported floor.
    if (context.electronPlatformName === 'linux') {
      verifyLinuxGlibcFloor(context.appOutDir)
    }
"""
if data.count(import_line) != 1 or data.count(check_block) != 1:
    raise SystemExit("upstream glibc-floor check changed")
path.write_text(data.replace(import_line, "").replace(check_block, ""))
PY
}

build() {
  cd "$srcdir/orca-$pkgver"

  local electron_dist="/usr/lib/electron$_electronmajor"
  local electron_version
  electron_version=$(<"$electron_dist/version")
  electron_version=${electron_version#v}
  if [[ $electron_version != "$_electronmajor".* ]]; then
    printf 'ERROR: electron%s provides unexpected version %s\n' \
      "$_electronmajor" "$electron_version" >&2
    return 1
  fi

  local pnpm=(node "$srcdir/pnpm/bin/pnpm.cjs")

  export HOME="$srcdir/.home"
  export XDG_CACHE_HOME="$srcdir/.cache"
  export XDG_DATA_HOME="$srcdir/.local/share"
  export PNPM_HOME="$srcdir/.pnpm-home"
  export npm_config_cache="$srcdir/.npm"
  export npm_config_manage_package_manager_versions=false
  export npm_config_store_dir="$srcdir/.pnpm-store"
  export ELECTRON_BUILDER_CACHE="$srcdir/.cache/electron-builder"
  export ELECTRON_OVERRIDE_DIST_PATH="$electron_dist"
  export ELECTRON_SKIP_BINARY_DOWNLOAD=1
  export ORCA_FORCE_NATIVE_REBUILD=1
  export HUSKY=0

  install -d "$HOME" "$XDG_CACHE_HOME" "$XDG_DATA_HOME" "$PNPM_HOME" \
    "$npm_config_cache" "$npm_config_store_dir" "$ELECTRON_BUILDER_CACHE"

  "${pnpm[@]}" install --frozen-lockfile --ignore-scripts

  rm -rf node_modules/electron/dist
  ln -s "$electron_dist" node_modules/electron/dist
  printf 'electron' >node_modules/electron/path.txt
  node - "$electron_version" <<'JS'
const fs = require('node:fs')
const path = 'node_modules/electron/package.json'
const pkg = JSON.parse(fs.readFileSync(path, 'utf8'))
pkg.version = process.argv[2]
fs.writeFileSync(path, `${JSON.stringify(pkg, null, 2)}\n`)
JS

  "${pnpm[@]}" rebuild esbuild @parcel/watcher
  "${pnpm[@]}" run postinstall
  local target
  for target in build:relay build:cli build:electron-vite build:web; do
    "${pnpm[@]}" run "$target"
  done
  "${pnpm[@]}" run ensure:electron-runtime

  # System Electron resolves process.resourcesPath to /usr/lib/electron43/resources.
  # Orca's packaged assets live under /usr/lib/stably-orca instead.
  python - <<'PY'
from pathlib import Path
import re
import subprocess

pattern = re.compile(r"(?<![\w$.])process\.resourcesPath\b")
replacement = "'/usr/lib/stably-orca'"
changed_files = []
changed_references = 0
for path in Path("out").rglob("*.js"):
    data = path.read_text()
    updated, count = pattern.subn(replacement, data)
    if count:
        path.write_text(updated)
        changed_files.append(path)
        changed_references += count
if not changed_files:
    raise SystemExit("compiled output has no process.resourcesPath references")
for path in changed_files:
    subprocess.run(["node", "--check", str(path)], check=True)
print(
    f"patched {changed_references} process.resourcesPath references "
    f"across {len(changed_files)} files"
)
PY

  "${pnpm[@]}" exec electron-builder \
    --config config/electron-builder.config.cjs \
    --linux dir \
    --publish never \
    --config.electronDist="$electron_dist" \
    --config.electronVersion="$electron_version"
}

package() {
  cd "$srcdir/orca-$pkgver"

  local unpacked=(dist/linux*-unpacked)
  if [[ ${#unpacked[@]} -ne 1 || ! -d ${unpacked[0]} ]]; then
    printf 'ERROR: expected one electron-builder unpacked Linux directory\n' >&2
    return 1
  fi

  local resources="${unpacked[0]}/resources"
  install -d "$pkgdir/usr/lib/$pkgname"
  cp -a "$resources/." "$pkgdir/usr/lib/$pkgname/"
  chmod -R go-w "$pkgdir/usr/lib/$pkgname"

  # Pacman owns upgrades for this package. Without the generated AppImage
  # manifest, release checks may run but electron-updater cannot self-apply.
  rm -f "$pkgdir/usr/lib/$pkgname/app-update.yml"
  # serve-sim carries macOS helper binaries and authoring sources even in its
  # Linux npm package. They are unreachable on Linux and confuse ELF analysis.
  local serve_sim="$pkgdir/usr/lib/$pkgname/node_modules/serve-sim"
  rm -rf "$serve_sim/Sources"
  rm -f \
    "$serve_sim/bin/serve-sim-bin" \
    "$serve_sim/dist/simcam/libSimCameraInjector.dylib" \
    "$serve_sim/dist/simcam/serve-sim-camera-helper"
  [[ -x "$pkgdir/usr/lib/$pkgname/bin/orca-ide" ]] || {
    printf 'ERROR: packaged Orca CLI shim is missing\n' >&2
    return 1
  }
  [[ -f "$pkgdir/usr/lib/$pkgname/computer-use-linux/runtime.py" ]] || {
    printf 'ERROR: packaged Linux computer-use runtime is missing\n' >&2
    return 1
  }

  # Upstream sherpa-onnx binaries may contain architecture-specific absolute
  # CI paths in RPATH/RUNPATH. Keep only $ORIGIN-relative components without
  # changing the ELF string-table size; an already-clean path is a no-op.
  local sherpa
  local sherpa_bins=()
  mapfile -d '' sherpa_bins < <(
    find "$pkgdir/usr/lib/$pkgname" -type f -name 'sherpa-onnx.node' -print0
  )
  if [[ ${#sherpa_bins[@]} -eq 0 ]]; then
    printf 'ERROR: packaged sherpa-onnx native module is missing\n' >&2
    return 1
  fi
  for sherpa in "${sherpa_bins[@]}"; do
    python - "$sherpa" <<'PY'
from pathlib import Path
import os
import re
import subprocess
import sys

path = Path(sys.argv[1])
result = subprocess.run(
    ["readelf", "-d", path],
    check=True,
    capture_output=True,
    text=True,
    env={**os.environ, "LC_ALL": "C"},
)
matches = re.findall(
    r"Library (?:rpath|runpath): \[(.*?)\]",
    result.stdout,
    flags=re.IGNORECASE,
)
if len(matches) != 1:
    raise SystemExit(
        f"expected one sherpa-onnx RPATH/RUNPATH, found {len(matches)}: {path}"
    )

current = matches[0]
components = current.split(":")
kept = [
    component
    for component in components
    if component == "$ORIGIN" or component.startswith("$ORIGIN/")
]
if not kept:
    raise SystemExit(f"sherpa-onnx path has no $ORIGIN component: {path}: {current}")

cleaned = ":".join(kept)
if current != cleaned:
    data = path.read_bytes()
    needle = current.encode() + b"\0"
    if data.count(needle) != 1:
        raise SystemExit(
            f"expected one sherpa-onnx path string, found {data.count(needle)}: {path}"
        )
    replacement = cleaned.encode() + b"\0" * (len(needle) - len(cleaned))
    path.write_bytes(data.replace(needle, replacement, 1))
PY
  done

  install -Dm755 "$srcdir/stably-orca.sh" "$pkgdir/usr/bin/stably-orca"
  install -Dm755 "$srcdir/orca-ide.sh" "$pkgdir/usr/bin/orca-ide"
  install -Dm755 "$srcdir/stably-orca-serve-systemd" \
    "$pkgdir/usr/lib/$pkgname/stably-orca-serve-systemd"
  install -Dm755 "$srcdir/stably-orca-kwin-display" \
    "$pkgdir/usr/lib/$pkgname/stably-orca-kwin-display"
  install -Dm644 "$srcdir/stably-orca-serve@.service" \
    "$pkgdir/usr/lib/systemd/user/stably-orca-serve@.service"
  install -Dm644 "$srcdir/stably-orca-kwin-virtual@.service" \
    "$pkgdir/usr/lib/systemd/user/stably-orca-kwin-virtual@.service"
  install -Dm644 "$srcdir/stably-orca-serve.env.example" \
    "$pkgdir/usr/share/doc/$pkgname/stably-orca-serve.env.example"
  install -Dm644 "$srcdir/stably-orca-serve-kwin.conf.example" \
    "$pkgdir/usr/share/doc/$pkgname/stably-orca-serve-kwin.conf.example"
  install -Dm644 "$srcdir/stably-orca.desktop" \
    "$pkgdir/usr/share/applications/stably-orca.desktop"
  install -Dm644 resources/build/icon.png \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/stably-orca.png"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
