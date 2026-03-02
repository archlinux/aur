# Maintainer: Dae Euhwa <daedaevibin@naver.com>
pkgname=meshiji-git
pkgver=1.1.0
pkgrel=1
pkgdesc="A modern, cross-platform file explorer built with Flutter"
arch=('x86_64')
url="https://github.com/Veridian-Zenith/meshiji"
license=('OSL-3.0')
depends=('gtk3' 'libx11' 'libxext' 'libxfixes' 'libxi' 'libxrandr' 'libxrender' 'libxtst' 'xz')
makedepends=('git' 'cmake' 'ninja' 'pkgconf' 'clang' 'fvm')
optdepends=()
provides=('meshiji')
conflicts=('meshiji')
source=("git+https://github.com/Veridian-Zenith/meshiji.git#tag=v${pkgver}")
sha256sums=('SKIP')

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

  # Install the executable
  install -Dm755 "build/linux/x64/release/bundle/meshiji" "$pkgdir/usr/bin/meshiji"

  # Install the application library
  install -Dm755 "build/linux/x64/release/bundle/lib/libapp.so" "$pkgdir/usr/lib/meshiji/libapp.so"
  install -Dm755 "build/linux/x64/release/bundle/lib/libflutter_linux_gtk.so" "$pkgdir/usr/lib/meshiji/libflutter_linux_gtk.so"

  # Install data files
  install -Dm644 "build/linux/x64/release/bundle/data/icudtl.dat" "$pkgdir/usr/share/meshiji/icudtl.dat"

  # Install Flutter assets
  mkdir -p "$pkgdir/usr/share/meshiji/flutter_assets"
  cp -r "build/linux/x64/release/bundle/data/flutter_assets/"* "$pkgdir/usr/share/meshiji/flutter_assets/"

  # Create desktop entry
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/meshiji.desktop" <<EOF
[Desktop Entry]
Name=Meshiji
Comment=A modern, cross-platform file explorer
Exec=meshiji
Icon=meshiji
Terminal=false
Type=Application
Categories=Utility;FileManager;
StartupNotify=true
EOF

  # Create icon symlink (using a generic file manager icon for now)
  mkdir -p "$pkgdir/usr/share/icons/hicolor/256x256/apps"
  ln -sf /usr/share/icons/hicolor/256x256/apps/system-file-manager.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/meshiji.png"

  # Create documentation
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/meshiji/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/doc/meshiji/LICENSE"
}

# vim:set ts=2 sw=2 et:
