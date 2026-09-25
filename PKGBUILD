# Maintainer: Robin
pkgname=webots-git
pkgver=nightly.24.9.2026
pkgrel=1
pkgdesc="Open-source robot simulator (git version)"
arch=(x86_64)
url="https://cyberbotics.com/"
license=(Apache)
groups=()
options=('!strip' '!debug')
install=webots.install
depends=(
  'glibc'
  'gcc-libs'
  'libx11'
  'libxext'
  'libxi'
  'libxcb'
  'libxrandr'
  'libxrender'
  'libgl'
  'glu'
  'mesa'
  'openal'
  'libjpeg-turbo'
  'libpng'
  'zlib'
  'freetype2'
  'fontconfig'
  'xcb-util'
  'xcb-util-cursor'
  'xcb-util-keysyms'
  'xcb-util-image'
  'xcb-util-renderutil'
  'xcb-util-wm'
  'libxkbcommon'
  'libxkbcommon-x11'
  'qt6-base'
  'qt6-declarative'
  'qt6-svg'
  'qt6-xcb-private-headers'
  'qt6-wayland'
)
makedepends=(
  'git'
  'make'
  'gcc'
  'jdk17-openjdk'
  'python'
  'swig'
  'wget'
)
optdepends=(
  'python: Python controller support'
  'matlab: MATLAB controller support'
  'espeak: Text-to-speech for some robots'
  'ffmpeg: Video recording'
)
provides=("webots=${pkgver}")
conflicts=('webots')
source=("git+https://github.com/cyberbotics/webots.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/webots"
  # Try to get version from git tags
  local ver
  if ver=$(git describe --tags --abbrev=0 2>/dev/null); then
    # Sanitize version: remove v prefix, replace _ and - with ., remove other invalid chars
    echo "$(echo "$ver" | sed 's/^v//;s/[_-]/./g;s/[^a-zA-Z0-9.]//g')"
  else
    # Fallback to date
    echo "$(date +%Y%m%d)"
  fi
}

prepare() {
  cd "$srcdir/webots"
  # Initialize submodules
  git submodule update --init --recursive
}

build() {
  cd "$srcdir/webots"

  # Set Java environment
  export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
  export PATH="$JAVA_HOME/bin:$PATH"
  export WEBOTS_HOME=$(pwd)

  # Build Webots
  make -j"$(nproc)" release
}

package() {
  cd "$srcdir/webots"

  # Create destination directories
  install -d "$pkgdir/usr/share/webots"
  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/share/applications"
  install -d "$pkgdir/usr/share/icons/hicolor/256x256/apps"
  install -d "$pkgdir/usr/share/icons/hicolor/128x128/apps"

  # Copy Webots files
  cp -r lib "$pkgdir/usr/share/webots/"
  cp -r include "$pkgdir/usr/share/webots/"
  cp -r resources "$pkgdir/usr/share/webots/"
  cp -r projects "$pkgdir/usr/share/webots/"
  cp -r docs "$pkgdir/usr/share/webots/"
  cp -r scripts "$pkgdir/usr/share/webots/"

  # Install the actual binary
  install -Dm755 bin/webots-bin "$pkgdir/usr/share/webots/bin/webots-bin"

  # Create a simple wrapper script that sets up the environment correctly
  cat > "$pkgdir/usr/bin/webots" << 'EOF'
#!/bin/bash
export WEBOTS_HOME=/usr/share/webots
export LD_LIBRARY_PATH="/usr/share/webots/lib/webots:${LD_LIBRARY_PATH}"
export QT_PLUGIN_PATH="/usr/share/webots/lib/webots/qt/plugins"
export QT_QPA_PLATFORM="xcb"
exec /usr/share/webots/bin/webots-bin "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/webots"

  # Install desktop file
  install -Dm644 scripts/packaging/webots.desktop "$pkgdir/usr/share/applications/webots.desktop"
  # Fix desktop file paths
  sed -i "s|Exec=webots|Exec=/usr/bin/webots|" "$pkgdir/usr/share/applications/webots.desktop"
  sed -i "s|Icon=/usr/local/webots/resources/icons/core/webots.png|Icon=/usr/share/webots/resources/icons/core/webots.png|" "$pkgdir/usr/share/applications/webots.desktop"

  # Install icons
  install -Dm644 resources/icons/core/webots.png \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/webots.png"
  install -Dm644 resources/images/webots.png \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/webots.png"

  # Install Qt configuration
  if [ -f bin/qt.conf ]; then
    install -Dm644 bin/qt.conf "$pkgdir/usr/share/webots/qt.conf"
    # Fix paths in qt.conf
    sed -i "s|^Prefix = .*|Prefix = /usr/share/webots|" "$pkgdir/usr/share/webots/qt.conf"
  fi
}
