# Maintainer: Evert Vorster
#Contributor: Static_Rocket

pkgname=asusctl-devel-git
pkgver=6.1.16.r2.g132a2f3
pkgrel=7
pkgdesc="Asus laptop control utilities"
arch=('x86_64')
url="https://gitlab.com/asus-linux/asusctl"
license=('MPL-2.0')
depends=(
	'libusb' 'udev' 'systemd' 'qt6-base' 'qt6-wayland' 'noto-fonts' 'wayland' 
	'libxkbcommon' 'mesa' 'xorg-server-xwayland'
)
optdepends=(
	'libappindicator-gtk3: tray icon'
	'gtk3: control center ui'
)
makedepends=(
	'git' 'cargo' 'clang' 'cmake' 'pango' 'gdk-pixbuf2' 'at-spi2-core' 
        'qt6-base' 'gtk3' 'sdl2' 'seatd' 'libinput'
)
provides=('asusctl' 'rog-control-center')
conflicts=('asusctl' 'rog-control-center')
source=('git+https://gitlab.com/asus-linux/asusctl.git#branch=devel')
md5sums=('SKIP')
_gitdir=${pkgname%"-devel-git"}

pkgver() {
  cd "$srcdir/$_gitdir"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_gitdir"
# Use system cargo/rustc; avoid rustup overrides
  export RUSTC=/usr/bin/rustc
  export CARGO=/usr/bin/cargo
  export CARGO_HOME="$srcdir/cargo-home"
# If upstream pins a toolchain, remove it in packaging context
  rm -f rust-toolchain rust-toolchain.toml
# Pre-fetch deps for reproducible builds; native target is fine
  "$CARGO" fetch --locked
}

build() {
  cd "$srcdir/$_gitdir"
  export RUSTC=/usr/bin/rustc
  export CARGO=/usr/bin/cargo
  export CARGO_HOME="$srcdir/cargo-home"
  export CARGO_FLAGS="--frozen --locked --no-default-features \
	--features slint/backend-qt,slint/backend-winit,slint/backend-winit-x11,slint/backend-winit-wayland"
# Build with frozen lock (no network) and respect upstream Makefile
# If Makefile calls cargo, these env vars force system toolchain.
  make build CARGO="$CARGO" RUSTC="$RUSTC" CARGO_FLAGS="$CARGO_FLAGS"
}

package() {
  cd "$srcdir/$_gitdir"
# Use system toolchain inside the packaging env
  export RUSTC=/usr/bin/rustc
  export CARGO=/usr/bin/cargo
  export CARGO_HOME="$srcdir/cargo-home"
  export CARGO_FLAGS="--frozen --locked --no-default-features \
        --features slint/backend-qt,slint/backend-winit,slint/backend-winit-x11,slint/backend-winit-wayland"
# If the Makefile calls cargo internally, these vars keep it on system rust
  make DESTDIR="$pkgdir" \
       CARGO="$CARGO" RUSTC="$RUSTC" CARGO_FLAGS="$CARGO_FLAGS" \
       install
}
