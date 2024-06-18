# Maintainer: Felipe Alfonso Gonzalez <f.alfonso@res-ear.ch>
pkgname=profilex
pkgver=0.0.3
pkgrel=1
pkgdesc="ProFileX is a Linux file management tool with a Qt-based GUI."
arch=('x86_64')
url="https://github.com/felipealfonsog/ProFileX"
license=('BSD')
depends=('gcc' 'qt5-base')

source=("https://github.com/felipealfonsog/ProFileX/archive/refs/tags/v.${pkgver}.tar.gz")

sha256sums=('39d090e2aae7ba20e7efaa7e840578171b0b969464689cb57bf3c948d061ff4d')

build() {
  cd "$srcdir/ProFileX-v.${pkgver}"

  # Run qmake to generate Makefile based on proFileX.pro
  qmake proFileX.pro

  # Compile the project using make
  make
}

package() {
  cd "$srcdir/ProFileX-v.${pkgver}"

  # Ensure the build directory exists and change into it
  mkdir -p build
  cd build || exit 1

  # Run qmake to generate Makefile based on proFileX.pro
  qmake ../proFileX.pro

  # Compile the project using make
  make

  # Create necessary directories for the package structure
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/applications"
  mkdir -p "$pkgdir/usr/share/doc/$pkgname"

  # Install the executable to the package directory
  install -Dm755 proFileX "$pkgdir/usr/bin/proFileX"

  # Install license and README
  install -Dm644 "$srcdir/ProFileX-v.${pkgver}/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"

  # Create desktop entry
  cat <<EOF > "$pkgdir/usr/share/applications/proFileX.desktop"
[Desktop Entry]
Version=1.0
Type=Application
Name=ProFileX
Comment=A Linux file management tool with a Qt-based GUI
Exec=proFileX
Icon=applications-utilities
Terminal=false
Categories=Utility;
EOF
}

