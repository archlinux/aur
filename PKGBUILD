# Maintainer: Your Name <you@example.com>

pkgname=roboclaw-studio-git
pkgver=0.1.0.r56.g1332bc1
pkgrel=1
pkgdesc="Unofficial Linux GUI for Basicmicro RoboClaw motor controllers, inspired by Motion Studio. Features motor control, telemetry, simulation, and frequency response analysis."
arch=('x86_64')
url="https://github.com/lazytatzv/motion_studio"
license=('MIT')
depends=('webkit2gtk' 'gtk3')
makedepends=('git' 'nodejs' 'pnpm' 'rust')
source=("${pkgname}::git+https://github.com/lazytatzv/motion_studio.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "0.1.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  pnpm install --frozen-lockfile
  pnpm tauri build --bundles deb
}

package() {
  cd "$srcdir/$pkgname"

  local deb_path
  deb_path=(src-tauri/target/release/bundle/deb/roboclaw-studio_*.deb)
  bsdtar -xf "$deb_path" -C "$pkgdir"

  # Extract payload from data.tar.*
  local data_tar
  data_tar=$(find "$pkgdir" -maxdepth 1 -type f -name 'data.tar.*' | head -n 1)
  if [ -n "$data_tar" ]; then
    bsdtar -xf "$data_tar" -C "$pkgdir"
  fi

  # Cleanup deb container artifacts
  rm -f "$pkgdir"/control.tar.* "$pkgdir"/data.tar.* "$pkgdir"/debian-binary

  # Provide a stable binary name
  if [ -x "$pkgdir/usr/bin/motion_studio" ]; then
    ln -sfn motion_studio "$pkgdir/usr/bin/roboclaw-studio"
  fi

  # Override desktop entry (optional)
  install -Dm644 packaging/aur/motion-studio.desktop \
    "$pkgdir/usr/share/applications/roboclaw-studio.desktop"

}
