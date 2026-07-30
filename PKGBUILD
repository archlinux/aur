pkgname=orca-sofriendly-git
pkgver=0.3.15.r0.g0d0301c
pkgrel=1
pkgdesc='Visual Git client with an integrated terminal for AI coding assistants (git version)'
arch=('x86_64' 'aarch64')
url='https://github.com/SoFriendly/orca'
license=('MIT')
depends=(
  'git'
  'gtk3'
  'libayatana-appindicator'
  'libgit2'
  'libssh2'
  'libx11'
  'openssl'
  'sqlite'
  'webkit2gtk-4.1'
  'xdg-utils'
)
makedepends=(
  'cargo'
  'cmake'
  'npm'
  'pkgconf'
)
provides=('orca-sofriendly')
conflicts=('orca-sofriendly')
options=('!lto')
source=(
  "$pkgname::git+$url.git"
  'linux-crate-type.patch'
  'system-libs.patch'
  'linux-x11.patch'
  'disable-self-updater.patch'
  'orca-sofriendly.desktop'
  'orca-sofriendly.xml'
)
sha256sums=(
  'SKIP'
  'cdef6e48d0997d3da567472e8a0912b4fb10bfdb0a5bbf55f8d5786349f698ed'
  'ad131638d7c1f342d7997d6b038f0d1aed6987cda40b823d93022673828f684b'
  'd4d73482ceb6901942935c66b79ff13d029b7d34267261a5d4af9262aa6ee027'
  'cf2a604c6322a84253185125612ffdd6cd675317c30cf7df3ee776d14e1fd407'
  '6072b928c27f30a70f54bf6106103d0e510e4e0f9dc3c10d999e18f0a844219d'
  '0eb3e0bbc4f08d029b00e22abf9f252aada1afa9a61b4988bea2be97f2f7bf7b'
)

pkgver() {
  cd "$pkgname"

  git describe --long --tags --abbrev=7 2>/dev/null |
    sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
  cd "$pkgname"

  patch -Np1 -i "$srcdir/linux-crate-type.patch"
  patch -Np1 -i "$srcdir/system-libs.patch"
  patch -Np1 -i "$srcdir/linux-x11.patch"
  patch -Np1 -i "$srcdir/disable-self-updater.patch"

  npm ci --cache "$srcdir/npm-cache"

  export CARGO_HOME="$srcdir/cargo-home"
  local rust_target
  rust_target="$(rustc -vV | sed -n 's/^host: //p')"
  # Reconcile the upstream lockfile after disabling vendored-only features.
  cargo fetch \
    --manifest-path src-tauri/Cargo.toml \
    --target "$rust_target"
}

build() {
  cd "$pkgname"

  export CARGO_HOME="$srcdir/cargo-home"
  export CARGO_TARGET_DIR="$srcdir/target"
  export LIBGIT2_NO_VENDOR=1
  export LIBSSH2_SYS_USE_PKG_CONFIG=1
  export RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=$srcdir=/usr/src/debug/$pkgbase"
  unset LDFLAGS

  npm run tauri -- build \
    --ci \
    --no-bundle \
    -- \
    --frozen
}

package() {
  cd "$pkgname"

  install -Dm755 "$srcdir/target/release/orca" \
    "$pkgdir/usr/bin/orca-sofriendly"

  install -Dm644 src-tauri/icons/32x32.png \
    "$pkgdir/usr/share/icons/hicolor/32x32/apps/orca-sofriendly.png"
  install -Dm644 src-tauri/icons/128x128.png \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/orca-sofriendly.png"
  install -Dm644 src-tauri/icons/128x128@2x.png \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/orca-sofriendly.png"
  install -Dm644 src-tauri/icons/icon.png \
    "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/orca-sofriendly.png"

  install -Dm644 "$srcdir/orca-sofriendly.desktop" \
    "$pkgdir/usr/share/applications/orca-sofriendly.desktop"
  install -Dm644 "$srcdir/orca-sofriendly.xml" \
    "$pkgdir/usr/share/mime/packages/orca-sofriendly.xml"
  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
