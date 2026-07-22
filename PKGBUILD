# Maintainer: voidbornfr <discordrishab@gmail.com>
pkgname=void-files
pkgver=1.0.0
pkgrel=2
pkgdesc="A minimal file manager for Wayland/Niri with Python PyQt6 GUI and Go TUI"
arch=('x86_64')
url="https://github.com/voidbornfr/void-files"
license=('MIT')
depends=('python' 'python-pyqt6' 'qt6-svg' 'glibc')
makedepends=('go' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'git')
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

  # 2. Build Python wheel (if pyproject.toml is present)
  cd "$srcdir/$pkgname"
  if [ -f "pyproject.toml" ] || [ -f "setup.py" ]; then
    python -m build --wheel --no-isolation
  fi
}

package() {
  cd "$pkgname"

  # 1. Install compiled Go binary to /usr/bin/
  install -Dm755 "go-tui/void-files-tui" "$pkgdir/usr/bin/void-files-tui"

  # 2. Install Python Component
  if [ -d "dist" ] && [ -n "$(ls -A dist/*.whl 2>/dev/null)" ]; then
    python -m installer --destdir="$pkgdir" dist/*.whl
  else
    install -Dm755 "void-files-gui.py" "$pkgdir/usr/bin/void-files-gui"
  fi

  # 3. Install License
  if [ -f "LICENSE" ]; then
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi

  # Fix permissions on Go module cache so makepkg/yay cleanup succeeds
  chmod -R u+w "${srcdir}/gopath" 2>/dev/null || true
}
