# Maintainer: loathingkernel <loathingkernel _a_ gmail _d_ com>

pkgname=umu-launcher-git
pkgver=1.2.1.r1.5783092e
pkgrel=1
pkgdesc="This is the Unified Launcher for Windows Games on Linux, to run Proton with fixes outside of Steam"
arch=('x86_64')
url="https://github.com/Open-Wine-Components/umu-launcher"
license=('GPL-3.0-only')
depends=(
  # steam
  bash
  desktop-file-utils
  diffutils
  hicolor-icon-theme
  curl
  dbus
  freetype2
  gdk-pixbuf2
  ttf-font
  zenity
  lsb-release
  nss
  usbutils
  xorg-xrandr
  vulkan-driver
  vulkan-icd-loader
  lsof
  python
  xdg-user-dirs
  glibc
  libxcrypt
  libxcrypt-compat
  gcc-libs
  # umu
  python-xlib
  python-xxhash
  python-pyzstd
  python-cbor2
  python-urllib3
)
depends_x86_64=(
  lib32-glibc
  lib32-libxcrypt
  lib32-libxcrypt-compat
  lib32-libgl
  lib32-gcc-libs
  lib32-libx11
  lib32-libxss
  lib32-alsa-plugins
  lib32-libgpg-error
  lib32-nss
  lib32-vulkan-driver
  lib32-vulkan-icd-loader
)
makedepends=(
  git
  scdoc
  python-build
  python-installer
  python-hatchling
  python-maturin
  python-pip
)
provides=('umu-launcher')
conflicts=('umu-launcher')
install=
_commit=
_origin="https://github.com/Open-Wine-Components/umu-launcher.git"
source=(
  "git+$_origin"
)

pkgver() {
  cd "$srcdir"/umu-launcher
  printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
  cd "$srcdir"/umu-launcher
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_HOME="${srcdir}"/umu-cargo
  cargo update
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$srcdir"/umu-launcher
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_HOME="${srcdir}"/umu-cargo
  ./configure.sh --prefix=/usr --use-system-pyzstd --use-system-urllib
  make
}

package() {
  cd "$srcdir"/umu-launcher
  make DESTDIR="$pkgdir" install
}

sha256sums=('SKIP')
