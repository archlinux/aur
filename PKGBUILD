# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

pkgname=stably-orca
pkgver=1.4.244
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
  'gcc-libs'
  'gdk-pixbuf2'
  'glibc'
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
  'nodejs-lts-krypton'
  'python-setuptools'
)
provides=("orca-ide=$pkgver")
conflicts=('stably-orca-bin' 'stably-orca-git' 'orca-ide' 'orca-ide-bin')
options=('!strip' '!debug')
install=stably-orca.install

_pnpmver=12.14.0
_electronmajor=43
# GitHub tag archives are mutable: a retag keeps the same URL and silently
# changes the payload, so pin the peeled commit of tag v$pkgver instead.
# Version bumps must resolve `git ls-remote $url "refs/tags/v<ver>^{}"` and
# update _commit together with pkgver and the source checksum.
_commit=b8ec5c8d170bcb9988e65de547a3a4e98b2885a9
source=(
  "$pkgname-$pkgver-$_commit.tar.gz::$url/archive/$_commit.tar.gz"
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
source_x86_64=(
  "pnpm-exe-linux-x64-$_pnpmver.tgz::https://registry.npmjs.org/@pnpm/exe.linux-x64/-/exe.linux-x64-$_pnpmver.tgz"
)
source_aarch64=(
  "pnpm-exe-linux-arm64-$_pnpmver.tgz::https://registry.npmjs.org/@pnpm/exe.linux-arm64/-/exe.linux-arm64-$_pnpmver.tgz"
)
sha256sums=('2a6de9fc8df56272c6c3628e2186fce1720dd80a3ffd26ea5524be15c77d046b'
            'ea206e35474bf87be9564a85ca70ed1c8ebdc45da55aafb0a3bf09d1ba69b179'
            'd76ba8a9856aa7181a41bccb1bb7a09b10cc990b0a6d680c328af75eb185c90d'
            '0d8e816f7dd5d46b9da40748ac7a0d709adfd7f09d79ffe71327b60c5c5abbb7'
            '77a10524dc1b971fecd99a5be47b13f93021b0882495ed32a37d12a2f7fed835'
            '0d262438d6ca1de562db33ba8373ccc08298f3fdfa18209864d4189bddfaf742'
            'd423881ade5704432cbe9afea626438991a1dcda3dda3ed18811e1b3fd721e1e'
            '3b1943f5b65997ce52196f055b3c10b30dd5e81ae934a91bff096d42c7fcc425'
            'aba5146aed46aa61abf4000285460f088698f618991d81ef9730d408173cc253'
            'c97fe80d1e55c274207f62c6b388ae4573627028624ae73bcabd0eabcc7d76e5'
            'eacec99a44af83ed452e367f343e69042a21f8d9750f15a6447b7de2991146a0')
sha256sums_x86_64=('1de98ed2e9621113b0887b06322b461efb9df73d913fc1d151039b10b7117a41')
sha256sums_aarch64=('e7ca24224eb626a032828ec584c67903ad2f389911b849d009ed70a19f70d8d3')
noextract=(
  "pnpm-$_pnpmver.tgz"
  "pnpm-exe-linux-x64-$_pnpmver.tgz"
  "pnpm-exe-linux-arm64-$_pnpmver.tgz"
)

prepare() {
  local pnpm_platform
  case $CARCH in
    x86_64) pnpm_platform=linux-x64 ;;
    aarch64) pnpm_platform=linux-arm64 ;;
    *)
      printf 'ERROR: unsupported pnpm platform for architecture %s\n' "$CARCH" >&2
      return 1
      ;;
  esac

  rm -rf "$srcdir/pnpm"
  install -d "$srcdir/pnpm"
  bsdtar -xf "$srcdir/pnpm-$_pnpmver.tgz" --strip-components 1 -C "$srcdir/pnpm"

  local pnpm_exe="$srcdir/pnpm/node_modules/@pnpm/exe.$pnpm_platform"
  install -d "$pnpm_exe"
  bsdtar -xf "$srcdir/pnpm-exe-$pnpm_platform-$_pnpmver.tgz" \
    --strip-components 1 -C "$pnpm_exe"
  node "$srcdir/pnpm/install.js"

  local pnpm_version
  pnpm_version=$("$srcdir/pnpm/pnpm" --version)
  if [[ $pnpm_version != "$_pnpmver" ]]; then
    printf 'ERROR: expected pnpm %s, found %s\n' \
      "$_pnpmver" "$pnpm_version" >&2
    return 1
  fi

  cd "$srcdir/orca-$_commit"
  ORCA_COMMIT="$_commit" python - <<'PY'
import os
from pathlib import Path
path = Path("config/electron-builder.config.cjs")
data = path.read_text()

replacements = [
    (
        "const { verifyLinuxGlibcFloor } = "
        "require('./scripts/verify-linux-glibc-floor.cjs')\n",
        "",
    ),
    (
        "const {\n"
        "  ensureBundledWaylandClipboard,\n"
        "  finalizePackagedWaylandClipboard\n"
        "} = require('./wayland-clipboard-resources.cjs')\n",
        "",
    ),
    (
        "const {\n"
        "  appImageNodeRuntimeFpmArgs,\n"
        "  placeAppImageNodeRuntime,\n"
        "  verifyAppImageNodeRuntimeServesPty\n"
        "} = require('./scripts/appimage-node-runtime.cjs')\n",
        "const { appImageNodeRuntimeFpmArgs } = "
        "require('./scripts/appimage-node-runtime.cjs')\n",
    ),
    (
        "  beforePack: (\n"
        "    context,\n"
        "    mobileWebBundleDir = MOBILE_WEB_BUNDLE_DIR,\n"
        "    ensureWaylandClipboard = ensureBundledWaylandClipboard,\n"
        "    orcadTemplateDir = join(__dirname, '..', orcadTemplateExtraResource.from)\n"
        "  ) => {",
        "  beforePack: (\n"
        "    context,\n"
        "    mobileWebBundleDir = MOBILE_WEB_BUNDLE_DIR,\n"
        "    orcadTemplateDir = join(__dirname, '..', orcadTemplateExtraResource.from)\n"
        "  ) => {",
    ),
    (
        "    if (context.electronPlatformName === 'linux') {\n"
        "      ensureWaylandClipboard(context.arch)\n"
        "    }\n",
        "",
    ),
    (
        "      {\n"
        "        from: 'native/wayland-clipboard/.build/${arch}/orca-wayland-clipboard',\n"
        "        to: 'bin/orca-wayland-clipboard'\n"
        "      },\n",
        "",
    ),
]
for old, new in replacements:
    if data.count(old) != 1:
        raise SystemExit(f"unexpected electron-builder config shape: {old[:60]!r}")
    data = data.replace(old, new)

start = "    let appImageNodeRuntime = null\n"
end = "    verifyPackagedMainRuntimeDeps(resourcesDir)\n"
if data.count(start) != 1 or data.count(end) != 1:
    raise SystemExit("unexpected Linux runtime hook shape")
start_index = data.index(start)
end_index = data.index(end, start_index)
data = data[:start_index] + data[end_index:]

runtime_probe = (
    "      if (appImageNodeRuntime) {\n"
    "        await verifyAppImageNodeRuntimeServesPty(resourcesDir, appImageNodeRuntime)\n"
    "      }\n"
)
if data.count(runtime_probe) != 1:
    raise SystemExit("unexpected AppImage runtime probe shape")
data = data.replace(runtime_probe, "")

path.write_text(data)

commit_path = Path("config/scripts/build-source-commit.mjs")
if not commit_path.is_file():
    raise SystemExit("missing config/scripts/build-source-commit.mjs")
commit_path.write_text(
    "export function resolveBuildSourceCommit() {\n"
    f"  return '{os.environ['ORCA_COMMIT']}'\n"
    "}\n"
)
PY
}

build() {
  cd "$srcdir/orca-$_commit"

  local electron_dist="/usr/lib/electron$_electronmajor"
  local electron_version
  electron_version=$(<"$electron_dist/version")
  electron_version=${electron_version#v}
  if [[ $electron_version != "$_electronmajor".* ]]; then
    printf 'ERROR: electron%s provides unexpected version %s\n' \
      "$_electronmajor" "$electron_version" >&2
    return 1
  fi

  local pnpm=("$srcdir/pnpm/pnpm")

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
  # Upstream scripts such as build:cli call bare `pnpm`; resolve it to the
  # pinned copy instead of whatever the build host has installed.
  export PATH="$srcdir/pnpm:$PATH"

  install -d "$HOME" "$XDG_CACHE_HOME" "$XDG_DATA_HOME" "$PNPM_HOME" \
    "$npm_config_cache" "$npm_config_store_dir" "$ELECTRON_BUILDER_CACHE"

  "${pnpm[@]}" install --frozen-lockfile --ignore-scripts \
    --cpu=current,x64,arm64

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

  # Mobile is a separate workspace; its postinstall generates webview modules.
  (
    cd mobile
    "${pnpm[@]}" install --frozen-lockfile
  )

  local target
  for target in build:cli build:electron-vite build:web-from-renderer build:mobile-web; do
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
  cd "$srcdir/orca-$_commit"

  local unpacked=(dist/linux*-unpacked)
  if [[ ${#unpacked[@]} -ne 1 || ! -d ${unpacked[0]} ]]; then
    printf 'ERROR: expected one electron-builder unpacked Linux directory\n' >&2
    return 1
  fi

  local resources="${unpacked[0]}/resources"
  install -d "$pkgdir/usr/lib/$pkgname"
  cp -a "$resources/." "$pkgdir/usr/lib/$pkgname/"
  chmod -R go-w "$pkgdir/usr/lib/$pkgname"

  # System Electron and the Arch package own updates; this marker is only for
  # upstream's AppImage target and must not leak into the installed resources.
  rm -f \
    "$pkgdir/usr/lib/$pkgname/app-update.yml" \
    "$pkgdir/usr/lib/$pkgname/package-type"
  # serve-sim carries macOS helper binaries and authoring sources even in its
  # Linux npm package. They are unreachable on Linux and confuse ELF analysis.
  local serve_sim="$pkgdir/usr/lib/$pkgname/node_modules/serve-sim"
  rm -rf "$serve_sim/Sources"
  rm -f \
    "$serve_sim/bin/serve-sim-bin" \
    "$serve_sim/dist/simcam/libSimCameraInjector.dylib" \
    "$serve_sim/dist/simcam/serve-sim-camera-helper"
  # Keep node-pty's loadable addon, but discard node-gyp/Forge build state,
  # duplicate objects, dependency files and foreign Windows helper payloads.
  local node_modules="$pkgdir/usr/lib/$pkgname/node_modules"
  local node_pty="$node_modules/node-pty"
  rm -f \
    "$node_pty/build/Makefile" \
    "$node_pty/build/binding.Makefile" \
    "$node_pty/build/pty.target.mk" \
    "$node_pty/build/config.gypi" \
    "$node_pty/build/Release/.forge-meta" \
    "$node_pty/build/Release/node-addon-api@"*/node_modules/node-addon-api/node_addon_api_except.stamp.d \
    "$node_pty/node-addon-api@"*/node_modules/node-addon-api/node_addon_api_except.stamp \
    "$node_modules/ssh2/util/pagent.exe"
  rm -rf \
    "$node_pty/build/Release/.deps" \
    "$node_pty/build/Release/obj.target"

  # Pruning platform-specific npm payloads leaves empty package directories.
  find "$node_modules" -depth -type d -empty -delete

  local pty_addon="$node_pty/build/Release/pty.node"
  [[ -s "$pty_addon" ]] || {
    printf 'ERROR: packaged node-pty addon is missing or empty\n' >&2
    return 1
  }

  local node_pty_build_extras=()
  mapfile -d '' node_pty_build_extras < <(
    find "$node_pty/build" -mindepth 1 \
      ! -path "$node_pty/build/Release" \
      ! -path "$pty_addon" \
      -print0
  )
  if [[ ${#node_pty_build_extras[@]} -ne 0 ]]; then
    printf 'ERROR: packaged node-pty build tree contains unexpected entries:\n' >&2
    printf '  %s\n' "${node_pty_build_extras[@]}" >&2
    return 1
  fi

  local node_pty_metadata=()
  mapfile -d '' node_pty_metadata < <(
    find "$node_pty" \
      \( -name 'Makefile' \
      -o -name 'binding.Makefile' \
      -o -name '*.target.mk' \
      -o -name 'config.gypi' \
      -o -name '.forge-meta' \
      -o -name '*.stamp' \
      -o -name '*.stamp.d' \
      -o -name '.deps' \
      -o -name 'obj.target' \) \
      -print0
  )
  if [[ ${#node_pty_metadata[@]} -ne 0 ]]; then
    printf 'ERROR: packaged node-pty retains build metadata:\n' >&2
    printf '  %s\n' "${node_pty_metadata[@]}" >&2
    return 1
  fi

  local node_pty_zero_files=()
  mapfile -d '' node_pty_zero_files < <(
    find "$node_pty" -type f -empty -print0
  )
  if [[ ${#node_pty_zero_files[@]} -ne 0 ]]; then
    printf 'ERROR: packaged node-pty contains zero-length files:\n' >&2
    printf '  %s\n' "${node_pty_zero_files[@]}" >&2
    return 1
  fi
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
  python - resources/build/icon.png resources/icon.png <<'PY'
from pathlib import Path
import sys

def check_png(path_str, expected_dims):
    path = Path(path_str)
    data = path.read_bytes()[:24]
    if data[:8] != b"\x89PNG\r\n\x1a\n" or data[12:16] != b"IHDR":
        raise SystemExit(f"Orca icon is not a valid PNG: {path}")
    dimensions = (
        int.from_bytes(data[16:20], "big"),
        int.from_bytes(data[20:24], "big"),
    )
    if dimensions != expected_dims:
        raise SystemExit(f"expected {expected_dims} Orca icon, found {dimensions}: {path}")

check_png(sys.argv[1], (1024, 1024))
check_png(sys.argv[2], (256, 256))
PY
  install -Dm644 resources/icon.png \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/stably-orca.png"
  install -Dm644 resources/build/icon.png \
    "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/stably-orca.png"
  install -Dm644 resources/icon.png \
    "$pkgdir/usr/share/pixmaps/stably-orca.png"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  local empty_dirs=()
  mapfile -d '' empty_dirs < <(find "$pkgdir" -type d -empty -print0)
  if [[ ${#empty_dirs[@]} -ne 0 ]]; then
    printf 'ERROR: packaged tree contains empty directories:\n' >&2
    printf '  %s\n' "${empty_dirs[@]}" >&2
    return 1
  fi
}
