# Maintainer: voidbornfr 
pkgname=void-files
pkgver=1.0.0
pkgrel=12
pkgdesc="A minimal file manager for Wayland/Niri with Python PyQt6 GUI and Go TUI"
arch=('x86_64')
url="https://github.com/voidbornfr/void-files"
license=('MIT')
depends=('python' 'python-pyqt6' 'qt6-svg' 'glibc')
makedepends=('go' 'git')
source=("$pkgname::git+$url.git#branch=main")
sha256sums=('SKIP')

prepare() {
  cd "$pkgname"

  # Isolated Go module cache to prevent downloading during build()
  export GOPATH="${srcdir}/gopath"
  export GOMODCACHE="${srcdir}/gopath/pkg/mod"
  export GOFLAGS="-modcacherw"

  go mod download
}

build() {
  cd "$pkgname"

  # Standard Arch Linux CGO and Go flags
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -mod=readonly -modcacherw"

  # 1. Compile Go TUI binary
  export GOPATH="${srcdir}/gopath"
  export GOMODCACHE="${srcdir}/gopath/pkg/mod"
  
  cd "$srcdir/$pkgname/go-tui"
  go build \
    -ldflags "-compressdwarf=false -linkmode=external" \
    -o void-files-tui .
}

package() {
  cd "$pkgname"

  # 1. Install compiled Go binary to /usr/bin/
  install -Dm755 "go-tui/void-files-tui" "$pkgdir/usr/bin/void-files-tui"

  # 2. Install Python GUI script directly to /usr/bin/void-files-gui
  install -Dm755 "void-files-gui.py" "$pkgdir/usr/bin/void-files-gui"

  # 3. Install Single Desktop Entry for App Launcher
  if [ -f "void-files.desktop" ]; then
    install -Dm644 "void-files.desktop" "$pkgdir/usr/share/applications/void-files.desktop"
  fi

  # 4. Install Application Icon across standard icon themes
  if [ -f "assests/icon.png" ]; then
    install -Dm644 "assests/icon.png" "$pkgdir/usr/share/pixmaps/void-files.png"
    for sz in 512x512 256x256 128x128 64x64 48x48; do
      install -Dm644 "assests/icon.png" "$pkgdir/usr/share/icons/hicolor/$sz/apps/void-files.png"
    done
  fi

  # 5. Install License
  if [ -f "LICENSE" ]; then
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi

  # Fix permissions on Go module cache so makepkg/yay cleanup succeeds
  chmod -R u+w "${srcdir}/gopath" 2>/dev/null || true
}
