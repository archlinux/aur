# Maintainer: ZeppBridge contributors (https://github.com/lingcang728/ZeppBridge)
pkgname=zeppbridge-git
pkgver=3.2.0.r599.g18ce721a
pkgrel=1
pkgdesc='Local-first desktop companion for Amazfit and Zepp health data'
arch=('x86_64')
url='https://github.com/lingcang728/ZeppBridge'
license=('MIT' 'OFL-1.1' 'LicenseRef-MiSans')
depends=(
  'cairo' 'dbus' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3'
  'hicolor-icon-theme' 'libayatana-appindicator' 'libsoup3' 'openssl'
  'webkit2gtk-4.1' 'xdg-utils'
)
makedepends=('git' 'nodejs>=22.12.0' 'npm' 'rust' 'pkgconf')
checkdepends=('desktop-file-utils')
optdepends=('gnome-keyring: Secret Service credential storage, or use another Secret Service provider')
provides=("zeppbridge=${pkgver}")
conflicts=('zeppbridge' 'zeppbridge-bin')
options=('!lto' '!debug')
# The local helper overrides only the source URL, using an isolated snapshot.
# A normal AUR build always fetches committed main, never the frozen v3 branch.
source=("zeppbridge::${ZEPPBRIDGE_SOURCE_URL:-git+https://github.com/lingcang728/ZeppBridge.git#branch=main}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/zeppbridge"
  local version
  version=$(node -p 'JSON.parse(require("fs").readFileSync("package.json", "utf8")).version')
  printf '%s.r%s.g%s' "${version//-/.}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/zeppbridge"
  export RUSTUP_TOOLCHAIN=stable
  # Fetch locked dependencies here; build() itself does not need the network.
  # npm 12 otherwise treats the lockfile's mirror URLs as disallowed remote URLs.
  # Explicitly run the project's patch hook, independent of npm script policy.
  npm ci --ignore-scripts --no-audit --no-fund --replace-registry-host=npmjs
  npm run --if-present postinstall
  cargo fetch --locked --manifest-path src-tauri/Cargo.toml \
    --target "$(rustc -vV | sed -n 's/^host: //p')"
}

build() {
  cd "${srcdir}/zeppbridge"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR="${srcdir}/cargo-target"
  export CARGO_NET_OFFLINE=true
  export ZEPPBRIDGE_BUILD_SHA="${ZEPPBRIDGE_BUILD_SHA:-$(git rev-parse --short HEAD)}"
  # Native pacman packaging: do not invoke deb/rpm/AppImage bundlers or signers.
  npm run tauri -- build --ci --no-bundle --config src-tauri/tauri.linux.conf.json -- --frozen
  cargo build --frozen --release --manifest-path src-tauri/Cargo.toml \
    -p zeppbridge-cli -p zeppbridge-mcp
}

check() {
  cd "${srcdir}/zeppbridge"
  desktop-file-validate packaging/flatpak/com.zeppbridge.app.desktop
  "${srcdir}/cargo-target/release/zeppbridge-cli" version
}

package() {
  cd "${srcdir}/zeppbridge"
  local binary size
  for binary in zeppbridge zeppbridge-cli zeppbridge-mcp; do
    install -Dm755 "${srcdir}/cargo-target/release/${binary}" "${pkgdir}/usr/bin/${binary}"
  done
  install -Dm644 packaging/flatpak/com.zeppbridge.app.desktop \
    "${pkgdir}/usr/share/applications/com.zeppbridge.app.desktop"
  install -Dm644 packaging/flatpak/com.zeppbridge.app.metainfo.xml \
    "${pkgdir}/usr/share/metainfo/com.zeppbridge.app.metainfo.xml"
  for size in 32 64 128; do
    install -Dm644 "src-tauri/icons/${size}x${size}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/com.zeppbridge.app.png"
  done
  install -Dm644 src-tauri/icons/128x128@2x.png \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/com.zeppbridge.app.png"
  install -Dm644 src-tauri/icons/icon.png \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/com.zeppbridge.app.png"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 src/assets/fonts/LICENSE-inter.txt \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-inter.txt"
  install -Dm644 src/assets/fonts/LICENSE-misans.txt \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-misans.txt"
}
