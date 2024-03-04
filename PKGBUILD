# Maintainer:
# Contributor: bjin <bjin@ctrl-d.org>
# Contributor: Alynx Zhou <alynx.zhou@gmail.com>

## useful links
# https://gyroflow.xyz
# https://github.com/gyroflow/gyroflow

_pkgname="gyroflow"
pkgname="$_pkgname-git"
pkgver=1.5.4.r115.ga161c78b
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
  'cargo'
  'clang'
  'gendesk'
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

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=("SKIP")

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=8 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cat <<EOF > "$_pkgname.sh"
#!/usr/bin/env sh
export LD_LIBRARY_PATH="/opt/$_pkgname"
exec /opt/$_pkgname/$_pkgname "\$@"
EOF

  local _gendesk_options=(
    -q -f -n
    --pkgname="$_pkgname"
    --pkgdesc="$pkgdesc"
    --name="Gyroflow"
    --exec="$_pkgname %u"
    --icon="$_pkgname"
    --terminal=false
    --categories="Graphics;Photography;AudioVideo"
    --mimetypes="video/mp4;video/mpeg"
    --startupnotify=true
  )

  gendesk "${_gendesk_options[@]}"

  export RUSTUP_TOOLCHAIN=stable

  cd "$_pkgsrc"
  cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
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
  # program files
  install -Dm755 "$_pkgsrc/target/release/$_pkgname" "$pkgdir/opt/$_pkgname/$_pkgname"
  install -Dm755 "$_pkgsrc/target/release/libmdk.so.0" -t "$pkgdir/opt/$_pkgname/"

  # camera presets
  cp -a "$_pkgsrc/resources/camera_presets" "$pkgdir/opt/$_pkgname"

  # script
  install -Dm755 "$_pkgname.sh" "$pkgdir/usr/bin/$_pkgname"

  # desktop file
  install -Dm644 "$_pkgname.desktop" -t "$pkgdir/usr/share/applications/"

  # icon
  install -Dm644 "$_pkgsrc/resources/icon.svg" "$pkgdir/usr/share/pixmaps/$_pkgname.svg"

  # Make camera presets directory writable.
  # gyroflow downloads and saves new presets to this directory.
  find "$pkgdir/opt/$_pkgname/camera_presets" -type d -exec chmod 777 {} +
}
