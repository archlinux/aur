# Maintainer: jin <mail@nvimer.org>
pkgname=deepseek-reasonix-desktop
pkgver=1.38.6
pkgrel=1
pkgdesc="Reasonix desktop — an Electron shell around the DeepSeek-native AI coding agent"
arch=('x86_64' 'aarch64')
url="https://github.com/esengine/DeepSeek-Reasonix"
license=('MIT')
depends=('alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'expat' 'gcc-libs' 'glib2'
         'glibc' 'gtk3' 'hicolor-icon-theme' 'libcups' 'libnotify' 'libx11'
         'libxcb' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes'
         'libxkbcommon' 'libxrandr' 'libxss' 'mesa' 'nspr' 'nss' 'pango'
         'systemd-libs' 'xdg-utils')
makedepends=('go' 'nodejs>=24' 'pnpm')
provides=('reasonix-desktop')
conflicts=('reasonix-desktop')
options=('!strip' '!debug')
# Application UI, Electron shell, service, CLI and launcher are built from source.
# Only the upstream-pinned Chromium/Electron runtime is a prebuilt dependency.
_electron_ver=44.2.0
_commit=e2145b031deef603d9ec1acc9d30f9a1e1ac9325
_electron_url="https://github.com/electron/electron/releases/download/v${_electron_ver}"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/desktop-v$pkgver.tar.gz")
source_x86_64=("${_electron_url}/electron-v${_electron_ver}-linux-x64.zip")
source_aarch64=("${_electron_url}/electron-v${_electron_ver}-linux-arm64.zip")
noextract=("electron-v${_electron_ver}-linux-x64.zip" "electron-v${_electron_ver}-linux-arm64.zip")
sha256sums=('467bd5a0c753ee7878edb989d34a8857e67cee252c213686c08248a335316341')
sha256sums_x86_64=('574f7d8cd2a82d77812849729a282b86639b050de120d58b138a126d16b48692')
sha256sums_aarch64=('8693fd67332d417775dc2ffc470f4c05eda9d0ed1ac329e4866e108afaa4ddda')

prepare() {
    cd "DeepSeek-Reasonix-desktop-v$pkgver"
    # Arch ships pnpm 11, which reads upstream's v9 lockfile. Drop only the
    # package-manager pin/range; preserve all dependency and Node requirements.
    node <<'JS'
const fs = require('node:fs');
for (const f of ['desktop/package.json', 'desktop/frontend/package.json', 'desktop/electron/package.json']) {
  const p = JSON.parse(fs.readFileSync(f, 'utf8'));
  delete p.packageManager;
  if (p.engines) delete p.engines.pnpm;
  fs.writeFileSync(f, JSON.stringify(p, null, 2) + '\n');
}
const f = 'desktop/packaging/package.mjs';
let s = fs.readFileSync(f, 'utf8');
const needle = 'const [finalPath] = await packager(options);';
if (!s.includes(needle)) throw new Error('upstream packager call changed');
s = s.replace(needle, 'options.electronZipDir = process.env.ELECTRON_ZIP_DIR;\n  ' + needle);
fs.writeFileSync(f, s);
JS
    # The runtime is an explicit, checksummed makepkg source, not an unchecked
    # npm postinstall download. Other allowlisted build scripts remain enabled.
    ELECTRON_SKIP_BINARY_DOWNLOAD=1 pnpm --dir desktop install \
        --frozen-lockfile --store-dir "${srcdir}/.pnpm-store"
}

build() {
    cd "DeepSeek-Reasonix-desktop-v$pkgver"
    local _goarch
    case "$CARCH" in x86_64) _goarch=amd64 ;; aarch64) _goarch=arm64 ;; esac
    export CGO_ENABLED=0
    export REASONIX_COMMIT="${_commit:0:12}"
    export REASONIX_BUILD_TIME="$(date -u -d "@${SOURCE_DATE_EPOCH:-0}" +%Y-%m-%dT%H:%M:%SZ)"
    export ELECTRON_ZIP_DIR="${srcdir}"
    local _docs="-X reasonix/internal/productdocs.linkedVersion=v$pkgver -X reasonix/internal/productdocs.linkedRevision=$_commit"
    mkdir -p desktop/build/bin
    go build -buildvcs=false -trimpath \
        -ldflags "-s -w -X main.version=v$pkgver -X main.gitCommit=$REASONIX_COMMIT -X main.buildTimeUTC=$REASONIX_BUILD_TIME $_docs" \
        -o desktop/build/bin/reasonix ./cmd/reasonix
    go build -buildvcs=false -trimpath -ldflags "-s -w -X main.version=v$pkgver" \
        -o desktop/build/bin/reasonix-launcher ./cmd/reasonix-launcher
    (
        cd desktop
        local _contract_before
        _contract_before="$(mktemp -d "${srcdir}/contract-before.XXXXXX")"
        cp -a --no-preserve=ownership frontend/src/generated/. "$_contract_before/"
        go run -buildvcs=false -trimpath . -emit-contract frontend/src/generated
        diff -r "$_contract_before" frontend/src/generated
        go build -buildvcs=false -trimpath \
            -ldflags "-s -w -X main.version=v$pkgver -X main.channel=stable $_docs" \
            -o build/bin/reasonix-desktop .
    )
    # Use upstream's frontend/shell builds and official packager. Its build.json
    # receives exactly the same full version/channel/commit as the Go service.
    node desktop/packaging/package.mjs "linux/$_goarch" "v$pkgver" stable
}

package() {
    cd "DeepSeek-Reasonix-desktop-v$pkgver"
    local _goarch _bin _icon _dir
    case "$CARCH" in x86_64) _goarch=amd64 ;; aarch64) _goarch=arm64 ;; esac
    install -d "$pkgdir/usr/lib/reasonix" "$pkgdir/usr/bin"
    cp -a --no-preserve=ownership "desktop/build/electron/linux-$_goarch/app" "$pkgdir/usr/lib/reasonix/"
    for _bin in reasonix reasonix-desktop reasonix-launcher; do
        install -Dm755 "desktop/build/bin/$_bin" "$pkgdir/usr/lib/reasonix/$_bin"
    done
    # Resolve the real launcher path to keep both sibling-service and CLI-sidecar
    # lookup intact, without owning the TUI package's public /usr/bin/reasonix.
    ln -s ../lib/reasonix/reasonix-desktop "$pkgdir/usr/bin/reasonix-desktop"
    ln -s ../lib/reasonix/reasonix-launcher "$pkgdir/usr/bin/reasonix-launcher"
    chmod 4755 "$pkgdir/usr/lib/reasonix/app/chrome-sandbox"
    install -Dm644 desktop/build/linux/reasonix.desktop \
        "$pkgdir/usr/share/applications/Reasonix.desktop"
    sed -i 's/^StartupWMClass=.*/StartupWMClass=Reasonix/' \
        "$pkgdir/usr/share/applications/Reasonix.desktop"
    for _icon in desktop/build/linux/icons/hicolor/*/apps/reasonix-desktop.*; do
        _dir="$(basename "$(dirname "$(dirname "$_icon")")")"
        install -Dm644 "$_icon" "$pkgdir/usr/share/icons/hicolor/$_dir/apps/$(basename "$_icon")"
    done
    install -Dm644 desktop/build/appicon.png "$pkgdir/usr/share/pixmaps/reasonix-desktop.png"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    # No Debian update-helper, polkit policy or legacy migrator: pacman owns updates.
}
