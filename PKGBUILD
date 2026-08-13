# Maintainer: forvkusa <forvkusa+aur at csie dot ntu dot edu dot tw>
# The build file is written by Claude Fable 5. Use with caution.
#
# Repackages the official Granola macOS .dmg as a native Linux pacman package.
# Based on https://github.com/tirtha4/Granola-for-Linux.
#
# makepkg downloads the .dmg from Granola's release CDN (the same host the
# in-app updater uses); no manual download step is needed.
#
# Format check: shfmt -ln bash -i 2 -d PKGBUILD
# Linting: shellcheck --shell=bash --exclude=SC2034,SC2148,SC2154 PKGBUILD

pkgname=granola
pkgver=7.478.0
pkgrel=1
pkgdesc="AI notepad for back-to-back meetings, repackaged from the official macOS build"
arch=('x86_64')
url="https://www.granola.ai"
license=('LicenseRef-proprietary')
_electron=electron42
# version of the installed $_electron package
_elver=42.9.0
# version of Granola's bundled better-sqlite3-multiple-ciphers fork
_bs3ver=12.9.0
depends=(
  "$_electron"
  'libstdc++'
  'glibc'
  'sh'
  'desktop-file-utils'
  'xdg-utils'
)
conflicts=('granola-wine')
makedepends=(
  '7zip'
  'nodejs'
  'node-gyp'
  'python'
)
source=(
  "granola-$pkgver.dmg::https://dr2v7l5emb758.cloudfront.net/$pkgver/Granola-$pkgver-mac-universal.dmg"
  "https://registry.npmjs.org/better-sqlite3-multiple-ciphers/-/better-sqlite3-multiple-ciphers-$_bs3ver.tgz"
  "https://electronjs.org/headers/v$_elver/node-v$_elver-headers.tar.gz"
  "granola.desktop"
)
noextract=(
  "granola-$pkgver.dmg"
  "node-v$_elver-headers.tar.gz"
)
sha256sums=('a310b2541aecc38352f98badd4c0ddaaf9344e437e1b09a4f9989e81ab467dc0'
            'ad8ceb2cfe687e0c106547fdd281f0d20b40688200d04f40bb163afd1f102609'
            '7bef173f1350b2c9622b56fcd5ea24a578d2294ab164fd0c55aefa842a0243a6'
            '22b5217b929a1d184f1f73d5f55fbef6756d5fbcef207da64f188231d38c9c20')

_res="Granola/Granola.app/Contents/Resources"
_bs3rel="app.asar.unpacked/node_modules/better-sqlite3-multiple-ciphers"

prepare() {
  local dmg="$srcdir/granola-$pkgver.dmg"

  # The native module is built against the installed electron's headers.
  local sysver
  sysver="$(</usr/lib/$_electron/version)"
  if [[ "$sysver" != "$_elver" ]]; then
    echo "installed $_electron is $sysver, set _elver=$sysver and run updpkgsums" >&2
    return 1
  fi

  # The .dmg must bundle the same Electron major as $_electron.
  7z e "$dmg" \
    "Granola/Granola.app/Contents/Frameworks/Electron Framework.framework/Versions/A/Resources/Info.plist" \
    -ofw -y >/dev/null || { echo "cannot read the .dmg" >&2; return 1; }
  local dmgel
  dmgel="$(grep -A1 CFBundleVersion fw/Info.plist | grep -oE '[0-9]+\.[0-9]+\.[0-9]+' | head -1)"
  if [[ "${dmgel%%.*}" != "${_electron#electron}" ]]; then
    echo ".dmg bundles Electron $dmgel, set _electron=electron${dmgel%%.*} and depends to match" >&2
    return 1
  fi

  7z x "$dmg" "$_res/app.asar" "$_res/app.asar.unpacked" "$_res/icons" \
    -opayload -y >/dev/null

  # The npm tarball (extracted by makepkg into package/) must match the
  # fork version inside the .dmg, or its binding.gyp may not fit the source.
  local bs3="payload/$_res/$_bs3rel"
  local realver
  realver="$(node -p "require('$srcdir/$bs3/package.json').version")"
  if [[ "$realver" != "$_bs3ver" ]]; then
    echo "bundled better-sqlite3-multiple-ciphers is $realver, set _bs3ver=$realver and run updpkgsums" >&2
    return 1
  fi
  cp package/binding.gyp "$bs3/"

  # api.granola.ai answers 500 to any request carrying platform=linux,
  # including the sign-in URL. The app maps darwin->macOS and win32->Windows
  # and passes anything else through verbatim; rewrite that fallback so Linux
  # reports Windows. The replacement is padded to the same byte length
  # because the asar header records file offsets.
  python - "payload/$_res/app.asar" <<'PYEOF'
import sys, pathlib
p = pathlib.Path(sys.argv[1]); data = p.read_bytes(); total = 0
for pat in (b'?`Windows`:window.electron.platform', b'?`Windows`:process.platform'):
    rep = b'?`Windows`:`Windows`'.ljust(len(pat))
    total += data.count(pat)
    data = data.replace(pat, rep)
if total == 0:
    sys.exit("no platform fallback found; Granola's bundler output changed")
p.write_bytes(data)
print(f"patched {total} platform fallback(s)")
PYEOF
}

build() {
  # Granola's fork adds an updateHook() method that upstream npm prebuilts
  # lack, so the module is built from the C++ source shipped in the .dmg.
  cd "payload/$_res/$_bs3rel" || exit 1
  node-gyp rebuild --release --runtime=electron --target="$_elver" --arch=x64 \
    --dist-url=https://electronjs.org/headers \
    --tarball="$srcdir/node-v$_elver-headers.tar.gz" \
    --devdir="$srcdir/gyp-devdir"
}

check() {
  local bs3="$srcdir/payload/$_res/$_bs3rel"
  local db="$srcdir/smoke.db"
  rm -f "$db"
  ELECTRON_RUN_AS_NODE=1 NODE_PATH="$srcdir/payload/$_res/app.asar/node_modules" \
    "/usr/lib/$_electron/electron" -e "
      const Database = require('$bs3/lib/index.js');
      const db = new Database('$db');
      db.pragma(\"cipher='sqlcipher'\");
      db.pragma(\"key='smoketest'\");
      db.exec('CREATE TABLE t(a)');
      let fired = false;
      db.updateHook(() => { fired = true; });
      db.prepare('INSERT INTO t VALUES (1)').run();
      if (db.prepare('SELECT count(*) c FROM t').get().c !== 1) throw new Error('insert failed');
      if (!fired) throw new Error('updateHook did not fire');
      db.close();
    "
  rm -f "$db"
}

package() {
  install -Dm644 "payload/$_res/app.asar" "$pkgdir/usr/lib/granola/app.asar"
  cp -r "payload/$_res/app.asar.unpacked" "$pkgdir/usr/lib/granola/app.asar.unpacked"

  # Keep only the built binaries from the module tree; drop the C++ source,
  # sqlite amalgamation, and node-gyp intermediates.
  local bs3="$pkgdir/usr/lib/granola/$_bs3rel"
  install -Dm755 "$bs3"/build/Release/*.node -t "$srcdir/keep"
  rm -rf "$bs3/build" "$bs3/deps" "$bs3/src" "$bs3/binding.gyp"
  install -Dm755 "$srcdir/keep"/*.node -t "$bs3/build/Release"

  install -Dm644 "payload/$_res/icons/icon.png" "$pkgdir/usr/share/pixmaps/granola.png"
  install -Dm644 granola.desktop "$pkgdir/usr/share/applications/granola.desktop"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/granola" <<EOF
#!/bin/sh
exec /usr/lib/$_electron/electron --ozone-platform-hint=auto /usr/lib/granola/app.asar "\$@"
EOF

  # Upstream ships no EULA file in the .dmg; record the proprietary status
  # and where the terms live, as the license field needs a matching entry.
  install -Dm644 /dev/stdin "$pkgdir/usr/share/licenses/$pkgname/LICENSE" <<EOF
Granola is proprietary software. Copyright (c) Granola.
This package repackages the official binary distribution; no license text
is shipped inside it. Terms: https://www.granola.ai/terms
EOF
}
