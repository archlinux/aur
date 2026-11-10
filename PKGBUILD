# Maintainer: Nguyen Hoang Ky <nhktmdzhg at gmail dot com>
pkgname=zalo-for-linux-git
pkgdesc="Zalo for Linux — unofficial port with ZaDark, running on system Electron 22"
arch=('x86_64' 'aarch64')
url="https://github.com/doandat943/zalo-for-linux"
license=('BSD-3-Clause')
pkgver=26.11.10+26.3.r386.784f24f
pkgrel=1
epoch=2
provides=('zalo')
conflicts=('zalo' 'zalo-for-linux-bin')

depends=(
    'electron22-bin'
    'glibc'
    'hicolor-icon-theme'
    'python'
    'opus'
    'libpulse'
    'alsa-utils'
    'pipewire'
    'rtkit'
)

makedepends=(
    'git' 'nodejs' 'npm'
    '7zip' 'rust' 'wget'
)

optdepends=(
    'wl-clipboard: paste images from clipboard on Wayland'
    'xclip: paste images from clipboard on X11'
    'zenity: call window when the engine is run standalone'
)

options=(!emptydirs !debug)

source=(
    "$pkgname::git+https://github.com/doandat943/zalo-for-linux.git"
    "zalo.sh"
    "zalo.desktop"
)
sha256sums=(
    'SKIP'
    '277f7b54fc65deb7d524537ac73a110c23aab771aabff092d19c114abd305c91'
    '9c692898a06c7d311e1cd2cbe53a4b0a0e5b46a42c69c8320318dce12d48bb47'
)

pkgver() {
    local _src="$srcdir/$pkgname"
    if [[ ! -d $_src/.git ]]; then
        echo 'git source not extracted yet; run makepkg -o first' >&2
        return 1
    fi
    cd "$_src"
    git submodule update --init --recursive >&2
    local _zadark
    _zadark=$(sed -n 's/.*"version": *"\([^"]*\)".*/\1/p' vendor/zadark/package.json | head -1)
    local _zalo
    _zalo=$(git describe --tags --abbrev=0)
    printf '%s+%s.r%s.%s' "$_zalo" "$_zadark" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/$pkgname"
    git submodule update --init --recursive
}

build() {
    cd "$srcdir/$pkgname"
    
    # Zalo version = repo's latest tag, same number as the DMG on zadn.vn
    export ZALO_VERSION="$(git describe --tags --abbrev=0)"
    export ZADARK_VERSION="$(node -p "require('./vendor/zadark/package.json').version")"
    
    # npm >= 12 blocks git deps (crx in zadark's lockfile) — allow-git=all
    # scripts skipped, so fetch sqlite3's N-API v6 prebuilt manually
    export npm_config_allow_git="all"
    npm ci --ignore-scripts --no-audit --no-fund
    (cd node_modules/sqlite3 && npx prebuild-install -r napi)
    
    node scripts/download.js
    node scripts/prepare-zadark.js
    node scripts/prepare-app.js
    node scripts/clean-unused.js
    node scripts/integrate-zadark.js
}

package() {
    cd "$srcdir/$pkgname"
    local _lib="$pkgdir/usr/lib/zalo"
    
    install -d "$_lib" "$_lib/plugins"
    cp -a main.js package.json app plugins "$_lib/"
    cp -a native/engines/zcall "$_lib/zcall-native"
    # gulp leaves the o+w bit on app/pc-dist/zadark; packages must not be world-writable
    chmod -R o-w "$_lib"
    
    install -Dm755 "$srcdir/zalo.sh" "$pkgdir/usr/bin/zalo"
    install -Dm644 "$srcdir/zalo.desktop" "$pkgdir/usr/share/applications/zalo.desktop"
    install -Dm644 app/pc-dist/favicon-512x512.png \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/zalo.png"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
