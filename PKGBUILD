# Maintainer: Mauro Druwel <mauro.druwel@gmail.com>
pkgname=hackatime-desktop-git
_pkgname=hackatime-desktop
pkgver=1.7.5.r0.g832a610
pkgrel=1
pkgdesc="A desktop client for Hackatime"
arch=('x86_64')
url="https://github.com/hackclub/hackatime-desktop"
license=('MIT')
depends=('gtk3' 'webkit2gtk-4.1')
makedepends=('git' 'nodejs>=24' 'pnpm' 'rust' 'cargo' 'git-lfs' 'ccache')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("git+${url}.git" "0001-remove-menu.patch" "0002-enable-window-transparency.patch" "hackatime-desktop.desktop")
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')
optdepends=('libayatana-appindicator: system tray support'
            'libappindicator-gtk3: alternative system tray support'
            'gnome-shell-extension-appindicator: system tray support in GNOME (my choice)')

pkgver() {
  cd "$_pkgname"
  # Use git describe for version based on tags (e.g., app-v1.7.5), falling back to commit count/hash
  git describe --long --tags 2>/dev/null | sed 's/^app-v//;s/\([^-]*-g\)/r\1/;s/-/./g' || printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"
  
  # Pull Git LFS files (all png's are stored in LFS)
  git remote set-url origin "${url}.git"
  git lfs install --local
  git lfs pull
  
  # Apply the patches (remove ugly white menu bar and fix white corners)
  git apply "$srcdir/0001-remove-menu.patch"
  git apply "$srcdir/0002-enable-window-transparency.patch"
  
  # Prevent pnpm from writing to your actual home directory during the build
  export PNPM_HOME="$srcdir/.pnpm-home"
  export PATH="$PNPM_HOME:$PATH"
  
  pnpm install
}

build() {
  cd "$_pkgname"
  
  export PNPM_HOME="$srcdir/.pnpm-home"
  export PATH="$PNPM_HOME:$PATH"
  
  # Speed up builds with parallel jobs and ccache
  export MAKEFLAGS="-j$(nproc)"
  export RUSTC_WRAPPER=ccache
  export CCACHE_DIR="$srcdir/.ccache"
  
  # Arch Linux optimization flags
  export CFLAGS+=" -ffat-lto-objects"
  
  # Build the production binary
  pnpm tauri build --no-bundle
}

package() {
  cd "$_pkgname"

  # 1. Binary
  install -Dm755 "src-tauri/target/release/desktop" "$pkgdir/usr/bin/hackatime-desktop"

  # 2. Desktop Entry (for app launchers)
  install -Dm644 "$srcdir/hackatime-desktop.desktop" "$pkgdir/usr/share/applications/hackatime-desktop.desktop"

  # 3. Icons (standard sizes)
  local icon_sizes=(32 128 256 512)
  for size in "${icon_sizes[@]}"; do
    if [ -f "src-tauri/icons/${size}x${size}.png" ]; then
      install -Dm644 "src-tauri/icons/${size}x${size}.png" \
        "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/hackatime-desktop.png"
    fi
  done
  
  # 4. License
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}