# Maintainer:
# Contributor: Alynx Zhou <alynx.zhou@gmail.com>

: ${CARGO_HOME:=$SRCDEST/cargo-home}
: ${CARGO_TARGET_DIR=target}
: ${RUSTUP_TOOLCHAIN=stable}
export CARGO_HOME CARGO_TARGET_DIR RUSTUP_TOOLCHAIN

: ${_install_path:=usr/lib}
: ${_commit=704744ecff38962e74cd1212433656a49f6221eb} # 1.6.3.r79

_pkgname="gyroflow"
pkgname="$_pkgname"
pkgver=1.6.3
pkgrel=4
pkgdesc="Video stabilization using gyroscope data"
url="https://github.com/gyroflow/gyroflow"
license=("GPL-3.0-or-later")
arch=("x86_64")

depends=(
  'ffmpeg'
  'libc++'
  'ocl-icd'
  'opencv4'
  'qt6-declarative'
)
makedepends=(
  '7zip'
  'cargo'
  'clang'
  'git'
  'opencl-headers'
  'zlib-static'
)
optdepends=(
  'intel-media-driver: VAAPI video acceleration for Intel GPU'
  'libva-mesa-driver: VAAPI video acceleration for NVIDIA and AMD GPU'
  'opencl-driver: OpenCL driver for GPU accelerated stabilization'
)

options=('!lto')

_pkgsrc="$_pkgname-${_commit:-$pkgver}"
_pkgext="tar.gz"
source=("$_pkgname-$pkgver${_commit:+-${_commit::7}}.$_pkgext"::"$url/archive/${_commit:-refs/tags/v$pkgver}.$_pkgext")
sha256sums=('03f575affb4322b589a3378e746a887404007f9291ba18bcbd0cf861430b7ee7')

prepare() (
  cd "$_pkgsrc"
  cargo fetch --target host-tuple
)

build() (
  local _units=$(($(nproc) > 16 ? $(nproc) : 16))
  export RUSTFLAGS="-C opt-level=2 -C codegen-units=$_units -C lto=off"

  export QMAKE="/usr/bin/qmake6"

  # Use system libraries
  export FFMPEG_DIR="/usr"
  export OPENCV_LINK_PATHS="/usr/lib/opencv4"
  export OPENCV_LINK_LIBS="opencv_core,opencv_calib3d,opencv_features2d,opencv_imgproc,opencv_video,opencv_flann,opencv_dnn"

  cd "$_pkgsrc"
  cargo build --frozen --release --all-features
)

package() {
  # program files
  install -Dm755 "$_pkgsrc/$CARGO_TARGET_DIR/release/$_pkgname" "$pkgdir/$_install_path/$_pkgname/$_pkgname"
  install -Dm755 "$_pkgsrc/$CARGO_TARGET_DIR/release/libmdk.so.0" -t "$pkgdir/$_install_path/$_pkgname/"

  # camera presets
  cp -a "$_pkgsrc/resources/camera_presets" "$pkgdir/$_install_path/$_pkgname"

  # icon
  install -Dm644 "$_pkgsrc/resources/icon.svg" "$pkgdir/usr/share/pixmaps/$_pkgname.svg"

  # launcher
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

  # script
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$_pkgname" << END
#!/usr/bin/env sh
export LD_LIBRARY_PATH="/$_install_path/$_pkgname"
exec "/$_install_path/$_pkgname/$_pkgname" "\$@"
END

  # permissions
  chmod -R u+rwX,go+rX,go-w "$pkgdir/"
}
