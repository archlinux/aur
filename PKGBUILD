# Maintainer: WeeXnes <weexnes@weexnes.dev>

pkgname=ps2_manager
pkgver=4737b74330e8fe93d55c2f9b84ded15865fab21b
pkgrel=3 # Incremented to force fresh package
pkgdesc="A game manager for Open PS2 Loader (OPL)"
arch=('x86_64')
url="https://code.weexnes.dev/projects/18"
license=('MIT')
makedepends=('dotnet-sdk')
source=("${pkgname}-${pkgver}.tar.gz::https://code.weexnes.dev/~downloads/projects/18/archives?revision=${pkgver}&format=tgz")
sha256sums=('ecf7b6775a8b5f6c26b8e040746a6352e7cddb552977e12f8be3f5e5b0509c06')

build() {
  cd "$srcdir/PS2_Manager"

  # Debug: List source directory
  echo "Source directory contents ($srcdir/PS2_Manager):"
  ls -lh "$srcdir/PS2_Manager"

  dotnet publish ./PS2_Manager.csproj \
    -c Release \
    -r linux-x64 \
    --self-contained true \
    -p:PublishSingleFile=true \
    -p:PublishTrimmed=false \
    -o "$srcdir/output_linux"

  # Debug: List output directory
  echo "Output directory contents after build ($srcdir/output_linux):"
  ls -lh "$srcdir/output_linux"
}

package() {
  # Create target directories
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/lib"

  # Debug: List source files before install
  echo "Installing from $srcdir/output_linux:"
  ls -lh "$srcdir/output_linux"

  # Install binary
  install -Dm755 "$srcdir/output_linux/PS2_Manager" "$pkgdir/usr/bin/ps2_manager" || {
    echo "Error: Failed to install PS2_Manager"
    exit 1
  }

  # Install libraries
  install -Dm644 "$srcdir/output_linux/libHarfBuzzSharp.so" "$pkgdir/usr/lib/libHarfBuzzSharp.so" || {
    echo "Error: Failed to install libHarfBuzzSharp.so"
    exit 1
  }
  install -Dm644 "$srcdir/output_linux/libSkiaSharp.so" "$pkgdir/usr/lib/libSkiaSharp.so" || {
    echo "Error: Failed to install libSkiaSharp.so"
    exit 1
  }

  # Debug: List installed files
  echo "Installed files in $pkgdir:"
  ls -lh "$pkgdir/usr/bin"
  ls -lh "$pkgdir/usr/lib"
}
