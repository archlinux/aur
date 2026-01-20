# Maintainer: Igilq <igorwisnia@ik.me>

pkgname=goguma-git
pkgver=r1361.cdf1c19
pkgrel=1
pkgdesc="An IRC client for mobile devices"
arch=('x86_64')
url="https://codeberg.org/emersion/goguma"
license=('AGPL-3.0-only')

depends=(
  'gtk3'
  'libnotify'
)
makedepends=(
  'git'
  'flutter'
  'cmake'
  'ninja'
)

source=("git+https://codeberg.org/emersion/goguma.git")
sha256sums=('SKIP')
options=('!strip')

pkgver() {
  cd "$srcdir/goguma"
  printf "r%s.%s" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/goguma"

  flutter config --no-analytics --enable-linux-desktop
  flutter pub get
}

build() {
  cd "$srcdir/goguma"

  # Let Flutter do its normal build; ignore the /usr/local install failure.
  flutter build linux --release -v || true

  # Reconfigure CMake to install into a local bundle dir.
  cmake -S linux -B build/linux/x64/release \
        -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX="$PWD/build/linux/x64/release/bundle"

  cmake --build build/linux/x64/release --config Release
  cmake --install build/linux/x64/release --config Release

  if [[ ! -d build/linux/x64/release/bundle ]]; then
    echo "Error: bundle not found after CMake install"
    return 1
  fi
}

package() {
  cd "$srcdir/goguma"

  # Install bundle under /usr/lib/goguma
  install -dm755 "$pkgdir/usr/lib/goguma"
  cp -r build/linux/x64/release/bundle/* "$pkgdir/usr/lib/goguma/"

  # Wrapper script
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/goguma" << 'EOF'
#!/bin/sh
exec /usr/lib/goguma/goguma "$@"
EOF

  # Desktop file
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/goguma.desktop" << 'EOF'
[Desktop Entry]
Name=Goguma
Comment=IRC client for mobile devices
Exec=goguma
Icon=goguma
Terminal=false
Type=Application
Categories=Network;Chat;GTK;
StartupWMClass=goguma
EOF

  # App icon: reuse the largest iOS app icon
  install -Dm644 \
    "ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-1024x1024@1x.png" \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/goguma.png"
}
