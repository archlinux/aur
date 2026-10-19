# Maintainer: Ait contributors <https://github.com/ait-app/ait>

pkgname=ait-git
pkgver=0.1.9.r648.g808b9bc
pkgrel=1
pkgdesc='Local-first multi-agent manager with an Electron desktop and Rust daemon (Git main)'
arch=('x86_64')
url='https://github.com/ait-app/ait'
license=('Apache-2.0')
depends=(
  'alsa-lib' 'at-spi2-core' 'bash' 'cairo' 'coreutils' 'dbus' 'expat'
  'libgcc' 'libstdc++' 'git' 'glib2' 'glibc' 'grep' 'gtk3' 'hicolor-icon-theme'
  'libcups' 'libnotify' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext'
  'libxfixes' 'libxkbcommon' 'libxrandr' 'libx11' 'mesa' 'nspr' 'nss'
  'pango' 'systemd-libs' 'util-linux' 'xdg-utils'
)
makedepends=('rust' 'nodejs>=22.22.2' 'npm' 'python' 'cmake' 'clang' 'pkgconf')
optdepends=(
  'libsecret: desktop credential storage'
  'org.freedesktop.secrets: Secret Service provider for credential storage'
)
provides=("ait=${pkgver}")
conflicts=('ait')
# GCC LTO objects in native Rust dependencies cannot be linked by Rust's lld.
options=('!strip' '!debug' '!lto')
source=("ait::git+${url}.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/ait"
  local version
  version="$(node -p "require('./package.json').version")"
  printf '%s.r%s.g%s' "${version//-/.}" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

_build_env() {
  export npm_config_cache="$srcdir/npm-cache"
  export ELECTRON_CACHE="$srcdir/electron-cache"
  export ELECTRON_BUILDER_CACHE="$srcdir/electron-builder-cache"
  export CARGO_TARGET_DIR="$srcdir/target"
  export AIT_SERVER_BIN="$CARGO_TARGET_DIR/release/daemon"
  export CI=1 EXPO_NO_TELEMETRY=1
}

prepare() {
  cd "$srcdir/ait"
  _build_env
  npm ci --no-audit --no-fund
  cargo fetch --locked --target x86_64-unknown-linux-gnu
}

build() {
  cd "$srcdir/ait"
  _build_env
  cargo build --locked --release -p daemon --bin daemon
  npm run build:desktop-assets
  node apps/desktop/scripts/prepare-daemon.mjs
  npm run build:main --workspace=@ait/desktop
  # Build the app directory; pacman supplies the installer.
  cd apps/desktop
  npm exec -- electron-builder --config electron-builder.yml --linux --x64 --dir --publish never
}

package() {
  local app="$srcdir/ait/apps/desktop/release/linux-unpacked"

  install -dm755 "$pkgdir/usr/lib/ait" "$pkgdir/usr/bin"
  cp -a --no-preserve=ownership "$app/." "$pkgdir/usr/lib/ait/"
  chmod 4755 "$pkgdir/usr/lib/ait/chrome-sandbox"
  ln -s /usr/lib/ait/Ait "$pkgdir/usr/bin/ait"
  install -Dm644 "$srcdir/ait/packaging/aur/ait-bin/ait.desktop" \
    "$pkgdir/usr/share/applications/ait.desktop"
  install -Dm644 "$app/resources/icon.png" \
    "$pkgdir/usr/share/pixmaps/ait.png"
  install -Dm644 "$srcdir/ait/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  ln -s /usr/lib/ait/LICENSE.electron.txt \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.electron.txt"
  ln -s /usr/lib/ait/LICENSES.chromium.html \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSES.chromium.html"
}
