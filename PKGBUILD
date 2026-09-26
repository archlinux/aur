# Maintainer: Robin Trioux <robin@trioux.eu>

# Maintainer: Robin

pkgname=webots-git
pkgver=nightly.24.9.2026.r15777.g87fcc4222a
pkgrel=1
pkgdesc="Open-source robot simulator (development version)"
arch=('x86_64')
url="https://cyberbotics.com/"
license=('Apache-2.0')

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
)

makedepends=(
  'git'
  'make'
  'gcc'
  'jdk17-openjdk'
  'python'
  'swig'
  'wget'
  'patchelf'
)

optdepends=(
  'matlab: MATLAB controller support'
  'espeak: Text-to-speech for some robots'
  'ffmpeg: Video recording'
)

provides=('webots')
conflicts=('webots' 'webots-bin')

source=(
  'git+https://github.com/cyberbotics/webots.git'
)

sha256sums=('SKIP')

options=('!strip')

pkgver() {
  cd "$srcdir/webots"

  local tag
  tag=$(git describe --tags --abbrev=0 2>/dev/null || echo unknown)
  tag="${tag#v}"
  tag=$(printf '%s' "$tag" | sed 's/[_-]/./g; s/[^[:alnum:].]//g')

  printf '%s.r%s.g%s\n' \
    "$tag" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/webots"

  git submodule update --init --recursive
}

build() {
  cd "$srcdir/webots"

  export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
  export PATH="$JAVA_HOME/bin:$PATH"
  export WEBOTS_HOME="$PWD"

  make -j"$(nproc)"
}

package() {
  cd "$srcdir/webots"

  #
  # Directory structure
  #
  # /usr/share/webots/
  # ├── webots              <- upstream launcher
  # ├── bin/webots-bin      <- actual executable
  # ├── lib/webots/         <- private libraries
  # ├── resources/
  # ├── projects/
  # ├── include/
  # └── scripts/
  #
  # /usr/bin/webots         <- symlink to upstream launcher
  #

  install -d "$pkgdir/usr/share/webots"
  install -d "$pkgdir/usr/bin"

  #
  # Webots data
  #
  cp -a lib "$pkgdir/usr/share/webots/"
  cp -a resources "$pkgdir/usr/share/webots/"
  cp -a projects "$pkgdir/usr/share/webots/"
  cp -a include "$pkgdir/usr/share/webots/"
  cp -a scripts "$pkgdir/usr/share/webots/"

  #
  # Actual Webots executable
  #
  install -Dm755 bin/webots-bin "$pkgdir/usr/share/webots/bin/webots-bin"

  #
  # Fix the build-tree RUNPATH embedded by Webots.
  #
  # From:
  #   /home/robin/AUR/webots-git/src/webots/lib/webots
  #
  # To:
  #   $ORIGIN/../lib/webots
  #
  patchelf \
    --set-rpath '$ORIGIN/../lib/webots' \
    "$pkgdir/usr/share/webots/bin/webots-bin"

  #
  # IMPORTANT:
  # Install the upstream launcher itself.
  #
  # It calculates:
  #
  #   webots_home="$(dirname "$(readlink -f "$0")")"
  #
  # Therefore it must live inside /usr/share/webots.
  #
  install -Dm755 \
    webots \
    "$pkgdir/usr/share/webots/webots"

  #
  # Public command.
  #
  ln -s \
    /usr/share/webots/webots \
    "$pkgdir/usr/bin/webots"

  #
  # Desktop entry
  #
  install -Dm644 \
    scripts/packaging/webots.desktop \
    "$pkgdir/usr/share/applications/webots.desktop"

  sed -i \
    -e 's|^Exec=.*|Exec=webots|' \
    -e 's|^Icon=.*|Icon=webots|' \
    "$pkgdir/usr/share/applications/webots.desktop"

  #
  # Icons
  #
  install -Dm644 \
    resources/icons/core/webots.png \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/webots.png"

  install -Dm644 \
    resources/images/webots.png \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/webots.png"

  #
  # Qt configuration
  #
  if [[ -f bin/qt.conf ]]; then
    install -Dm644 \
      bin/qt.conf \
      "$pkgdir/usr/share/webots/bin/qt.conf"
  fi
}
