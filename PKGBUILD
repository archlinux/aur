pkgname=uptater
pkgver=1.0.1.3
pkgrel=1
pkgdesc="Clean, robust GUI for managing Arch Linux packages and AUR updates"
arch=('x86_64')
license=('GPL3')
options=('!debug') # This prevents the creation of the uptater-debug package
url="https://github.com/gytdoo/uptater"

# Tools needed only for building
makedepends=('cmake' 'qt6-tools' 'pkgconf')
# Tools needed to actually run the app
depends=('qt6-base' 'qtermwidget' 'pacman-contrib' 'curl')
optdepends=('reflector: for mirrorlist management')

provides=('uptater')
conflicts=('uptater-bin' 'uptater-git')

# Pulls the exact source code tarball for your vX.X.X release
source=("$pkgname-$pkgver.tar.gz::https://github.com/gytdoo/uptater/archive/refs/tags/v${pkgver}.tar.gz")

# Generate this by running: updpkgsums
sha256sums=('182701a699f44acccec25a0aec78221d8182041d8b3d2d2aaa0dcaf598b38916')

build() {
  # Configure the CMake project inside the downloaded source folder
  cmake -B build -S "$pkgname-$pkgver" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr

  # Compile the code
  cmake --build build
}

package() {
  cd "$pkgname-$pkgver"

  # Install the compiled binary from the build directory
  install -Dm755 "../build/uptater" "${pkgdir}/usr/bin/uptater"

  # Install the launcher and icon from the source directory
  install -Dm644 "uptater.desktop" "${pkgdir}/usr/share/applications/uptater.desktop"
  install -Dm644 "icon.png" "${pkgdir}/usr/share/pixmaps/uptater.png"
}
