# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Peter Jung <ptr1337@archlinux.org>
# Contributor: Mark Wagie <mark.wagie@proton.me>

pkgname=cosmic-settings-daemon-application-volume
pkgver=1.5.0
pkgrel=1
epoch=1
pkgdesc='Cosmic settings daemon'
arch=(x86_64)
url=https://github.com/pop-os/cosmic-settings-daemon
license=(GPL-3.0-only)
groups=(cosmic)
depends=(
  acpid
  adw-gtk-theme
  alsa-utils
  breeze-icons
  libgcc
  geoclue
  glibc
  libinput
  libpulse
  libpipewire
  playerctl
  cosmic-sound-theme
  qt6ct
  systemd-libs
  wireplumber
  xdg-utils
)
makedepends=(
  clang
  cargo
  git
  libxkbcommon
  mold
)
optdepends=(
  'pulseaudio-alsa: Media keys support'
  'qt5ct: Theming support for Qt5 apps'
)
source=(
  git+https://github.com/AdityaHebballe/cosmic-settings-daemon.git#branch=feat/application-volume-control
  cosmic-settings-daemon-lto.patch
)
b2sums=('SKIP')

prepare() {
  cd cosmic-settings-daemon
  patch -Np1 -i ../cosmic-settings-daemon-lto.patch
  cargo fetch --locked
  sed 's/libexec/lib/g' -i Makefile src/main.rs
  sed 's/sudo/wheel/g' -i data/polkit-1/rules.d/cosmic-settings-daemon.rules
}

build() {
  cd cosmic-settings-daemon
  export GEOCLUE_AGENT="/usr/lib/geoclue-2.0/demos/agent"

  RUSTFLAGS+=" -C link-arg=-fuse-ld=mold"
  make ARGS+=" --frozen --release" geoclue_agent='/usr/lib/geoclue-2.0/demos/agent'
}

package() {
  cd cosmic-settings-daemon
  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
