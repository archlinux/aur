pkgname=openwork-git
pkgver=openwrk.v0.11.34.2.gc1f4f19
pkgrel=1
pkgdesc="Open-source alternative to Claude Cowork (Tauri desktop app)"
arch=("x86_64")
url="https://github.com/different-ai/openwork"
license=("MIT")
depends=("glibc" "gtk3" "webkit2gtk-4.1" "libsoup3" "libappindicator-gtk3" "librsvg" "glib2" "cairo" "pango" "gdk-pixbuf2" "openssl" "zstd")
makedepends=("git" "nodejs" "pnpm" "rust" "cargo" "clang" "pkg-config" "glib2" "cairo" "pango" "gdk-pixbuf2" "openssl" "zstd" "perl")
provides=("openwork")
conflicts=("openwork")
source=("git+https://github.com/different-ai/openwork.git" "openwork.desktop")
sha256sums=("SKIP" "SKIP")
options=('!lto')

pkgver() {
  cd "$srcdir/openwork"
  git describe --long --tags --abbrev=7 | sed "s/^v//;s/-/./g"
}

_sanitize_env() {
  export PATH="/usr/bin:/usr/sbin:/bin:/sbin:/home/cc/.bun/bin"
  unset PKG_CONFIG_PATH PKG_CONFIG_LIBDIR PKG_CONFIG_SYSROOT_DIR
  unset LD_LIBRARY_PATH LIBRARY_PATH CPATH C_INCLUDE_PATH CPLUS_INCLUDE_PATH
  unset RUSTFLAGS CARGO_ENCODED_RUSTFLAGS
  
  # Remove Nix pollution
  local var
  for var in $(env | grep -o '^NIX_[^=]*'); do
    unset "$var"
  done
  
  export PKG_CONFIG=/usr/bin/pkg-config
  export CC=/usr/bin/cc
  export CXX=/usr/bin/c++
  export AR=/usr/bin/ar
  export NM=/usr/bin/nm
  export RANLIB=/usr/bin/ranlib
  
  # Force BFD linker to avoid LLD issues with static archives
  export RUSTFLAGS="-C link-arg=-fuse-ld=bfd"
  export LDFLAGS=""
}

prepare() {
  _sanitize_env
  cd "$srcdir/openwork"
  pnpm install --frozen-lockfile
}

build() {
  _sanitize_env
  cd "$srcdir/openwork"
  export ZSTD_SYS_USE_PKG_CONFIG=1
  
  cd packages/desktop
  pnpm tauri build --no-bundle
}

package() {
  _sanitize_env
  cd "$srcdir/openwork"
  local _target="packages/desktop/src-tauri/target/release"
  local _triple=$(rustc -vV | sed -n 's/host: //p')
  
  install -Dm755 "${_target}/openwork" "$pkgdir/usr/bin/openwork"
  
  # Install sidecars with triple suffix as expected by Tauri
  install -m755 "${_target}/opencode" "$pkgdir/usr/bin/opencode-${_triple}"
  install -m755 "${_target}/openwork-server" "$pkgdir/usr/bin/openwork-server-${_triple}"
  install -m755 "${_target}/openwrk" "$pkgdir/usr/bin/openwrk-${_triple}"
  install -m755 "${_target}/owpenbot" "$pkgdir/usr/bin/owpenbot-${_triple}"
  
  install -Dm644 "$srcdir/openwork.desktop" "$pkgdir/usr/share/applications/openwork.desktop"
  install -Dm644 packages/desktop/src-tauri/icons/icon.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/openwork.png"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
