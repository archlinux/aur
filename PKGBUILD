# Maintainer: Ryno Kotze <lemon.xah@gmail.com>
pkgname=pithddu-dashboard
pkgver=0.7.10
pkgrel=1
pkgdesc="SimHub companion app for the Pith DDU sim-racing dash"
arch=('x86_64')
url="https://github.com/lemonxah/pithddu"
license=('BSD-3-Clause')
# The Slint renderer is statically linked into the binary; only the winit/GL +
# HID/serial (libudev) runtime libs are needed.
depends=('fontconfig' 'freetype2' 'libxkbcommon' 'wayland' 'libglvnd' 'systemd-libs')
makedepends=('cargo' 'git' 'pkgconf')
provides=("pith-dashboard=$pkgver")
conflicts=('pithddu-dashboard-bin')
# Built from the monorepo at its dashboard-v tag — firmware/ (the shared headers +
# field-registry JSON the build reads) is a subdir there, so no submodule dance.
# The prebuilt Windows shm tools come from the same release.
source=("$pkgname::git+$url.git#tag=dashboard-v$pkgver"
        "pith-shm-tools-$pkgver.zip::$url/releases/download/dashboard-v$pkgver/pith-shm-tools-win64.zip")
sha256sums=('SKIP'
            'SKIP')

prepare() {
  cd "$srcdir/$pkgname"
  # Stamp the package version into the dashboard crate.
  sed -i -E "0,/^version = \".*\"/s//version = \"$pkgver\"/" dashboard/Cargo.toml
  export CARGO_HOME="$srcdir/cargo-home"
  cargo fetch --locked || cargo fetch
}

build() {
  cd "$srcdir/$pkgname"
  export CARGO_HOME="$srcdir/cargo-home"
  cargo build --release --offline -p pith-dashboard
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 target/release/pith-dashboard "$pkgdir/usr/bin/pith-dashboard"
  install -Dm644 dashboard/pith-dashboard.desktop "$pkgdir/usr/share/applications/pith-dashboard.desktop"
  install -Dm644 dashboard/icon.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/pith-dashboard.png"
  install -Dm644 dashboard/99-pithddu.rules "$pkgdir/usr/lib/udev/rules.d/99-pithddu.rules"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # In-prefix shared-memory tools (prebuilt Windows .exe, run under Proton/Wine) +
  # the Steam launch wrapper, from the matching dashboard release.
  cd "$srcdir/pith-shm-tools-win64"
  install -Dm644 pith-shim.exe "$pkgdir/usr/share/pithddu/pith-shim.exe"
  install -Dm644 pith-shmbridge.exe "$pkgdir/usr/share/pithddu/pith-shmbridge.exe"
  install -Dm755 pith-shim-run "$pkgdir/usr/bin/pith-shim-run"
}
