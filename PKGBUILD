# Maintainer: k8rit0 <angelalvarezferrero@gmail.com>
# Forked from: https://aur.archlinux.org/packages/vortex-linux by Tymon3310
pkgname=vortex-linux-fix
pkgver=2.0.0
pkgrel=1
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

  msg2 "Applying Linux compatibility patches to app.asar..."
  export _VORTEX_ASAR="$pkgdir/opt/Vortex/resources/app.asar"
  python3 << 'PYEOF'
import struct, json, sys, os
from pathlib import Path

asar_path = Path(os.environ['_VORTEX_ASAR'])
PATCH_MARKER = "// vortex-linux-fix-v2\n"

PATCHES = [
    {
        "name": "File browser filter — accept Linux executables (x86_64/x86/sh/*)",
        "old": 'filters:[{name:"Executables",extensions:["exe"]}]',
        "new": 'filters:[{name:"Executables",extensions:"linux"===process.platform?["x86_64","x86","sh","*"]:["exe"]}]',
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
        "name": "StarterInfo.initFromGame — .exe → .x86_64 fallback when exe missing on Linux",
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
        "name": "browseGameLocation — skip manualGameStoreSelection on Linux",
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
]

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

def write_asar(header, data_before, patched_bytes, data_after):
    j = json.dumps(header, separators=(',', ':')).encode('utf-8')
    n = len(j)
    return struct.pack('<IIII', 4, 8 + n, 4 + n, n) + j + data_before + patched_bytes + data_after

raw = asar_path.read_bytes()
header, json_len, dss = read_asar_header(raw)

if 'renderer.js' not in header.get('files', {}):
    print("ERROR: renderer.js not found in asar", file=sys.stderr)
    sys.exit(1)

ri = header['files']['renderer.js']
roff = int(ri['offset'])
rsize = int(ri['size'])
abs_start = dss + roff
abs_end = abs_start + rsize

js = raw[abs_start:abs_end].decode('utf-8')
if PATCH_MARKER in js:
    js = js.replace(PATCH_MARKER, '', 1)

patched = js
for p in PATCHES:
    if p["old"] not in patched:
        status = "[SKIP]" if p["new"] in patched else "[WARN] Pattern not found:"
        print(f'  {status} {p["name"]}')
        continue
    patched = patched.replace(p["old"], p["new"], 1)
    print(f'  [OK]   {p["name"]}')

patched_bytes = (PATCH_MARKER + patched).encode('utf-8')
delta = len(patched_bytes) - rsize

ri['size'] = len(patched_bytes)
update_offsets(header, roff, delta)

asar_path.write_bytes(write_asar(header, raw[dss:abs_start], patched_bytes, raw[abs_end:]))
print(f'app.asar patched ({len(asar_path.read_bytes()) - len(raw):+d} bytes)')
PYEOF

  install -Dm755 "$srcdir/vortex.sh" "$pkgdir/usr/bin/vortex"
  install -Dm644 "$srcdir/vortex.desktop" "$pkgdir/usr/share/applications/vortex.desktop"
  install -Dm644 "$srcdir/Vortex/assets/images/vortex.png" "$pkgdir/usr/share/pixmaps/vortex.png" 2>/dev/null || true

  chmod -R 777 "$pkgdir/opt/Vortex/resources/app.asar.unpacked/assets"
}
