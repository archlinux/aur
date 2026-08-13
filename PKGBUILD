# Maintainer: ChHsiching <https://aur.archlinux.org/account/ChHsich>
# Source-build package. CI (update-packaging.yml) rewrites pkgver/sha256sums.

pkgname=bongo-cat-todo
pkgver=1.3.1
pkgrel=1
pkgdesc="Tauri 2 desktop pet cat with a todo list and mail notifier (fork of BongoCat, source build)"
arch=(x86_64 aarch64)
url="https://github.com/ChHsiching/bongocat-todo"
license=(MIT)
depends=(
  webkit2gtk-4.1
  gtk3
  gdk-pixbuf2
  libsoup3
  hicolor-icon-theme
)
makedepends=(
  base-devel
  cargo
  nodejs
  pnpm
  webkit2gtk-4.1
)
provides=(bongo-cat-todo)
conflicts=(bongo-cat-todo-bin bongo-cat-todo-git)
# options=(!lto) is a no-op for Rust crates (cargo's [profile.release] lto
# governs Rust LTO; makepkg's option only affects C/C++). Omitted intentionally.

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
# sha256sums rewritten by CI at release time.
sha256sums=('1e58d8be2a304bc3b4ed2cae2d810b88d9496cb5b47f51e604dd6a6bcb7071a7')

prepare() {
  cd "$srcdir/bongocat-todo-$pkgver"
  # Pre-fetch Rust deps using the workspace Cargo.lock (root Cargo.toml has
  # [workspace] members = ["src-tauri"]). Per Arch Rust package guidelines.
  # --target restricts to the build arch; --locked honors Cargo.lock exactly.
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$srcdir/bongocat-todo-$pkgver"
  # makepkg.conf injects -flto=auto into CFLAGS/CXXFLAGS. The `ring` crate
  # (pulled in by rustls in the mail plugin) compiles C/asm via the `cc` crate
  # which reads CFLAGS. LTO bitcode objects from ring's C core produce
  # "undefined symbol: ring_core_*" at link time with ld.lld. Strip -flto
  # from the compiler flags to fix this. See:
  # https://github.com/rust-lang/rust/issues/142752
  export CFLAGS="${CFLAGS//-flto=auto/}"
  export CXXFLAGS="${CXXFLAGS//-flto=auto/}"
  # Full Tauri build: pnpm install -> beforeBuildCommand (pnpm build / vite,
  # produces dist/) -> cargo build --release (tauri-build reads dist/ via
  # frontendDist). --no-bundle skips .deb/.rpm/.appimage; we only want the
  # raw binary.
  pnpm install --frozen-lockfile
  pnpm tauri build --no-bundle
}

package() {
  cd "$srcdir/bongocat-todo-$pkgver"

  # Release binary (Tauri bin name = "bongo-cat", from Cargo.toml [package].name).
  # The repo has a workspace Cargo.toml at the root, so cargo emits the release
  # binary into the workspace-root target/ (NOT src-tauri/target/). This matches
  # release.yml's rust-cache `workspaces: target` setting.
  install -Dm755 "target/release/bongo-cat" \
    "$pkgdir/usr/bin/bongo-cat-todo"

  # .desktop
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/bongo-cat-todo.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=BongoCat Todo
Exec=bongo-cat-todo
Icon=bongo-cat-todo
Categories=Entertainment;Utility;
Comment=Tauri 2 desktop pet cat with a todo list and mail notifier
StartupWMClass=BongoCat Todo
Terminal=false
EOF

  # Icons
  install -Dm644 "src-tauri/icons/128x128.png" \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/bongo-cat-todo.png"
  install -Dm644 "src-tauri/icons/128x128@2x.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/bongo-cat-todo.png"
  install -Dm644 "src-tauri/icons/icon.png" \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/bongo-cat-todo.png"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
