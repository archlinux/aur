# Maintainer: Adiker (https://aur.archlinux.org/account/Adiker)
# Unofficial native Epic Games Launcher Preview; upstream binaries are unmodified.
pkgname=epic-games-launcher-proton-bin
pkgver=0.99.0
pkgrel=1
_epic_gitrev=bf52ace
pkgdesc='Native Epic Games Launcher Preview with per-game Proton selection'
arch=('x86_64')
url='https://github.com/Adiker/egl-arch'
license=('MIT' 'LicenseRef-Proprietary')
depends=(
  'bash' 'cairo' 'coreutils' 'dbus' 'dconf' 'gawk' 'gdk-pixbuf2' 'glib2'
  'glibc' 'gtk3' 'gtk4' 'hicolor-icon-theme' 'libadwaita'
  'libayatana-appindicator' 'libgcc' 'libnotify' 'libsoup3' 'libstdc++'
  'libx11' 'systemd' 'util-linux' 'webkit2gtk-4.1' 'xdg-utils'
)
makedepends=('rust' 'squashfs-tools' 'patchelf')
checkdepends=('desktop-file-utils')
provides=("epic-games-launcher=$pkgver")
conflicts=('epic-games-launcher' 'epic-games-launcher-bin')
# Preserve Epic's ELF bytes, debug information and original RUNPATHs.
options=('!strip' '!debug')
source=(
  "EpicGamesLauncher-${pkgver}+g${_epic_gitrev}-${CARCH}.AppImage::https://content-download-egs.distro.on.epicgames.com/Builds/EGLv2/${pkgver}%2Bg${_epic_gitrev}/Linux/EpicGamesLauncher-${CARCH}.AppImage"
  "https://github.com/Adiker/egl-arch/releases/download/v${pkgver}-${pkgrel}/egl-arch-sources-${pkgver}-${pkgrel}.tar.xz"
)
noextract=("EpicGamesLauncher-${pkgver}+g${_epic_gitrev}-${CARCH}.AppImage")
sha256sums=(
  'ac96fc4ccca97842497f866726627fdf4f98b8faffc89baabbb1823b9fe231ac'
  'd32a7e7bc7e87934ccbc3e0664c3abe38d71218eac2ee5cbc6749f1e8fea3a68' # port sources
)

prepare() {
  local image="EpicGamesLauncher-${pkgver}+g${_epic_gitrev}-${CARCH}.AppImage"
  local offset
  offset=$(LC_ALL=C readelf -h "$image" | awk '
    /Start of section headers/ {s = $5}
    /Size of section headers/ {z = $5}
    /Number of section headers/ {n = $5}
    END {print s + z * n}')
  [[ $offset =~ ^[1-9][0-9]*$ ]]
  rm -rf -- "$srcdir/appdir"
  unsquashfs -q -no-xattrs -o "$offset" -d appdir "$image" \
    usr/bin/EpicGamesLauncher usr/lib/libEOSSDK-Linux-Shipping.so \
    usr/lib/epic-games-launcher usr/share/icons
  grep -aqF "EpicGamesLauncher/${pkgver}+g${_epic_gitrev}" appdir/usr/bin/EpicGamesLauncher

  cd egl-arch/proton-gui
  export CARGO_HOME="$srcdir/cargo-home"
  cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
  cd egl-arch
  tray/build.sh tray-build
  cd proton-gui
  export CARGO_HOME="$srcdir/cargo-home"
  cargo build --release --offline --locked
}

check() {
  cd egl-arch
  tests/proton-hook-test.sh
  tests/launcher-wrapper-test.sh
  export CARGO_HOME="$srcdir/cargo-home"
  cargo test --manifest-path proton-gui/Cargo.toml --release --offline --locked
  desktop-file-validate data/applications/*.desktop
}

package() {
  local epic="$pkgdir/opt/epic-games-launcher"
  install -Dm755 appdir/usr/bin/EpicGamesLauncher "$epic/bin/EpicGamesLauncher"
  install -Dm755 appdir/usr/lib/libEOSSDK-Linux-Shipping.so "$epic/lib/libEOSSDK-Linux-Shipping.so"
  install -dm755 "$epic/lib/epic-games-launcher"
  cp -a appdir/usr/lib/epic-games-launcher/. "$epic/lib/epic-games-launcher/"
  chmod 755 "$epic/lib/epic-games-launcher/libEOSSDK-Linux-Shipping.so"
  local icon
  for icon in appdir/usr/share/icons/hicolor/*/apps/EpicGamesLauncher.png; do
    install -Dm644 "$icon" "$pkgdir/usr/share/${icon#appdir/usr/share/}"
  done

  cd egl-arch
  install -Dm755 libexec/egl-launch "$pkgdir/usr/bin/epic-games-launcher"
  ln -s epic-games-launcher "$pkgdir/usr/bin/EpicGamesLauncher"
  local script
  for script in egl-proton-hook egl-proton-router; do
    install -Dm755 "libexec/$script" "$pkgdir/usr/lib/epic-games-launcher/$script"
  done
  install -Dm755 proton-gui/target/release/egl-proton "$pkgdir/usr/bin/egl-proton"
  install -Dsm755 tray-build/libayatana-appindicator3.so.1 \
    "$pkgdir/usr/lib/epic-games-launcher/tray/libayatana-appindicator3.so.1"
  local unit
  for unit in data/systemd/user/*; do
    install -Dm644 "$unit" "$pkgdir/usr/lib/systemd/user/${unit##*/}"
  done
  local desktop
  for desktop in data/applications/EpicGamesLauncher.desktop data/applications/io.github.dxvsi.EglProton.desktop; do
    install -Dm644 "$desktop" "$pkgdir/usr/share/applications/${desktop##*/}"
  done
  # Native Wayland lookup uses EpicGamesLauncher.desktop. Keep the former ID
  # as a hidden alias so existing pinned launchers and MIME associations work.
  sed '/^Type=Application$/a NoDisplay=true' data/applications/EpicGamesLauncher.desktop \
    > "$pkgdir/usr/share/applications/epic-games-launcher.desktop"
  chmod 644 "$pkgdir/usr/share/applications/epic-games-launcher.desktop"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$epic/lib/epic-games-launcher/resources/ThirdPartyNotices.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/ThirdPartyNotices.txt"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 docs/arch-port.md "$pkgdir/usr/share/doc/$pkgname/arch-port.md"
}
