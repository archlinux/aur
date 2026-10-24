# Maintainer: ArjixWasTaken <me@arjix.dev>

pkgname=penguin-engine-git
_pkgname=penguin-engine
pkgver=0.1.0.r0.g0000000
pkgrel=1
pkgdesc="Animated desktop wallpapers for Wayland: plays Wallpaper Engine wallpapers"
arch=('x86_64')
url="https://github.com/ArjixWasTaken/penguin-engine"
license=('GPL-2.0-only')
depends=(
  'alsa-lib'
  'cairo'
  'dbus'
  'fontconfig'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gst-plugins-bad-libs'
  'gst-plugins-base-libs'
  'gstreamer'
  'gtk3'
  'libgcc'
  'libglvnd'
  'libpulse'
  'libsoup3'
  'libstdc++'
  'mpv'
  'vulkan-icd-loader'
  'wayland'
  'webkit2gtk-4.1'
  'zlib'
)
makedepends=('cargo' 'clang' 'git' 'nodejs' 'pnpm' 'python')
optdepends=(
  'steam: Wallpaper Engine, whose assets and workshop wallpapers are played'
  'vulkan-driver: GPU rendering'
  'mesa: video and web frames handed to the GPU without a copy (EGL)'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!lto')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  local version
  version=$(sed -n 's/^version = "\(.*\)"/\1/p' Cargo.toml | head -n1)
  printf '%s.r%s.g%s' "$version" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
  pnpm -C apps/penguin-engine/ui install --frozen-lockfile
}

build() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  pnpm -C apps/penguin-engine/ui build
  cargo build --frozen --release -p penguind -p penguinctl -p penguin-engine
}

check() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --release -p wpe-ipc -p penguinctl
}

package() {
  cd "$_pkgname"
  install -Dm755 target/release/{penguind,penguinctl,penguin-engine} -t "$pkgdir/usr/bin/"
  install -Dm644 systemd/penguin-engine.{service,socket} -t "$pkgdir/usr/lib/systemd/user/"
  sed -i 's|^ExecStart=.*|ExecStart=/usr/bin/penguind|' \
    "$pkgdir/usr/lib/systemd/user/penguin-engine.service"
  install -Dm644 packaging/dev.arjix.penguin-engine.desktop -t "$pkgdir/usr/share/applications/"
  install -Dm644 apps/penguin-engine/icons/icon.png \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/dev.arjix.penguin-engine.png"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
