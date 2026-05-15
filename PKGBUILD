# Maintainer: k8rit0 <angelalvarezferrero@gmail.com>
# Forked from: https://aur.archlinux.org/packages/vortex-linux by Tymon3310
pkgname=vortex-linux-fix
pkgver=2.0.0
pkgrel=3
epoch=1
pkgdesc="Nexus Mods' mod manager - unofficial fix fork of Tymon3310's vortex-linux with native Linux compatibility patches"
arch=('x86_64')
url="https://github.com/Nexus-Mods/Vortex"
license=('GPL-3.0-or-later')

depends=('gtk3' 'nss' 'libxss' 'libsecret' 'dotnet-runtime-9.0')
optdepends=('libappindicator: system tray icon support'
            'libnotify: desktop notifications')
makedepends=('git' 'pnpm' 'npm' 'python' 'python-setuptools' 'dotnet-sdk-9.0')

provides=('vortex')
conflicts=('vortex' 'vortex-git' 'vortex-linux')
install=vortex.install

source=("git+https://github.com/Nexus-Mods/Vortex.git#tag=v${pkgver}"
  "vortex.desktop"
  "vortex.sh")

sha256sums=('930848f174257f6c9a81a63a1610492b68bc14bb505dfdd281fc0ccb8c23efac'
  '7e66931a83d05fb7ca0d086b27ab3fc3b926df02caf71826ee4ee4e8654ea4e5'
  'b75e3826dd3c0658b9d69ea700e9262609753b2dcb3459c26c1265273338dc1e')

options=('!strip' '!debug')

prepare() {
  cd "$srcdir/Vortex"

  msg2 "Injecting compiler and TypeScript overrides..."
  node -e "
    const fs = require('fs');
    let pkg = JSON.parse(fs.readFileSync('package.json', 'utf8'));

    pkg.engines = pkg.engines || {};
    pkg.engines.node = '>=22.0.0';

    pkg.pnpm = pkg.pnpm || {};
    pkg.pnpm.overrides = pkg.pnpm.overrides || {};
    pkg.pnpm.overrides['node-addon-api'] = '8.5.0';
    pkg.pnpm.overrides['@types/react'] = '16';
    pkg.pnpm.overrides['@types/react-dom'] = '16';

    fs.writeFileSync('package.json', JSON.stringify(pkg, null, 2));
  "

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
  export NO_PARALLEL="1"
  export npm_config_yes=true
  export CI=1

  msg2 "Building project via pnpm..."
  pnpm run dist:all

  msg2 "Installing dotnetprobe..."
  cp assets/dotnetprobe app/assets/ 2>/dev/null || true
  chmod +x app/assets/dotnetprobe 2>/dev/null || true

  msg2 "Packaging Electron application..."
  cd src/main
  node ./prepare-dist-package.mjs

  echo "packages:" >>dist/pnpm-workspace.yaml
  echo "  - '.'" >>dist/pnpm-workspace.yaml

  node -e "
    const fs = require('fs');
    let pkg = JSON.parse(fs.readFileSync('dist/package.json', 'utf8'));
    pkg.pnpm = pkg.pnpm || {};
    pkg.pnpm.overrides = pkg.pnpm.overrides || {};
    pkg.pnpm.overrides['node-addon-api'] = '8.5.0';
    fs.writeFileSync('dist/package.json', JSON.stringify(pkg, null, 2));
  "

  pnpm install --dir=./dist --no-frozen-lockfile

  msg2 "Cleaning up conflicting Windows-only native modules..."
  rm -rf dist/node_modules/winapi-bindings 2>/dev/null || true
  rm -rf dist/node_modules/windows-shortcuts-rs 2>/dev/null || true

  rm -rf ../../dist/linux-unpacked 2>/dev/null || true

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

  msg2 "Patching bundled plugins — Linux compatibility..."
  local _bp="$pkgdir/opt/Vortex/resources/app.asar.unpacked/bundledPlugins"
  export _VORTEX_BP="$_bp"
  export _VORTEX_ASAR="$pkgdir/opt/Vortex/resources/app.asar"

  python3 << 'PYEOF'
import struct, json, sys, os
from pathlib import Path

# ── helpers ────────────────────────────────────────────────────────────────

def read_asar_header(raw):
    u0, hps, _pls, jl = struct.unpack_from('<IIII', raw, 0)
    if u0 != 4:
        raise ValueError(f"Unexpected asar magic: {u0}")
    return json.loads(raw[16:16 + jl].decode('utf-8')), jl, 8 + hps

def update_offsets(node, pivot, delta):
    for child in node.get('files', {}).values():
        update_offsets(child, pivot, delta)
    if 'offset' in node and int(node['offset']) > pivot:
        node['offset'] = str(int(node['offset']) + delta)

def patch_asar_file(raw, header, dss, entry, patches, marker=None):
    """Patch one file inside the asar. Returns (new_raw, new_dss)."""
    roff  = int(entry['offset'])
    rsize = int(entry['size'])
    abs_start = dss + roff
    abs_end   = abs_start + rsize

    content = raw[abs_start:abs_end].decode('utf-8')
    if marker and marker in content:
        content = content.replace(marker, '', 1)

    for p in patches:
        if p['old'] not in content:
            tag = '[SKIP]' if p['new'] in content else '[WARN] pattern not found:'
            print(f'    {tag} {p["name"]}')
            continue
        content = content.replace(p['old'], p['new'], 1)
        print(f'    [OK]   {p["name"]}')

    if marker:
        content = marker + content

    new_bytes = content.encode('utf-8')
    delta = len(new_bytes) - rsize
    entry['size'] = len(new_bytes)
    update_offsets(header, roff, delta)

    j = json.dumps(header, separators=(',', ':')).encode('utf-8')
    n = len(j)
    new_raw = struct.pack('<IIII', 4, 8+n, 4+n, n) + j + raw[dss:abs_start] + new_bytes + raw[abs_end:]
    new_dss = 8 + struct.unpack_from('<I', new_raw, 4)[0]
    return new_raw, new_dss

# ── asar patch definitions ─────────────────────────────────────────────────

PATCH_MARKER = "// vortex-linux-fix-v3\n"

RENDERER_PATCHES = [
    {
        "name": "File browser filter — accept Linux executables alongside .exe",
        "old": 'filters:[{name:"Images",extensions:["png","jpg","ico"]},{name:"Executables",extensions:["exe"]}]',
        "new": 'filters:[{name:"Images",extensions:["png","jpg","ico"]},{name:"Executables",extensions:"linux"===process.platform?["x86_64","x86","sh","*"]:["exe"]}]',
    },
    {
        "name": "requiredFiles validator — .exe → .x86_64 fallback on Linux",
        "old": (
            'requiredFiles||[],file=>bluebird_1.default.resolve('
            'fsExtra.stat(path.join(gamePath,file)))).then(()=>{}).'
            'catch(err=>{if("ENOENT"===err.code)return bluebird_1.default.reject(err)})'
        ),
        "new": (
            'requiredFiles||[],file=>bluebird_1.default.resolve('
            '"linux"===process.platform'
            '?fsExtra.stat(path.join(gamePath,file)).catch(()=>fsExtra.stat(path.join(gamePath,file.replace(/\\.exe$/i,".x86_64"))))'
            ':fsExtra.stat(path.join(gamePath,file)))).then(()=>{}).'
            'catch(err=>{if("ENOENT"===err.code)return bluebird_1.default.reject(err)})'
        ),
    },
    {
        "name": "StarterInfo.initFromGame — resolve native Linux binary",
        "old": (
            'this.exePath=path.join(gameDiscovery.path,gameDiscovery.executable||game.executable),'
            'this.commandLine='
        ),
        "new": (
            'this.exePath=(()=>{'
            'const r=gameDiscovery.executable||game.executable,'
            'f=path.join(gameDiscovery.path,r);'
            'if("linux"!==process.platform||!r||!/\\.exe$/i.test(r)||fs.existsSync(f))return f;'
            'const f86=path.join(gameDiscovery.path,r.replace(/\\.exe$/i,".x86_64"));'
            'if(fs.existsSync(f86))return f86;'
            'const fSh=path.join(gameDiscovery.path,"linux","run-client.sh");'
            'if(fs.existsSync(fSh))return fSh;'
            'const fBin=path.join(gameDiscovery.path,"linux",path.basename(r,path.extname(r)));'
            'if(fs.existsSync(fBin))return fBin;'
            'return f;'
            '})(),'
            'this.commandLine='
        ),
    },
    {
        "name": "browseGameLocation — skip identifyStore on Linux",
        "old": (
            '.then(corrected=>function manualGameStoreSelection(api,correctedGamePath)'
            '{const gameStores=(0,getGame_1.getGameStores)();'
            'return GameStoreHelper_1.default.identifyStore(correctedGamePath).then(storeId=>{'
        ),
        "new": (
            '.then(corrected=>"linux"===process.platform'
            '?bluebird_1.default.resolve({corrected,store:"steam"})'
            ':function manualGameStoreSelection(api,correctedGamePath)'
            '{const gameStores=(0,getGame_1.getGameStores)();'
            'return GameStoreHelper_1.default.identifyStore(correctedGamePath).then(storeId=>{'
        ),
    },
    {
        "name": "epicGamesLauncher — stub on Linux (prevent null-ref crashes)",
        "old": "exports.epicGamesLauncher=EpicGamesLauncher_1.default;",
        "new": (
            'exports.epicGamesLauncher="linux"===process.platform'
            '?{findByAppId:()=>Promise.reject(new Error("Epic not available on Linux")),'
            'isGameInstalled:()=>Promise.resolve(!1),'
            'queryPath:()=>Promise.reject(new Error("Epic not available on Linux")),'
            'getAppById:()=>void 0}'
            ':EpicGamesLauncher_1.default;'
        ),
    },
]

WINAPI_PATCHES = [
    {
        "name": "winapi-bindings — Proxy stub with useful errors on Linux",
        "old": "module.exports = {};",
        "new": (
            "module.exports=new Proxy({},{"
            "get:function(t,p){"
            "return function(){"
            "throw new TypeError('winapi: '+String(p)+' not available on Linux');"
            "};}});"
        ),
    },
]

# ── plugin patch definitions ───────────────────────────────────────────────

bp = Path(os.environ['_VORTEX_BP'])

PLUGIN_PATCHES = [
    # gamebryo-plugin-management auto-install fails (not in repo) — remove requirement
    {
        "file": "gamebryo-plugin-indexlock/index.cjs",
        "replacements": [
            ('context.requireExtension("gamebryo-plugin-management");', ''),
        ],
    },
    {
        "file": "gamebryo-archive-check/index.cjs",
        "replacements": [
            ('context.requireExtension("gamebryo-plugin-management");', ''),
        ],
    },
    # Starbound — native Linux binary is linux/starbound (not win64/starbound.exe)
    {
        "file": "game-starbound/index.js",
        "replacements": [
            (
                "const defaultLocation = 'win64/starbound.exe';",
                "const defaultLocation = process.platform === 'linux' ? 'linux/starbound' : 'win64/starbound.exe';",
            ),
        ],
    },
    # Team Fortress 2 — native Linux binary is hl2_linux (not tf_win64.exe)
    {
        "file": "game-teamfortress2/index.js",
        "replacements": [
            (
                "executable: () => 'tf_win64.exe',",
                "executable: () => process.platform === 'linux' ? 'hl2_linux' : 'tf_win64.exe',",
            ),
            (
                "      'tf_win64.exe',\n      path.join('tf', 'gameinfo.txt'),",
                "      process.platform === 'linux' ? 'hl2_linux' : 'tf_win64.exe',\n      path.join('tf', 'gameinfo.txt'),",
            ),
        ],
    },
    # RimWorld — native Linux binary is RimWorldLinux (not RimWorldWin64.exe)
    {
        "file": "game-rimworld/index.js",
        "replacements": [
            (
                "executable: () => 'RimWorldWin64.exe',",
                "executable: () => process.platform === 'linux' ? 'RimWorldLinux' : 'RimWorldWin64.exe',",
            ),
            (
                "      'RimWorldWin64.exe'",
                "      process.platform === 'linux' ? 'RimWorldLinux' : 'RimWorldWin64.exe'",
            ),
        ],
    },
    # War Thunder — native Linux binary is linux64/aces (not win64/aces.exe)
    {
        "file": "game-warthunder/index.js",
        "replacements": [
            (
                "executable: () => 'win64/aces.exe',",
                "executable: () => process.platform === 'linux' ? 'linux64/aces' : 'win64/aces.exe',",
            ),
            (
                "      'win64/aces.exe',",
                "      process.platform === 'linux' ? 'linux64/aces' : 'win64/aces.exe',",
            ),
        ],
    },
    # Surviving Mars — epicGamesLauncher null crash (redundant after renderer patch but safe)
    {
        "file": "game-survivingmars/index.js",
        "replacements": [
            (
                ".catch(() => util.epicGamesLauncher.findByAppId('Ovenbird'))",
                ".catch(() => util.epicGamesLauncher ? util.epicGamesLauncher.findByAppId('Ovenbird') : Promise.reject(new Error('Epic not available')))",
            ),
        ],
    },
]

# ── apply plugin patches ───────────────────────────────────────────────────

print("Patching bundled plugins...")
for spec in PLUGIN_PATCHES:
    fpath = bp / spec['file']
    if not fpath.exists():
        print(f"  [SKIP] {spec['file']} (not found)")
        continue
    content = fpath.read_text('utf-8')
    changed = False
    for old, new in spec['replacements']:
        if old in content:
            content = content.replace(old, new)
            print(f"  [OK]   {spec['file']}: {old[:60]!r}")
            changed = True
        elif new not in content:
            print(f"  [WARN] {spec['file']}: pattern not found: {old[:60]!r}")
    if changed:
        fpath.write_text(content, 'utf-8')

# ── apply asar patches ─────────────────────────────────────────────────────

asar_path = Path(os.environ['_VORTEX_ASAR'])
print("\nPatching app.asar...")

raw = asar_path.read_bytes()
orig_size = len(raw)
header, _, dss = read_asar_header(raw)

# Navigate to winapi-bindings/index.js — patch it FIRST (higher offset → patch from end)
try:
    wi = header['files']['node_modules']['files']['winapi-bindings']['files']['index.js']
    print("  [winapi-bindings/index.js]")
    raw, dss = patch_asar_file(raw, header, dss, wi, WINAPI_PATCHES)
except (KeyError, TypeError):
    print("  [SKIP] winapi-bindings/index.js not found in asar")

# Reload header (dss may have changed after above patch)
header, _, dss = read_asar_header(raw)

# Patch renderer.js — lower offset, done second
if 'renderer.js' not in header.get('files', {}):
    print("ERROR: renderer.js not found in asar", file=sys.stderr)
    sys.exit(1)

ri = header['files']['renderer.js']
print("  [renderer.js]")
raw, dss = patch_asar_file(raw, header, dss, ri, RENDERER_PATCHES, marker=PATCH_MARKER)

asar_path.write_bytes(raw)
print(f"\napp.asar patched ({len(raw) - orig_size:+d} bytes total)")
PYEOF

  install -Dm755 "$srcdir/vortex.sh" "$pkgdir/usr/bin/vortex"
  install -Dm644 "$srcdir/vortex.desktop" "$pkgdir/usr/share/applications/vortex.desktop"
  install -Dm644 "$srcdir/Vortex/assets/images/vortex.png" "$pkgdir/usr/share/pixmaps/vortex.png" 2>/dev/null || true

  chmod -R 777 "$pkgdir/opt/Vortex/resources/app.asar.unpacked/assets"
}
