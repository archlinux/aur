# Maintainer: Uncore <contactuncor3@gmail.com>
pkgname=idescriptor-git
_pkgname=iDescriptor
pkgver=r1327.28118cc
pkgrel=1
pkgdesc="The iDevice management tool — free, open-source, and cross-platform."
arch=('x86_64')
url="https://github.com/iDescriptor/iDescriptor"
license=('AGPL3-or-later')
provides=("$pkgname")
depends=(
    'libplist'
    'usbmuxd'
    'libusbmuxd'
    'openssl'
    'libssh'
    'libusb'
    'libheif'
    'libzip'
    'qt6-base'
    'qt6-multimedia'
    'qt6-declarative'
    'qt6-serialport'
    'qt6-positioning'
    'qt6-location'
    'avahi'
    'libsecret'
    'gnome-keyring'
    'ffmpeg'
    'qt6-declarative'
    'qt6-5compat'
    'qt6-multimedia'
    'qt6-svg'
    'gst-plugin-qmlgl'
    'gst-plugin-qml6'
    'gst-plugins-good'
    'gst-plugins-bad'
    'gst-libav'
    'sqlite'
)

optdepends=(
    'ifuse: use `ifuse` provided by libimobiledevice instead of Rust implementation'
)

makedepends=(
    'git'
    'cmake'
    'cargo'
)
options=('!debug')
source=("git+https://github.com/iDescriptor/iDescriptor.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"
  git submodule update --init --recursive
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --manifest-path Cargo.toml
}

build() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CFLAGS+=" -ffat-lto-objects"
  export CXXFLAGS+=" -ffat-lto-objects"
  export IDESCRIPTOR_PACKAGE_MANAGER_MESSAGE="Please update iDescriptor using yay or paru."
  cargo build --frozen --release --features package_manager
}

package() {
  cd "$_pkgname"

  install -Dm755 target/release/idescriptor "$pkgdir/usr/bin/idescriptor"
  install -Dm644 io.github.idescriptor.iDescriptor.desktop \
    "$pkgdir/usr/share/applications/io.github.idescriptor.iDescriptor.desktop"

  local size
  for size in 16 32 256 512; do
    install -Dm644 "packaging/shared/resources/app-icon/icon-$size.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/io.github.idescriptor.iDescriptor.png"
  done
}
