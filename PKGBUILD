# Maintainer: Sanjaya Danushka <dsanjaya712@gmail.com>
pkgname=neoarch-git
pkgver=3.0.0.r0.g0000000
pkgrel=1
pkgdesc="NeoArch Package Manager for Arch Linux (Lynx Edition — development build, use 'neoarch' for stable)"
arch=('any')
url="https://github.com/Sanjaya-Danushka/Neoarch"
license=('MIT')
depends=('python-pyqt6' 'python-requests' 'python-keyring' 'qt6-svg' 'git' 'flatpak' 'nodejs' 'npm')
makedepends=('git')
provides=('neoarch')
conflicts=('neoarch')
install=neoarch-git.install
source=("git+https://github.com/Sanjaya-Danushka/Neoarch.git#branch=dev")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/Neoarch"
  # .r<count> is monotonic so pacman vercmp always sees newer pushes as
  # upgrades; the hash suffix stays only for traceability.
  local tag rev hash
  tag=$(git describe --tags --abbrev=0 2>/dev/null || echo "3.0.0")
  rev=$(git rev-list --count HEAD 2>/dev/null || echo "0")
  hash=$(git rev-parse --short=7 HEAD 2>/dev/null || echo "0000000")
  printf "%s.r%s.g%s" "$(echo "$tag" | sed 's/^v//;s/-/./g')" "$rev" "$hash"
}

package() {
  cd "$srcdir"
  # Install to /opt/neoarch
  install -d "$pkgdir/opt/neoarch"
  cp -r Neoarch "$pkgdir/opt/neoarch/"
  # Make scripts executable
  chmod +x "$pkgdir/opt/neoarch/Neoarch/scripts/install_arch_deps.sh"
  chmod +x "$pkgdir/opt/neoarch/Neoarch/bin/neoarch.sh"
  chmod +x "$pkgdir/opt/neoarch/Neoarch/scripts/install_desktop_entry.sh"
# Fix entry point reference from aurora_home.py to -m neoarch
  sed -i 's|aurora_home.py|-m neoarch|' "$pkgdir/opt/neoarch/Neoarch/bin/neoarch.sh"
  # CLI on PATH (both the long and short name)
  ln -s /opt/neoarch/NeoArch/bin/neoarch-cli "$pkgdir/usr/bin/neoarch-cli"
  ln -s /opt/neoarch/NeoArch/bin/neoarch-cli "$pkgdir/usr/bin/neo"
  # Install desktop file
  install -Dm644 "$pkgdir/opt/neoarch/Neoarch/packaging/aurora.desktop" "$pkgdir/usr/share/applications/neoarch.desktop"
  sed -i 's|/home/test/New Folder/Aurora|/opt/neoarch/Neoarch|g' "$pkgdir/usr/share/applications/neoarch.desktop"
  sed -i 's|Icon=.*|Icon=neoarch|' "$pkgdir/usr/share/applications/neoarch.desktop"
  # Install icon
  install -Dm644 "$pkgdir/opt/neoarch/Neoarch/assets/icons/app/icon.png" "$pkgdir/usr/share/pixmaps/neoarch.png"
  # Install license
  install -Dm644 "$pkgdir/opt/neoarch/Neoarch/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
