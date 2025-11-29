# Maintainer: Josehpequeno <hicarojbs21@gmail.com>
pkgname=cutieascii
pkgver=0.1.0
pkgrel=2
pkgdesc="Display random cute ASCII art emojis"
arch=('x86_64')
url="https://github.com/Josehpequeno/cutieascii"
license=('MIT')
makedepends=('go')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Josehpequeno/cutieascii/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  # Detect automatically where the files are
  local build_dir
  if [ -f "cutieascii.go" ]; then
    # We are in the local directory (without extraction)
    build_dir="."
    echo "Local mode: using current directory"
  elif [ -d "$srcdir/$pkgname-$pkgver" ]; then
    # We are in AUR after extraction
    build_dir="$srcdir/$pkgname-$pkgver"
    echo "AUR mode: using $build_dir"
  else
    # Try to find any directory with the files
    build_dir=$(find "$srcdir" -name "cutieascii.go" -printf '%h\n' | head -1)
    if [ -n "$build_dir" ]; then
      echo "Auto mode: using $build_dir"
    else
      echo "ERROR: Could not find project files"
      echo "Content of srcdir:"
      ls -la "$srcdir"
      exit 1
    fi
  fi

  cd "$build_dir"
  
  echo "Building in: $(pwd)"
  echo "Available files:"
  ls -la
  
  # Go settings
  export CGO_ENABLED=0
  export GO111MODULE=on
  
  # Build
  echo "Compiling..."
  go build -trimpath -ldflags="-s -w" -o cutieascii .
  
  # Check if the binary was created
  if [ -f "cutieascii" ]; then
    echo "Build completed successfully!"
  else
    echo "ERROR: Binary was not created"
    exit 1
  fi
}

package() {
  # Use the same logic as build to find the files
  local build_dir
  if [ -f "cutieascii.go" ]; then
    build_dir="."
  elif [ -d "$srcdir/$pkgname-$pkgver" ]; then
    build_dir="$srcdir/$pkgname-$pkgver"
  else
    build_dir=$(find "$srcdir" -name "cutieascii.go" -printf '%h\n' | head -1)
  fi

  cd "$build_dir"
  
  echo "Installing package from: $(pwd)"
  
  # Install binary
  install -Dm755 cutieascii "$pkgdir/usr/bin/cutieascii"
  
  # Install data files
  install -Dm644 -t "$pkgdir/usr/share/cutieascii/kaoscii/" kaoscii/*
  
  echo "Installation completed!"
}