# Maintainer: 0atxl
# Source pinned to Frost v0.1.0.
pkgname=frost
pkgver=0.1.0
pkgrel=1
pkgdesc='Local browser file manager for Linux desktops'
arch=('x86_64')
url='https://github.com/0atxl/frost'
license=('MIT')
options=('!debug')
depends=('nodejs>=22.13' 'python' 'python-gobject' 'glib2' 'gvfs' 'dbus' 'libvips')
makedepends=('git' 'npm' 'node-gyp' 'pkgconf')
optdepends=('gvfs-smb: SMB shares')
_commit=581218f09fa23d247566862f698ea1cdf783ada2
_addon_commit=6babc960154752f686a7dca8e712991a976a754b
source=("frost::git+https://github.com/0atxl/frost.git#commit=${_commit}"
        "node-addon-api::git+https://github.com/nodejs/node-addon-api.git#commit=${_addon_commit}")
# Git sources use a full immutable commit rather than an unverified moving tag.
sha256sums=('SKIP' 'SKIP')

prepare() {
  cd "$srcdir/frost"
  [[ "$(git rev-parse HEAD)" == "$_commit" ]]
  [[ "$(node -p 'JSON.parse(require("fs").readFileSync("package.json")).version')" == "$pkgver" ]]
  npm ci --include=optional --ignore-scripts --no-audit --no-fund
  # Build tooling such as esbuild needs its platform binary setup.
  SHARP_IGNORE_GLOBAL_LIBVIPS=1 npm rebuild --no-audit --no-fund
}

build() {
  cd "$srcdir/frost"
  npm run build
  node scripts/release/notices.mjs "$srcdir"
  mkdir -p "$srcdir/runtime"
  cp package.json package-lock.json "$srcdir/runtime/"
  npm ci --prefix "$srcdir/runtime" --omit=dev --include=optional --ignore-scripts --no-audit --no-fund
  cd "$srcdir/runtime/node_modules/sharp"
  # Compile against Arch's system Node headers, node-addon-api and libvips.
  # No bundled Node or prebuilt libvips is installed by this package.
  export SHARP_FORCE_GLOBAL_LIBVIPS=1
  export npm_config_nodedir=/usr
  export NODE_PATH="$srcdir:/usr/share/nodejs:/usr/lib/node_modules"
  node-gyp rebuild --directory=src
  # Retain the loadable addon, not compiler objects, Makefiles or build paths.
  install -m755 src/build/Release/*.node "$srcdir/sharp-native.node"
  _native_name=$(basename src/build/Release/*.node)
  rm -rf src/build
  install -Dm755 "$srcdir/sharp-native.node" "src/build/Release/$_native_name"
  rm -rf "$srcdir/runtime/node_modules/@img"/sharp-linux* "$srcdir/runtime/node_modules/@img"/sharp-libvips-*
}

package() {
  cd "$srcdir/frost"
  install -d "$pkgdir/usr/lib/frost" "$pkgdir/usr/bin" "$pkgdir/usr/share/licenses/frost" "$pkgdir/usr/share/doc/frost"
  # Explicit allowlist. Never copy the source checkout or any dot-directories.
  cp -R dist build "$pkgdir/usr/lib/frost/"
  cp -R "$srcdir/runtime/node_modules" "$pkgdir/usr/lib/frost/"
  install -m644 package.json "$pkgdir/usr/lib/frost/"
  install -m755 packaging/frost "$pkgdir/usr/bin/frost"
  install -m644 LICENSE "$pkgdir/usr/share/licenses/frost/LICENSE"
  cp -R "$srcdir/notices" "$pkgdir/usr/share/licenses/frost/"
  install -m644 "$srcdir/THIRD_PARTY_NOTICES.json" "$pkgdir/usr/share/licenses/frost/"
  install -m644 README.md docs/distribution.md "$pkgdir/usr/share/doc/frost/"
  find "$pkgdir/usr" -type d -exec chmod 755 {} +
  chmod -R go-w "$pkgdir/usr"
}
