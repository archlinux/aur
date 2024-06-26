# Maintainer:
# Contributor: bjin <bjin@ctrl-d.org>
# Contributor: Alynx Zhou <alynx.zhou@gmail.com>

## links
# https://gyroflow.xyz
# https://github.com/gyroflow/gyroflow

_pkgname="gyroflow"
pkgname="$_pkgname-git"
pkgver=1.5.4.r283.gd6622f2
pkgrel=2
pkgdesc="Video stabilization using gyroscope data"
url="https://github.com/gyroflow/gyroflow"
license=("GPL-3.0-or-later")
arch=("x86_64")

depends=(
  'ffmpeg'
  'libc++'
  'ocl-icd'
  'opencv'
  'qt6-declarative'
)
makedepends=(
  'cargo'
  'clang'
  'git'
  'opencl-headers'
  'p7zip'
)
optdepends=(
  'opencl-driver: OpenCL driver for GPU accelerated stabilization'
  'libva-mesa-driver: VAAPI video acceleration for NVIDIA and AMD GPU'
  'intel-media-driver: VAAPI video acceleration for Intel GPU'
)

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

options=(!lto)

install="$_pkgname.install"

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=("SKIP")

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  _gen_scripts

  export RUSTUP_TOOLCHAIN=stable

  cd "$_pkgsrc"
  cargo fetch --target "${CARCH}-unknown-linux-gnu"
}

build() {
  # Currently Arch has both qt5 and qt6, and `/usr/bin/qmake` is qt5, this
  # package needs qt6.
  export QMAKE="/usr/bin/qmake6"
  # Use system libraries.
  export FFMPEG_DIR="/usr"
  export OPENCV_LINK_PATHS="/usr"
  # See <https://github.com/gyroflow/gyroflow/blob/master/__env-linux.sh>.
  # But I need to add `opencv_dnn` to build it.
  export OPENCV_LINK_LIBS="opencv_core,opencv_calib3d,opencv_features2d,opencv_imgproc,opencv_video,opencv_flann,opencv_dnn"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  cd "$_pkgsrc"
  cargo build --frozen --release --all-features
}

package() {
  depends+=(
    # AUR
    unionfs-fuse
  )

  # program files
  install -Dm755 "$_pkgsrc/target/release/$_pkgname" "$pkgdir/opt/$_pkgname/$_pkgname"
  install -Dm755 "$_pkgsrc/target/release/libmdk.so.0" -t "$pkgdir/opt/$_pkgname/"

  # camera presets
  cp -a "$_pkgsrc/resources/camera_presets" "$pkgdir/opt/$_pkgname"

  # scripts
  install -Dm755 gyroflow.sh "$pkgdir/usr/bin/gyroflow"
  install -Dm755 gyroflow_init.sh "$pkgdir/usr/bin/gyroflow_init"

  # desktop file
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$_pkgname.desktop" << END
[Desktop Entry]
Type=Application
Name=${_pkgname^}
Comment=$pkgdesc
Exec=$_pkgname %u
Icon=$_pkgname
Terminal=false
StartupNotify=true
Categories=Graphics;Photography;AudioVideo;
MimeType=video/mp4;video/mpeg;
END

  # icon
  install -Dm644 "$_pkgsrc/resources/icon.svg" "$pkgdir/usr/share/pixmaps/$_pkgname.svg"

  chmod -R u+rwX,go+rX,go-w "$pkgdir/"
}
_gen_scripts() {
  cat > gyroflow.sh << 'END'
#!/usr/bin/env bash

source /usr/bin/gyroflow_init

if ! grep -q '/usr/bin' <<< "$(which gyroflow)"; then
  exec gyroflow "$@"
fi
END

  cat > gyroflow_init.sh << 'END'
#!/usr/bin/env bash

export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"

APP_DIR="/opt/gyroflow"
SAVE_DIR="$XDG_CACHE_HOME/gyroflow_local"
MOUNT_DIR="$XDG_CACHE_HOME/gyroflow_mount"

if [[ "${BASH_SOURCE[0]}" == "$0" ]]; then
  echo "$0 should not be executed directly."
  exit 1
fi

if [ ! -e "$APP_DIR" ]; then
  echo "$APP_DIR not found."
  return 1
fi

_unionfs() {
  if [ ! -e "$MOUNT_DIR/gyroflow" ]; then
    mkdir -p "$SAVE_DIR"
    mkdir -p "$MOUNT_DIR"

    if ! unionfs -o cow -o umask=000 "$SAVE_DIR=RW:$APP_DIR=RO" "$MOUNT_DIR" > /dev/null 2>&1; then
      echo "unionfs failed"
      return 1
    fi
  fi
}

if grep -q gyroflow <<< $(groups); then
  export APP_ROOT="$APP_DIR"
  export LD_LIBRARY_PATH="$APP_DIR"
elif _unionfs; then
  if [ -e "$MOUNT_DIR" ]; then
    if ! grep -q "$MOUNT_DIR" <<< "$PATH"; then
      export APP_ROOT="$MOUNT_DIR"
    fi
  fi
fi

if ! grep -q "$APP_ROOT" <<< "$PATH"; then
  export PATH="$APP_ROOT:$PATH"
  export LD_LIBRARY_PATH="$APP_ROOT"
fi
END
}
