# Maintainer: Piotr Balwierz <nikt@tuta.com>
pkgname=jbrowse-desktop-git
_appname=jbrowse-desktop
pkgver=4.3.0.r11311.g76002d07d6
pkgrel=1
pkgdesc="JBrowse 2 — pluggable open-source genome browser (desktop Electron app, git version)"
arch=('any')
url="https://jbrowse.org/jb2/"
license=('Apache-2.0')
# Runtime: system Electron (upstream targets electron ^42). Renderer + main are
# bundled at build time (esbuild main with external:electron, webpack renderer),
# so no node_modules are needed at runtime.
depends=('electron42' 'hicolor-icon-theme')
makedepends=('git' 'pnpm' 'nodejs')
provides=('jbrowse-desktop')
conflicts=('jbrowse-desktop')
options=('!strip' '!debug')
source=("$_appname::git+https://github.com/GMOD/jbrowse-components.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_appname"
  local _v
  _v=$(node -p "require('./products/jbrowse-desktop/package.json').version")
  printf "%s.r%s.g%s" "$_v" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_appname"
  # Keep npm/pnpm caches inside srcdir; skip the unused bundled Electron binary
  # (we run on system electron42) and give Node headroom for the webpack build.
  export ELECTRON_SKIP_BINARY_DOWNLOAD=1
  # e2e-only tooling pulled in as devDeps; their browser/binary downloads are
  # not needed to build and can fail on flaky networks.
  export PUPPETEER_SKIP_DOWNLOAD=1
  export npm_config_cache="$srcdir/.npm-cache"
  export NODE_OPTIONS="--max-old-space-size=8192"

  # Scope install to the desktop subgraph only — the default whole-monorepo
  # install builds website/jbrowse-img deps (sharp/libvips, node-canvas) that
  # have no prebuilt binaries for the host Node and fail to compile.
  pnpm install --frozen-lockfile --filter "@jbrowse/desktop..."
  cd products/jbrowse-desktop
  pnpm build
}

package() {
  cd "$srcdir/$_appname/products/jbrowse-desktop"

  # The app's *internal* version must be valid semver (electron-updater parses
  # app.getVersion() and throws otherwise) — use upstream's, not the Arch pkgver.
  local _ver
  _ver=$(node -p "require('./package.json').version")

  # App payload: the built renderer + bundled electron main.
  # The packaged main loads the renderer from `app.getAppPath()/index.html`
  # (= the dir holding package.json), so flatten build/'s contents into the app
  # root — index.html, static/ and electron.js all sit next to package.json.
  install -dm755 "$pkgdir/usr/lib/$_appname"
  cp -r build/. "$pkgdir/usr/lib/$_appname/"

  # Minimal runtime package.json so `electron <dir>` finds the entry point
  cat > "$pkgdir/usr/lib/$_appname/package.json" <<EOF
{
  "name": "jbrowse-desktop",
  "productName": "JBrowse 2",
  "version": "$_ver",
  "type": "module",
  "main": "electron.js"
}
EOF

  # Launcher using the system Electron 42 runtime
  install -dm755 "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/$_appname" <<EOF
#!/bin/sh
exec electron42 /usr/lib/$_appname --ozone-platform-hint=auto "\$@"
EOF
  chmod 755 "$pkgdir/usr/bin/$_appname"

  # Icon (size-agnostic location so it is always found) + hicolor
  install -Dm644 assets/icon.png "$pkgdir/usr/share/pixmaps/$_appname.png"
  install -Dm644 assets/icon.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/$_appname.png"

  # Desktop entry
  install -dm755 "$pkgdir/usr/share/applications"
  cat > "$pkgdir/usr/share/applications/$_appname.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=JBrowse 2
GenericName=Genome Browser
Comment=A pluggable open-source genome browser
Exec=$_appname %U
Icon=$_appname
Terminal=false
Categories=Science;Biology;Education;
StartupWMClass=JBrowse 2
EOF

  install -Dm644 "$srcdir/$_appname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
