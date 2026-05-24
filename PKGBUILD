# Maintainer: fossisawesome <lx bax wp 73 AT moz mail DOT com>
pkgname=firmium-desktop-git
pkgver=1.4.0
pkgrel=1
pkgdesc="Lightning fast OpenSubsonic player in Tauri (git version)"
arch=('x86_64')
url="https://github.com/fossisawesome/firmium"
license=('GPL-3.0-only')
depends=('webkit2gtk-4.1' 'alsa-lib' 'openssl')
makedepends=('cargo' 'npm' 'nodejs' 'libxdo' 'libxcb' 'libxcb-render' 'libxcb-shape' 'libxcb-xfixes' 'git')
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
  npm run tauri build -- --bundles deb
}

package() {
  cd "firmium"

  local tauri_bundle_dir="src-tauri/target/release/bundle/deb"
  local deb_dir=$(find "$tauri_bundle_dir" -maxdepth 1 -type d -name "firmium-desktop*" | head -n 1)

  if [ -z "$deb_dir" ] || [ ! -d "$deb_dir" ]; then
    error "Tauri deb bundle directory not found"
    return 1
  fi

  # Install binary
  install -Dm755 "$deb_dir/data/usr/bin/firmium-desktop" "$pkgdir/usr/bin/firmium-desktop"

  # Install desktop entry
  install -Dm644 "$deb_dir/data/usr/share/applications/Firmium.desktop" "$pkgdir/usr/share/applications/Firmium.desktop"

  # Install icons
  find "$deb_dir/data/usr/share/icons" -type f | while read -r icon; do
    install -Dm644 "$icon" "$pkgdir/${icon#$deb_dir/data}"
  done
}