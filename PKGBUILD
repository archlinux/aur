# Maintainer: jarh4x <fernando@cachyos.com>
pkgname=waybardynamictheme-git
_pkgname=WaybarDynamicTheme
pkgver=4.0.r1.g4b53406 # Placeholder, updated via pkgver()
pkgrel=1
pkgdesc="Dynamic Waybar theme based on wallpaper tones with Zero-Loss layout switching"
arch=('any')
url="https://github.com/JADRT22/WaybarDynamicTheme"
license=('MIT')
depends=('swww' 'rofi-wayland' 'waybar' 'wallust' 'swaync' 'cava' 'hyprland' 'bash')
makedepends=('git')
provides=('waybardynamictheme')
conflicts=('waybardynamictheme')
source=("git+https://github.com/JADRT22/WaybarDynamicTheme.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  # Try to find a tag, fallback to commit count
  git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' || 
  printf "4.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_pkgname"

  # 1. Install all assets, templates, and scripts to /usr/share/waybardynamictheme
  mkdir -p "$pkgdir/usr/share/waybardynamictheme"
  cp -r * "$pkgdir/usr/share/waybardynamictheme/"
  
  # 2. Create the system-wide binary link
  mkdir -p "$pkgdir/usr/bin"
  ln -sf /usr/share/waybardynamictheme/scripts/WaybarTheme.sh "$pkgdir/usr/bin/waybardynamictheme"
  
  # 3. Create helper alias for legacy/expected scripts (if needed)
  # Keeping it simple with 'waybardynamictheme' for now.
  
  # 4. License
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
