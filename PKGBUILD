# Maintainer: fossisawesome <lx bax wp 73 AT moz mail DOT com>
pkgname=firmium-desktop-git
pkgver=2.0.4
pkgrel=1
pkgdesc="Lightning fast OpenSubsonic player in Tauri (git version)"
arch=('x86_64')
url="https://github.com/fossisawesome/firmium"
license=('GPL-3.0-only')
depends=('webkit2gtk-4.1' 'alsa-lib' 'openssl')
makedepends=('base-devel' 'cmake' 'cargo' 'npm' 'nodejs' 'libxcb' 'libxkbcommon' 'git')
provides=('firmium-desktop')
conflicts=('firmium-desktop-bin')
options=('!strip')

source=("git+https://github.com/fossisawesome/firmium.git")
sha256sums=('SKIP')

pkgver() {
  cd "firmium"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "firmium"
  npm install
  npm run build
  npm run tauri build -- --bundles deb
}

package() {
  cd "firmium"

  local tauri_bundle_dir="src-tauri/target/release/bundle/deb"
  local deb_dir=$(find "$tauri_bundle_dir" -maxdepth 1 -type d -name "*_amd64" | head -n 1)

  if [ -z "$deb_dir" ] || [ ! -d "$deb_dir" ]; then
    error "Tauri deb bundle directory not found"
    return 1
  fi

  # Install binary (handles both Firmium and firmium-desktop)
  local binary_path
  if [ -f "$deb_dir/data/usr/bin/firmium-desktop" ]; then
    binary_path="$deb_dir/data/usr/bin/firmium-desktop"
  elif [ -f "$deb_dir/data/usr/bin/Firmium" ]; then
    binary_path="$deb_dir/data/usr/bin/Firmium"
  fi
  [ -n "$binary_path" ] && install -Dm755 "$binary_path" "$pkgdir/usr/bin/firmium-desktop"

  # Install desktop entry (handles both firmium.desktop and Firmium.desktop)
  local desktop_file
  for candidate in "firmium.desktop" "Firmium.desktop"; do
    if [ -f "$deb_dir/data/usr/share/applications/$candidate" ]; then
      desktop_file="$deb_dir/data/usr/share/applications/$candidate"
      break
    fi
  done
  [ -n "$desktop_file" ] && install -Dm644 "$desktop_file" "$pkgdir/usr/share/applications/firmium.desktop"

  # Install icons
  if [ -d "$deb_dir/data/usr/share/icons" ]; then
    find "$deb_dir/data/usr/share/icons" -type f | while read -r icon; do
      install -Dm644 "$icon" "$pkgdir/${icon#$deb_dir/data}"
    done
  fi
}
