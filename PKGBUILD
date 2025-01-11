# Maintainer:
# Contributor: bjin <bjin@ctrl-d.org>
# Contributor: Alynx Zhou <alynx.zhou@gmail.com>

## links
# https://gyroflow.xyz
# https://github.com/gyroflow/gyroflow

_pkgname="gyroflow"
pkgname="$_pkgname-git"
pkgver=1.6.0.r71.g52fcd02
pkgrel=1
pkgdesc="Video stabilization using gyroscope data"
url="https://github.com/gyroflow/gyroflow"
license=("GPL-3.0-or-later")
arch=("x86_64")

depends=(
  'blas-openblas'
  'ffmpeg'
  'libc++'
  'ocl-icd'
  'opencv'
  'qt6-declarative'
)
makedepends=(
  '7zip'
  'cargo'
  'clang'
  'git'
  'opencl-headers'
)
optdepends=(
  'opencl-driver: OpenCL driver for GPU accelerated stabilization'
  'libva-mesa-driver: VAAPI video acceleration for NVIDIA and AMD GPU'
  'intel-media-driver: VAAPI video acceleration for Intel GPU'
)

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

options=('!lto')

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=("SKIP")

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  [ ! -e "$_pkgsrc/.cargo/config.toml" ] \
    && [ -e "$_pkgsrc/.cargo/config" ] \
    && mv "$_pkgsrc/.cargo/config" "$_pkgsrc/.cargo/config.toml"

  export RUSTUP_TOOLCHAIN=stable

  cd "$_pkgsrc"
  cargo fetch --target "${CARCH}-unknown-linux-gnu"
}

build() {
  export QMAKE="/usr/bin/qmake6"

  # Use system libraries
  export FFMPEG_DIR="/usr"
  export OPENCV_LINK_PATHS="/usr"
  export OPENCV_LINK_LIBS="opencv_core,opencv_calib3d,opencv_features2d,opencv_imgproc,opencv_video,opencv_flann,opencv_dnn"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  cd "$_pkgsrc"
  cargo build --frozen --release --all-features
}

package() {
  # program files
  install -Dm755 "$_pkgsrc/target/release/$_pkgname" "$pkgdir/opt/$_pkgname/$_pkgname"
  install -Dm755 "$_pkgsrc/target/release/libmdk.so.0" -t "$pkgdir/opt/$_pkgname/"

  # camera presets
  cp -a "$_pkgsrc/resources/camera_presets" "$pkgdir/opt/$_pkgname"

  # scripts
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$_pkgname" << END
#!/usr/bin/env sh
export LD_LIBRARY_PATH="/opt/$_pkgname"
exec /opt/$_pkgname/$_pkgname
END

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

  # permissions
  chmod -R u+rwX,go+rX,go-w "$pkgdir/"
}
