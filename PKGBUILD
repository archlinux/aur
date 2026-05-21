# Maintainer: ArchStore Contributors <https://github.com/0x5t4l1n/AURHub>

pkgname=archstore-git
_pkgname=AURHub
pkgver=1.0.0.r7.ca081b4
pkgrel=1
pkgdesc="Classic Arch Linux package manager client combining pacman and AUR"
arch=('x86_64')
url="https://github.com/0x5t4l1n/AURHub"
license=('GPL-3.0-only')
depends=(
  'python'
  'python-fastapi'
  'python-uvicorn'
  'python-httpx'
  'python-aiosqlite'
  'python-pydantic'
  'xdg-utils'
  'polkit'
)
optdepends=(
  'yay: Arch User Repository (AUR) helper support (recommended)'
  'paru: Alternative AUR helper support'
)
makedepends=('git' 'nodejs' 'npm')
provides=('archstore')
conflicts=('archstore')
source=(
  "git+https://github.com/0x5t4l1n/AURHub.git"
  "archstore-launcher"
  "archstore.desktop"
  "archstore.png"
)
sha256sums=(
  'SKIP'
  '54d93c22dfe45f14645a599ee10f811af5d5b3e411208cda70011aea1e174d4c'
  '95d6872ed5d5b39ff731730591a7503cbaf7479e69e31e4b19ce261fd1ba2f20'
  'cb2e0f2399ac56ad3368ae9875648d8c6c525be65c6c325da639cb95a9ed7a27'
)

pkgver() {
  cd "$srcdir/$_pkgname"
  if git describe --long --tags >/dev/null 2>&1; then
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
  else
    printf "1.0.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  fi
}

prepare() {
  cd "$srcdir/$_pkgname/frontend"
  npm ci || npm install
}

build() {
  cd "$srcdir/$_pkgname/frontend"
  npm run build
}

package() {
  cd "$srcdir/$_pkgname"

  # Install system directories
  install -d "$pkgdir/usr/share/archstore/backend"
  install -d "$pkgdir/usr/share/archstore/frontend"

  # Copy backend scripts (excluding caching database files and python pycache folder)
  cp -r backend/* "$pkgdir/usr/share/archstore/backend/"
  rm -f "$pkgdir/usr/share/archstore/backend/archstore.db"
  find "$pkgdir/usr/share/archstore/backend" -name "__pycache__" -type d -exec rm -rf {} +

  # Copy compiled frontend assets
  cp -r frontend/dist/* "$pkgdir/usr/share/archstore/frontend/"

  # Install binary launcher
  install -Dm755 "$srcdir/archstore-launcher" "$pkgdir/usr/bin/archstore"

  # Install system application shortcut
  install -Dm644 "$srcdir/archstore.desktop" "$pkgdir/usr/share/applications/archstore.desktop"

  # Install application icon
  install -Dm644 "$srcdir/archstore.png" "$pkgdir/usr/share/pixmaps/archstore.png"

  # Install standard package license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
