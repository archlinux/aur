# Maintainer: skygrango <coding.hard.day.and.night@gmail.com>
# Contributor: soloturn <soloturn@gmail.com>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-comp-gaming
pkgver=1.0.13.beta.r4
pkgrel=1
pkgdesc="Compositor for the COSMIC desktop environment with gaming patches that should fix cursor problem and fullscreen function"
arch=('x86_64' 'aarch64')
url="https://github.com/skygrango/cosmic-comp"
license=('GPL-3.0-only')
depends=(
  'fontconfig'
  'libdisplay-info'
  'libseat.so'
  'libinput'
  'libxcb'
  'libxkbcommon'
  'mesa'
  'pixman'
  'systemd'
  'wayland'
)
makedepends=(
  'cargo'
  'git'
  'mold'
)
provides=(
	"cosmic-comp-git"
	"cosmic-comp"
)
conflicts=(
	"cosmic-comp-git"
	"cosmic-comp"
)
source=('git+https://github.com/skygrango/cosmic-comp.git#branch=gaming-fix')
sha256sums=('SKIP')

pkgver() {
  cd cosmic-comp
  git describe --long --tags --abbrev=7 | sed 's/^[a-z-]*//;s/\([^-]*-g\)/r\1/;s/-g.*//;s/-/./g'
}

prepare() {
  cd cosmic-comp
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd cosmic-comp
  export RUSTUP_TOOLCHAIN=stable

  # use mold instead of lld to speed up build
  RUSTFLAGS+=" -C link-arg=-fuse-ld=mold"

  # use nice to build with lower priority
  ARGS+=" --frozen" nice make
}

package() {
  cd cosmic-comp
  make DESTDIR="$pkgdir" install
}
