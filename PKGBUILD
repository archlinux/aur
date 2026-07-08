# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-settings-daemon-git
pkgver=1.2.0.r3.g8c54bbb
pkgrel=1
pkgdesc="Cosmic settings daemon"
arch=('x86_64' 'aarch64')
url="https://github.com/pop-os/cosmic-settings-daemon"
license=('GPL-3.0-only')
depends=(
  'acpid'
  'adw-gtk-theme'
  'geoclue'
  'libinput'
  'libpulse'
  'openssl'
  'playerctl'
  'pop-sound-theme-git'
  'qt5ct'
  'qt6ct'
  'systemd'
  'wireplumber'
  'xdg-utils'
)
makedepends=(
  'cargo'
  'clang'
  'git'
  'libxkbcommon'
  'mold'
)
optdepends=('breeze-icons')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/pop-os/cosmic-settings-daemon.git'
        'lto.patch')
sha256sums=('SKIP'
            '52fb9e1690580a21e8fdc4f5f016e45f01e08b16a29c09bfef59660a3ea9531a')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/^epoch-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"

  # Use thin LTO
  patch -Np1 -i ../lto.patch

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  export GEOCLUE_AGENT="/usr/lib/geoclue-2.0/demos/agent"

  # use mold instead of lld to speed up build
  RUSTFLAGS+=" -C link-arg=-fuse-ld=mold"

  # use nice to build with lower priority
  nice make ARGS+=" --frozen --release" geoclue_agent='/usr/lib/geoclue-2.0/demos/agent'
}

package() {
  cd "${pkgname%-git}"
  make DESTDIR="$pkgdir" install
}
