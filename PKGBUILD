# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-settings-daemon-git
pkgver=1.0.0.alpha.7.r31.g99a6adc
pkgrel=1
pkgdesc="Cosmic settings daemon"
arch=('x86_64' 'aarch64')
url="https://github.com/pop-os/cosmic-settings-daemon"
license=('GPL-3.0-only')
depends=(
  'acpid'
  'adw-gtk-theme'
  'libinput'
  'libpulse'
  'openssl'
  'playerctl'
  'pop-sound-theme-git'
  'systemd'
  'wireplumber'
  'xdg-utils'
)
makedepends=(
  'cargo'
  'git'
  'libxkbcommon'
  'mold'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/pop-os/cosmic-settings-daemon.git'
        'lto.patch')
sha256sums=('SKIP'
            '0d9c1cdf9fcb68116e2d16c5d6ea575d64a11386d6fb3a39e6e07fb5b3ee7798')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/^epoch-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"

  # Use thin LTO
  patch -Np1 -i ../lto.patch

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable

  # use mold instead of lld to speed up build
  RUSTFLAGS+=" -C link-arg=-fuse-ld=mold"

  # use nice to build with lower priority
  ARGS+=" --frozen" nice make
}

package() {
  cd "${pkgname%-git}"
  make DESTDIR="$pkgdir" install
}
