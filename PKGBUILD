# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-osd-git
pkgver=1.0.0.alpha.7.r30.ge7e1555
pkgrel=1
pkgdesc="COSMIC On-Screen Display"
arch=('x86_64' 'aarch64')
url="https://github.com/pop-os/cosmic-osd"
license=('GPL-3.0-only')
depends=(
  'libinput'
  'libpipewire'
  'libpulse'
  'libxkbcommon'
  'sound-theme-freedesktop'
  'systemd-libs'
  'wayland'
)
makedepends=(
  'cargo'
  'clang'
  'git'
  'mold'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/pop-os/cosmic-osd.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/^epoch-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"

  sed 's|libexec|lib/polkit-1|g' -i Makefile src/subscriptions/polkit_agent_helper.rs
}

build() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  export POLKIT_AGENT_HELPER_1="/usr/lib/polkit-1/polkit-agent-helper-1"

  # use mold instead of lld to speed up build
  RUSTFLAGS+=" -C link-arg=-fuse-ld=mold"

  # use nice to build with lower priority
  ARGS+=" --frozen" nice make
}

package() {
  cd "${pkgname%-git}"
  make prefix='/usr' DESTDIR="$pkgdir" install
}
