# Maintainer: Dae Euhwa <daedaevibin@naver.com>
pkgname=meshiji
pkgver=1.2.0
pkgrel=1
pkgdesc="A modern, flutter-based file explorer"
arch=('x86_64')
url="https://github.com/Veridian-Zenith/meshiji"
license=('OSL-3.0')
depends=('gtk3' 'libx11' 'libxext' 'libxfixes' 'libxi' 'libxrandr' 'libxrender' 'libxtst' 'xz')
makedepends=('git' 'cmake' 'ninja' 'pkgconf' 'clang' 'fvm')
optdepends=()
provides=('meshiji')
conflicts=('meshiji')
source=("git+https://github.com/Veridian-Zenith/meshiji.git#tag=v${pkgver}")
sha256sums=('fa2ab3da2fe0daef81b684290248a60a4d1d4f2116fd1549df6ac947b3db2d56')

prepare() {
  cd "$srcdir/meshiji"

  # Install FVM and set up Flutter
  fvm install stable
  fvm global stable

  # Install Flutter dependencies using FVM
  fvm flutter pub get
}

build() {
  cd "$srcdir/meshiji"

  # Enable Linux desktop support using FVM
  fvm flutter config --enable-linux-desktop

  # Build the application using FVM
  fvm flutter build linux --release
}

package() {
  cd "$srcdir/meshiji"

  # Create a directory for meshiji binary + libraries
  mkdir -p "$pkgdir/usr/bin/meshiji"

  # Install the executable and required libraries in the same dir
  install -Dm755 "build/linux/x64/release/bundle/meshiji" "$pkgdir/usr/bin/meshiji/meshiji"
  install -Dm755 "build/linux/x64/release/bundle/lib/libapp.so" "$pkgdir/usr/bin/meshiji/libapp.so"
  install -Dm755 "build/linux/x64/release/bundle/lib/libflutter_linux_gtk.so" "$pkgdir/usr/bin/meshiji/libflutter_linux_gtk.so"

  # Install data files
  mkdir -p "$pkgdir/usr/share/meshiji"
  install -Dm644 "build/linux/x64/release/bundle/data/icudtl.dat" "$pkgdir/usr/share/meshiji/icudtl.dat"

  # Flutter assets
  mkdir -p "$pkgdir/usr/share/meshiji/flutter_assets"
  cp -r "build/linux/x64/release/bundle/data/flutter_assets/"* "$pkgdir/usr/share/meshiji/flutter_assets/"

  # Desktop entry
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/meshiji.desktop" <<EOF
[Desktop Entry]
Name=Meshiji
Comment=A modern, flutter-based file explorer
Exec=/usr/bin/meshiji/meshiji
Icon=meshiji
Terminal=false
Type=Application
Categories=Utility;FileManager;
StartupNotify=true
EOF

  # Icon
  mkdir -p "$pkgdir/usr/share/icons/hicolor/256x256/apps"
  ln -sf /usr/share/icons/hicolor/256x256/apps/system-file-manager.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/meshiji.png"

  # Documentation
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/meshiji/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/doc/meshiji/LICENSE"
}

# vim:set ts=2 sw=2 et:
