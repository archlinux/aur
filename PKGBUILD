# Maintainer: jinzhongjia <mail@nvimer.org>
pkgname=deepseek-reasonix-studio
_pkgname=reasonix-studio
pkgver=2.31.0
pkgrel=1
pkgdesc="Reasonix Studio - desktop window around the DeepSeek-native AI coding agent (2.x line)"
arch=('x86_64' 'aarch64')
url="https://github.com/esengine/DeepSeek-Reasonix"
# The SPA bundles Inter, IBM Plex Mono and Noto Sans SC.
license=('MIT' 'OFL-1.1')
# Keep in sync with desktop/electron/package.json devDependencies.electron;
# prepare() refuses a different major.
_electron=electron44
depends=("$_electron" 'hicolor-icon-theme' 'xdg-utils')
makedepends=('go' 'nodejs>=24' 'pnpm')
optdepends=('bubblewrap: sandbox for agent shell commands')
provides=("$_pkgname")
conflicts=("$_pkgname")
# The kernel is built with -s -w like upstream's release, so there is nothing
# for a split debug package.
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/studio-v$pkgver.tar.gz"
        "$_pkgname.sh"
        "$_pkgname.desktop")
sha256sums=('f1e856fc670d964cb1a9174569ab6afab59c67bf26f47cc5c4f7a4b170c4433f'
            '052e14d748355592e4b60f3e81f87537daf3cf18082be73ff7e1a3e80233f806'
            '87b009437ac5b35743a9624da2b1598623a15c89dfc2c1c62409a8baaf8137e7')

prepare() {
    cd "DeepSeek-Reasonix-studio-v$pkgver"
    local _upstream
    _upstream="$(node -p "require('./desktop/electron/package.json').devDependencies.electron.match(/\d+/)[0]")"
    if [[ "electron$_upstream" != "$_electron" ]]; then
        error "upstream pins electron $_upstream, PKGBUILD depends on $_electron"
        return 1
    fi
    # pacman owns this install. The kernel only registers its self-update
    # routes when the shell names the application file and process it would
    # replace; keep stating the version (remote kernels are installed by it)
    # and never the application, so there is no updater to offer or run.
    node <<'JS'
const fs = require('node:fs');
const f = 'desktop/electron/src/main.js';
let s = fs.readFileSync(f, 'utf8');
const from = `  if (app.isPackaged) {
    args.push("-studio-version", app.getVersion());`;
const tail = `    args.push("-studio-app", process.execPath, "-studio-app-pid", String(process.pid));
  }`;
if (!s.includes(from) || !s.includes(tail)) throw new Error('upstream host arguments changed');
s = s.replace(from, `  {
    args.push("-studio-version", app.getVersion());`).replace(tail, '  }');
fs.writeFileSync(f, s);
JS
    # Upstream's pnpm 10 skips esbuild's postinstall with a warning; pnpm 11
    # fails on it. Vite runs the prebuilt @esbuild/* binary either way.
    pnpm --dir desktop/frontend-next install --frozen-lockfile \
        --config.strict-dep-builds=false --store-dir "$srcdir/.pnpm-store"
}

build() {
    cd "DeepSeek-Reasonix-studio-v$pkgver"
    pnpm --dir desktop/frontend-next build
    # What desktop/electron/packaging/build-host.js runs, plus -trimpath.
    CGO_ENABLED=0 go build -buildvcs=false -trimpath \
        -ldflags "-s -w -X main.version=v$pkgver" \
        -o desktop/electron/bin/reasonix-studio-host ./cmd/reasonix-studio-host
    # electron-builder injects the release version the same way; package.json
    # carries 0.0.0 in the tree. desktopName ties a native Wayland window to
    # the installed .desktop entry.
    node -e "
const fs = require('node:fs');
const f = 'desktop/electron/package.json';
const p = JSON.parse(fs.readFileSync(f, 'utf8'));
p.version = process.argv[1];
p.desktopName = 'reasonix-studio.desktop';
fs.writeFileSync(f, JSON.stringify(p, null, 2) + '\n');
" "$pkgver"
}

package() {
    cd "DeepSeek-Reasonix-studio-v$pkgver"
    local _lib="$pkgdir/usr/lib/$_pkgname"
    # The shell has no runtime npm dependencies; these are electron-builder's
    # `files`.
    install -d "$_lib/app"
    cp -r --no-preserve=ownership desktop/electron/{src,assets,package.json} "$_lib/app/"
    install -Dm755 desktop/electron/bin/reasonix-studio-host "$_lib/bin/reasonix-studio-host"
    install -d "$_lib/frontend-next"
    cp -r --no-preserve=ownership desktop/frontend-next/dist "$_lib/frontend-next/"

    sed "s|@ELECTRON@|$_electron|" "$srcdir/$_pkgname.sh" | install -Dm755 /dev/stdin "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 "$srcdir/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
    install -Dm644 desktop/electron/assets/icon.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/$_pkgname.png"
    install -Dm644 desktop/electron/assets/icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_pkgname.svg"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
