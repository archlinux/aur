# Maintainer: Amir Husayn Panahifar <Panahifar.ah@outlook.com>

pkgname=carburetor-rc-git
pkgver=x.y.z
pkgrel=1
pkgdesc="Graphical settings app for Tractor in GTK (latest Git version)"
arch=('any')
url="https://framagit.org/tractor/carburetor"
license=('GPL-3.0-or-later')
depends=(
  'python'
  'python-gobject'
  'gtk4'
  'libadwaita'
  'tractor-rc-git'
  'python-pycountry'
)
makedepends=(
  'meson'
  'ninja'
  'python-build'
  'python-setuptools'
  'python-installer'
  'python-wheel'
  'git'
)
source=("git+https://framagit.org/tractor/carburetor.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/carburetor" || exit 1
  git describe --tags --long --always | sed -E 's/^v//;s/-/./g;s/[^a-zA-Z0-9.]/_/g'
}

build() {
  echo "🔧 Starting the build process..."
  cd "$srcdir/carburetor" || exit 1
  meson setup build --prefix=/usr || {
    echo "❌ Meson setup failed. Please check the error output above."
    exit 1
  }
  meson compile -C build || {
    echo "❌ Compilation failed. Please check the error output above."
    exit 1
  }
  echo "✅ Build completed successfully."
}

package() {
  echo "📦 Installing the package..."
  cd "$srcdir/carburetor" || exit 1
  DESTDIR="$pkgdir" meson install -C build || {
    echo "❌ Installation failed. Please check the error output above."
    exit 1
  }
  install -Dm644 "build/data/io.frama.tractor.carburetor.desktop" \
    "$pkgdir/usr/share/applications/io.frama.tractor.carburetor.desktop"
  install -Dm644 "build/data/io.frama.tractor.carburetor.metainfo.xml" \
    "$pkgdir/usr/share/metainfo/io.frama.tractor.carburetor.metainfo.xml"
  echo "🎨 Installing icons..."
  for size in 16 24 32 48 64 128 256 scalable; do
    if [ -f "build/data/icons/${size}/apps/io.frama.tractor.carburetor.svg" ]; then
      install -Dm644 "build/data/icons/${size}/apps/io.frama.tractor.carburetor.svg" \
        "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/io.frama.tractor.carburetor.svg"
    fi
  done
  echo "🎉 Package installation completed successfully!"
}
