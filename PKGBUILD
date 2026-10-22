# Maintainer: Kieran David Evans <keyz182 at gmail dot com>

pkgname=rwpm
pkgver=1.20.0
pkgrel=1
pkgdesc='Separate RimWorld profiles, each with its own saves, settings and mod list'
arch=('x86_64')
url='https://github.com/keyz182/rimworld-profile-manager'
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('rust' 'dotnet-sdk')
# The window code loads these at run time, so the linker does not list them.
optdepends=(
  'vulkan-icd-loader: GPU drawing for the app window'
  'libxkbcommon: keyboard input'
  'wayland: Wayland window support'
  'libx11: X11 window support'
  'libxcursor: X11 mouse pointer'
  'libxi: X11 input'
  'libxcb: X11 connection'
  'dbus: desktop dialogs'
)
conflicts=('rwpm-bin')
# !strip: makepkg would strip Valve's libsteam_api.so, which must stay as shipped.
options=('!lto' '!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3b4324d6b253740f0ebfd872bb1a1a85582a62576831a9e08ec5f89dd1663c53')

_src() { echo "$srcdir/rimworld-profile-manager-$pkgver"; }

prepare() {
  cd "$(_src)"
  export CARGO_HOME="$srcdir/cargo-home"
  cargo fetch --locked --target x86_64-unknown-linux-gnu

  export DOTNET_CLI_HOME="$srcdir/dotnet-home" DOTNET_CLI_TELEMETRY_OPTOUT=1 DOTNET_NOLOGO=1
  dotnet restore payload/Rwpm.Payload
  dotnet restore payload/Rwpm.Payload.Hook
}

build() {
  cd "$(_src)"
  export CARGO_HOME="$srcdir/cargo-home" CARGO_TARGET_DIR="$srcdir/target"
  cargo build --frozen --release -p rwpm -p rwpm-steam

  export DOTNET_CLI_HOME="$srcdir/dotnet-home" DOTNET_CLI_TELEMETRY_OPTOUT=1 DOTNET_NOLOGO=1
  dotnet build payload/Rwpm.Payload -c Release --no-restore -o "$srcdir/payload-build"
  dotnet build payload/Rwpm.Payload.Hook -c Release --no-restore -o "$srcdir/hook-build"
}

package() {
  cd "$(_src)"
  export CARGO_HOME="$srcdir/cargo-home"

  # Valve's Steamworks library comes from the pinned steamworks-sys crate, as in
  # scripts/package.sh. rwpm-steam looks for it beside itself.
  local steam_lib
  steam_lib="$(cargo metadata --frozen --format-version 1 --filter-platform x86_64-unknown-linux-gnu |
    python3 -I -c 'import json,sys; print(next(p["manifest_path"] for p in json.load(sys.stdin)["packages"] if p["name"]=="steamworks-sys"))')"
  steam_lib="$(dirname "$steam_lib")/lib/steam/redistributable_bin/linux64/libsteam_api.so"

  # The app finds payload/ and doorstop/ beside its own file, so the bundle stays together.
  install -Dm755 "$srcdir/target/release/rwpm" "$pkgdir/opt/rwpm/rwpm"
  install -Dm755 "$srcdir/target/release/rwpm-steam" "$pkgdir/opt/rwpm/rwpm-steam"
  install -Dm644 "$steam_lib" "$pkgdir/opt/rwpm/libsteam_api.so"
  install -Dm644 "$srcdir/payload-build/Rwpm.Payload.dll" "$pkgdir/opt/rwpm/payload/Rwpm.Payload.dll"
  install -Dm644 "$srcdir/hook-build/Rwpm.Payload.Hook.dll" "$pkgdir/opt/rwpm/payload/Rwpm.Payload.Hook.dll"
  install -Dm644 vendor/unitydoorstop/4.5.0/linux_x64/libdoorstop.so "$pkgdir/opt/rwpm/doorstop/libdoorstop.so"
  install -dm755 "$pkgdir/usr/bin"
  ln -s /opt/rwpm/rwpm "$pkgdir/usr/bin/rwpm"

  for n in 16 32 48 64 128 256; do
    install -Dm644 "crates/rwpm/assets/icon/rwpm-$n.png" "$pkgdir/usr/share/icons/hicolor/${n}x${n}/apps/rwpm.png"
  done
  install -Dm644 crates/rwpm/assets/icon/rwpm.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/rwpm.svg"
  install -Dm644 packaging/linux/rwpm-mime.xml "$pkgdir/usr/share/mime/packages/rwpm.xml"

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/rwpm.desktop" <<'DESKTOP'
[Desktop Entry]
Type=Application
Name=RimWorld Profile Manager
Comment=Separate RimWorld profiles with their own saves, settings and mods
Exec=rwpm %f
Icon=rwpm
Terminal=false
Categories=Game;Utility;
MimeType=application/x-rimrim;application/x-rimpack;
StartupWMClass=rwpm
DESKTOP

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 vendor/unitydoorstop/4.5.0/LICENSE "$pkgdir/usr/share/licenses/$pkgname/UnityDoorstop-LGPL-2.1.txt"
  install -Dm644 licenses/*.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
