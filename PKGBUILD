# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-settings-daemon-git
pkgver=1.0.0.alpha.1.r6.ga41d199
pkgrel=1
pkgdesc="Cosmic settings daemon"
arch=('x86_64' 'aarch64')
url="https://github.com/pop-os/cosmic-settings-daemon"
license=('GPL-3.0-or-later')
depends=(
  'acpid'
  'adw-gtk-theme'
  'alsa-utils'
  'geoclue'
  'libinput'
  'playerctl'
  'pop-sound-theme-git'
  'systemd-libs'
)
makedepends=(
  'cargo'
  'git'
  'mold'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/pop-os/cosmic-settings-daemon.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/^epoch-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"

  # Use wheel instead of sudo group
  # https://github.com/pop-os/cosmic-settings-daemon/issues/42
  sed -i 's|sudo|wheel|g' "data/polkit-1/rules.d/${pkgname%-git}.rules"
}

build() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  export GEOCLUE_AGENT="/usr/lib/geoclue-2.0/demos/agent"

  # use mold instead of lld to speed up build
  RUSTFLAGS="-C link-arg=-fuse-ld=mold"

  # use nice to build with lower priority
  ARGS+=" --frozen" nice make geoclue_agent='/usr/lib/geoclue-2.0/demos/agent'
}

package() {
  cd "${pkgname%-git}"
  make DESTDIR="$pkgdir" install
}
