# Maintainer: WeeXnes <weexnes@weexnes.dev>

pkgname=ps2_manager
pkgver=4737b74330e8fe93d55c2f9b84ded15865fab21b
pkgrel=3
pkgdesc="A game manager for Open PS2 Loader (OPL)"
arch=('x86_64')
url="https://code.weexnes.dev/projects/18"
license=('MIT')
makedepends=('dotnet-sdk')
depends=()
options=('!strip')  # prevent breaking self-contained dotnet binary

source=("${pkgname}-${pkgver}.tar.gz::https://code.weexnes.dev/~downloads/projects/18/archives?revision=${pkgver}&format=tgz")
sha256sums=('ecf7b6775a8b5f6c26b8e040746a6352e7cddb552977e12f8be3f5e5b0509c06')

build() {
  cd "$srcdir/PS2_Manager"

  dotnet publish ./PS2_Manager.csproj \
    -c Release \
    -r linux-x64 \
    --self-contained true \
    -p:PublishSingleFile=true \
    -p:PublishTrimmed=true \
    -o "$srcdir/output_linux"

  echo "Output directory contents after build:"
  ls -lh "$srcdir/output_linux"
}

package() {
  install -Dm755 "$srcdir/output_linux/PS2_Manager" "$pkgdir/usr/bin/ps2_manager" || {
    echo "Error: Failed to install PS2_Manager"
    exit 1
  }

  install -Dm644 "$srcdir/output_linux/libHarfBuzzSharp.so" "$pkgdir/usr/lib/libHarfBuzzSharp.so" || {
    echo "Error: Failed to install libHarfBuzzSharp.so"
    exit 1
  }

  install -Dm644 "$srcdir/output_linux/libSkiaSharp.so" "$pkgdir/usr/lib/libSkiaSharp.so" || {
    echo "Error: Failed to install libSkiaSharp.so"
    exit 1
  }
}
