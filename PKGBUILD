# Maintainer: skygrango <coding.hard.day.and.night@gmail.com>
# Contributor: soloturn <soloturn@gmail.com>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-comp-gaming
pkgver=1.0.17.beta.r1.g
pkgrel=1
pkgdesc="Compositor for the COSMIC desktop environment with gaming patches that support pointer-constraints-v1, pointer-warp-v1, commit-timing-v1, fifo-v1 and respect fullscreen function"
arch=('x86_64' 'aarch64')
url="https://github.com/skygrango/cosmic-comp"
license=('GPL-3.0-only')
depends=(
  'accountsservice'
  'fontconfig'
  'iso-codes'
  'libpipewire'
  'libpulse'
  'nm-connection-editor'
  'systemd-libs'
  'ttf-opensans'
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
  'clang'
  'git'
  'just'
  'mold'
)
provides=(
	"cosmic-comp-git"
	"cosmic-comp"
	"cosmic-settings"
	"cosmic-settings-git"
	"cosmic-randr"
	"cosmic-randr-git"
)
conflicts=(
	"cosmic-comp-git"
	"cosmic-comp"
	"cosmic-settings"
	"cosmic-settings-git"
	"cosmic-randr"
	"cosmic-randr-git"
)
source=(
	'git+https://github.com/skygrango/cosmic-comp.git#branch=vrr_target_rate'
	'git+https://github.com/skygrango/cosmic-settings.git#branch=vrr_target_rate'
	'git+https://github.com/skygrango/cosmic-randr.git#branch=vrr_target_rate'
)
sha256sums=(
	'SKIP'
	'SKIP'
	'SKIP'
)

pkgver() {
  cd cosmic-comp
  _hash=$(git describe --long --tags --match "gaming-*" | sed 's/.*-g//')
  echo "${pkgver}.g${_hash}"
}

prepare() {
  export RUSTUP_TOOLCHAIN=stable
  cd $srcdir/cosmic-comp
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
  cd $srcdir/cosmic-randr
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
  cd $srcdir/cosmic-settings
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  export RUSTUP_TOOLCHAIN=stable

  # use mold instead of lld to speed up build
  RUSTFLAGS+=" -C link-arg=-fuse-ld=mold"
  
  cd $srcdir/cosmic-comp
  # use nice to build with lower priority
  ARGS+=" --frozen" nice make

  cd $srcdir/cosmic-randr
  nice just build-release --frozen
  cd $srcdir/cosmic-settings
  nice just build-release
}

package() {
  cd $srcdir/cosmic-comp
  make DESTDIR="$pkgdir" install
  
  cd "$srcdir/cosmic-randr"
  just rootdir="$pkgdir" install
  cd "$srcdir/cosmic-settings"
  just rootdir="$pkgdir" install
}
