# Maintainer:
# Contributor: Alynx Zhou <alynx.zhou@gmail.com>

## options
: ${_install_path:=opt}

: ${CARGO_HOME:=$SRCDEST/cargo-home}
: ${CARGO_TARGET_DIR=target}
: ${RUSTUP_TOOLCHAIN=stable}
export CARGO_HOME CARGO_TARGET_DIR RUSTUP_TOOLCHAIN

_pkgname="gyroflow"
pkgname="$_pkgname"
pkgver=1.6.3
pkgrel=1
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

options=('!lto')

_pkgsrc="$_pkgname-$pkgver"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"$url/archive/refs/tags/v$pkgver.$_pkgext")
sha256sums=('0b2049d448999fa96647fb6c9e067fd5bfe0a8e5b91da97a6d0aa20fe9f1353f')

prepare() (
  cd "$_pkgsrc"
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
)

build() (
  export QMAKE="/usr/bin/qmake6"

  # Use system libraries
  export FFMPEG_DIR="/usr"
  export OPENCV_LINK_PATHS="/usr"
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
