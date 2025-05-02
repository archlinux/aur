# Maintainer: StaringLongingly
pkgname=hyprland-dynamic-border-git
pkgver=r5.g687c0b7
pkgrel=1
pkgdesc="Dynamic border color based on visuals in Hyprland using hyprctl"
url="https://github.com/StaringLongingly/hyprland-dynamic-border"
arch=("x86_64")
license=("MIT")
depends=("rust" "hyprland")
makedepends=("git" "cargo")
provides=("hyprland-dynamic-border")
conflicts=("hyprland-dynamic-border")
source=("git+https://github.com/StaringLongingly/hyprland-dynamic-border.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/hyprland-dynamic-border" || {
    echo "Failed to enter source directory" >&2
    echo "r0.g0000000" # Ensure we return a valid version string
    return 0
  }
  
  echo "Current directory: $(pwd)" >&2
  echo "Git status: $(git status 2>&1)" >&2
  
  # Try first method - git describe
  local ver
  ver=$(git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' 2>/dev/null)
  
  # Check if first method worked
  if [ -n "$ver" ]; then
    echo "Using git describe version: $ver" >&2
    echo "$ver"
    return 0
  fi
  
  # Try second method - commit count and hash
  echo "Git describe failed, trying commit count method" >&2
  local count hash
  count=$(git rev-list --count HEAD 2>/dev/null || echo "0")
  hash=$(git rev-parse --short=7 HEAD 2>/dev/null || echo "0000000")
  
  ver="r${count}.g${hash}"
  echo "Using fallback version: $ver" >&2
  echo "$ver"
}

build() {
  cd "$srcdir/hyprland-dynamic-border"
  cargo build --release --locked
}

package() {
  cd "$srcdir/hyprland-dynamic-border"
  install -Dm755 target/release/hyprland-dynamic-border -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
