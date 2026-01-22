# Maintainer: NinjaTech404 <ninjatech404@gmail.com>
pkgname=drawy
_pkgname=drawy
pkgver=0.1.r161.4c42a59
pkgrel=1
pkgdesc="A Qt6-based drawing application with OpenGL support"
arch=('x86_64')
url="https://github.com/NinjaTech404/drawy"
license=('GPL3' 'MIT') # Adjust based on actual license
depends=('qt6-base' 'qt6-declarative' 'glibc' 'gcc-libs')
makedepends=('git' 'cmake' 'ninja' 'qt6-tools' 'qt6-translations')
optdepends=(
  'qt6-wayland: Wayland support'
  'qt6-svg: SVG support'
  'hicolor-icon-theme: For icon theme integration'
)
provides=("$_pkgname")
conflicts=("drawy-git" "$_pkgname")
source=("$_pkgname::git+https://github.com/NinjaTech404/drawy.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"

  # Get version from CMakeLists.txt if available
  if grep -q "project(drawy VERSION" CMakeLists.txt; then
    version=$(grep -oP 'project\(drawy VERSION \K[0-9.]+' CMakeLists.txt)
    printf "%s.r%s.%s" "$version" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  else
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  fi
}

prepare() {
  cd "$_pkgname"

  # Create build directory
  mkdir -p build

  # Fix .desktop file if using template
  if [ -f "deploy/linux/io.github.prayag2.Drawy.desktop.in" ]; then
    sed -i "s|@EXECUTABLE@|drawy|g" deploy/linux/io.github.prayag2.Drawy.desktop.in
    sed -i "s|@ICON@|io.github.prayag2.Drawy|g" deploy/linux/io.github.prayag2.Drawy.desktop.in
  fi

  # Fix metainfo file if needed
  if [ -f "deploy/linux/io.github.prayag2.Drawy.metainfo.xml.in" ]; then
    sed -i "s|@PROJECT_VERSION@|${pkgver%.r*}|g" deploy/linux/io.github.prayag2.Drawy.metainfo.xml.in
  fi
}

build() {
  cd "$_pkgname/build"

  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DQT_VERSION_MAJOR=6 \
    -DBUILD_TESTING=OFF \
    -Wno-dev \
    -G Ninja

  cmake --build . --parallel
}

check() {
  cd "$_pkgname/build"
  # Run tests if any
  # ctest --output-on-failure
}

package() {
  cd "$_pkgname/build"

  # Install using CMake
  DESTDIR="$pkgdir" cmake --install .

  # Fix potential issues with installed files
  if [ -f "$pkgdir/usr/share/applications/io.github.prayag2.Drawy.desktop" ]; then
    # Ensure desktop file has correct exec path
    sed -i "s|Exec=.*|Exec=/usr/bin/drawy|g" "$pkgdir/usr/share/applications/io.github.prayag2.Drawy.desktop"

    # Validate desktop file
    desktop-file-validate "$pkgdir/usr/share/applications/io.github.prayag2.Drawy.desktop"
  fi

  # Install custom desktop file if provided
  if [ -f "$srcdir/drawy.desktop" ]; then
    install -Dm644 "$srcdir/drawy.desktop" "$pkgdir/usr/share/applications/drawy.desktop"
  fi

  # Ensure proper icon installation
  if [ ! -f "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.github.prayag2.Drawy.svg" ] &&
    [ -f "../assets/logo.svg" ]; then
    install -Dm644 ../assets/logo.svg \
      "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.github.prayag2.Drawy.svg"
  fi

  # Create additional icon sizes if needed
  for size in 16 32 48 64 128 256; do
    if [ -f "../assets/logo${size}.png" ]; then
      install -Dm644 "../assets/logo${size}.png" \
        "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/io.github.prayag2.Drawy.png"
    fi
  done

  # Install license if exists
  for license_file in LICENSE LICENCE COPYING; do
    if [ -f "../$license_file" ]; then
      install -Dm644 "../$license_file" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
      break
    fi
  done

  # Install translations
  if [ -d "../translations" ]; then
    find ../translations -name "*.qm" -exec install -Dm644 {} \
      "$pkgdir/usr/share/$_pkgname/translations/$(basename {})" \;
  fi

  # Fix permissions
  find "$pkgdir" -type d -exec chmod 755 {} \;
  find "$pkgdir/usr/bin" -type f -exec chmod 755 {} \;

  # Generate appstream data if not installed
  if [ ! -f "$pkgdir/usr/share/metainfo/io.github.prayag2.Drawy.metainfo.xml" ] &&
    [ -f "../deploy/linux/io.github.prayag2.Drawy.metainfo.xml.in" ]; then
    install -Dm644 ../deploy/linux/io.github.prayag2.Drawy.metainfo.xml.in \
      "$pkgdir/usr/share/metainfo/io.github.prayag2.Drawy.metainfo.xml"
  fi
}
