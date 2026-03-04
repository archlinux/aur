# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=mindwtr
pkgver=0.7.1
pkgrel=1
_nodeversion=20
pkgdesc="Mind Like Water: A complete Getting Things Done (GTD) productivity system"
arch=('x86_64')
url="https://github.com/dongdongbh/Mindwtr"
license=('AGPL-3.0-or-later')
depends=(
  'alsa-lib'
  'gtk3'
  'libappindicator'
  'libsoup3'
  'webkit2gtk-4.1'
)
makedepends=(
  'bun'
  'cargo'
  'cargo-tauri'
  'clang'
  'cmake'
  'git'
  'nvm'
  'python'
)
source=("git+https://github.com/dongdongbh/Mindwtr.git#tag=v$pkgver"
        "$pkgname.desktop")
sha256sums=('fe6dea5fbdcf61c4ea8b69f3b8a3b75f28033e076dd2cdc473e16435a307fc0d'
            'c283dc386b122df8db1157a2f74e7cfd780ab65133ab8fef6c74b2179f85161c')

_ensure_local_nvm() {
  # let's be sure we are starting clean
  which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload
  export NVM_DIR="${srcdir}/.nvm"

  # The init script returns 3 if version specified
  # in ./.nvmrc is not (yet) installed in $NVM_DIR
  # but nvm itself still gets loaded ok
  source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
}

prepare() {
  cd Mindwtr
  _ensure_local_nvm
  nvm install "${_nodeversion}"
  # tauri_conf_v2_compat: normalize deprecated bundle.macOS.infoPlist for tauri v2 schema.
  node - <<'NODE'
const fs = require('fs');
const configPaths = [
  'apps/desktop/src-tauri/tauri.conf.json',
  'apps/desktop/src-tauri/tauri.appstore.conf.json'
];

for (const configPath of configPaths) {
  if (!fs.existsSync(configPath)) continue;
  const config = JSON.parse(fs.readFileSync(configPath, 'utf8'));
  const mac = config?.bundle?.macOS;
  if (!mac || typeof mac.infoPlist !== 'string' || mac.infoPlist.length === 0) continue;
  const infoPlist = mac.infoPlist;
  delete mac.infoPlist;
  mac.files = { ...(mac.files || {}), 'Info.plist': infoPlist };
  fs.writeFileSync(configPath, JSON.stringify(config, null, 2) + '\n');
  console.log(`Patched ${configPath} for tauri v2 schema compatibility`);
}
NODE


  cd apps/desktop/src-tauri
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc --print host-tuple)"
}

build() {
  cd Mindwtr
  CFLAGS+=" -ffat-lto-objects"
  CXXFLAGS+=" -ffat-lto-objects"
  export BUN_INSTALL_CACHE_DIR="$srcdir/bun-cache"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  _ensure_local_nvm
  bun install

  cd apps/desktop
  cargo tauri build --no-bundle
}

check() {
  cd Mindwtr/apps/desktop
  export BUN_INSTALL_CACHE_DIR="$srcdir/bun-cache"
  bun test
}

package() {
  cd Mindwtr/apps/desktop/src-tauri
  install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"
  
  for i in 32x32 64x64 128x128 128x128@2x; do
    install -Dm644 "icons/${i}.png" \
      "$pkgdir/usr/share/icons/hicolor/${i}/apps/$pkgname.png"
  done
  install -Dm644 icons/icon.png \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"

  install -Dm644 "$srcdir/$pkgname.desktop" -t \
    "$pkgdir/usr/share/applications/"
}
