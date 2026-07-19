# Maintainer: Doodcom <a.munro87@icloud.com>
# Build from a local checkout:
#   cd packaging && makepkg -si
# For AUR publishing the source line points at the GitHub release tag.

pkgname=vortex-v2
pkgver=1.0.0
pkgrel=1
pkgdesc="System updater and tuner suite for CachyOS (updates, sched-ext, snapshots, cleaner)"
arch=('x86_64')
url="https://github.com/Doodcom/vortex-v2"
license=('MIT')
depends=('nss' 'libxtst' 'libxss' 'gtk3' 'mesa' 'alsa-lib')
makedepends=('git' 'nodejs' 'npm')
optdepends=(
  'fwupd: device firmware updates in the Updater'
  'snapper: pre-upgrade Btrfs snapshots'
  'ufw: firewall view'
  'paru: AUR update checks and builds'
  'pacman-contrib: checkupdates + paccache for update checks and cache cleaning'
  'scx-scheds: sched-ext schedulers for the Scheduler view and Game Mode'
  'power-profiles-daemon: power profile switching'
  'docker: container view'
  'flatpak: flatpak management in Packages'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Doodcom/vortex-v2/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d97c7ce2ba29e28d82b8fd93c14d51f91f95743edb083cf97362a6df1c41d1af')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  npm ci --legacy-peer-deps
  npm run build
  # dir target produces release/linux-unpacked with natives rebuilt for the bundled Electron
  npx electron-builder --linux dir
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # App payload
  install -d "$pkgdir/opt/$pkgname"
  cp -r release/linux-unpacked/. "$pkgdir/opt/$pkgname/"
  chmod 4755 "$pkgdir/opt/$pkgname/chrome-sandbox"

  # Launcher with the same GPU/Wayland flags electron-builder bakes into its own targets
  install -d "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/$pkgname" <<'EOF'
#!/usr/bin/env bash
exec "/opt/vortex-v2/vortex-v2" \
  --ozone-platform-hint=auto \
  --enable-features=VaapiVideoDecodeLinuxGL,UseOzonePlatform,WaylandWindowDecorations \
  --use-gl=egl \
  --enable-gpu-rasterization \
  "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/$pkgname"

  # Desktop entry + icons
  install -Dm644 packaging/$pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  for size in 128 256 512; do
    install -Dm644 "build/icons/${size}x${size}.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/$pkgname.png"
  done

  # Polkit rule: one auth per maintenance run instead of one per pkexec call
  install -Dm644 resources/polkit/49-vortex.rules "$pkgdir/etc/polkit-1/rules.d/49-vortex.rules"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
