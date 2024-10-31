# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-session-git
pkgver=1.0.0.alpha.2.r7.g342369e
pkgrel=1
pkgdesc="Session manager for the COSMIC desktop environment"
arch=('x86_64' 'aarch64')
url="https://github.com/pop-os/cosmic-session"
license=('GPL-3.0-or-later')
depends=(
  'cosmic-applibrary-git'
  'cosmic-applets-git'
  'cosmic-bg-git'
  'cosmic-comp-git'
  'cosmic-files-git'
  'cosmic-greeter-git'
  'cosmic-icons-git'
  'cosmic-idle-git'
  'cosmic-launcher-git'
  'cosmic-notifications-git'
  'cosmic-osd-git'
  'cosmic-panel-git'
  'cosmic-randr-git'
  'cosmic-screenshot-git'
  'cosmic-settings-daemon-git'
  'cosmic-settings-git'
  'cosmic-workspaces-git'
  'otf-fira-mono'
  'otf-fira-sans'
  'switcheroo-control'
  'xdg-desktop-portal-cosmic-git'
  'xorg-xwayland'
)
makedepends=(
  'cargo'
  'git'
  'just'
  'mold'
)
optdepends=(
  'cosmic-edit-git: COSMIC text editor'
  'cosmic-store-git: COSMIC store'
  'cosmic-term-git: COSMIC terminal'
  'cosmic-wallpapers-git: COSMIC wallpapers'
  'system-config-printer: printer settings'
  'vulkan-driver: packaged vulkan driver'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/pop-os/cosmic-session.git'
        'lto.patch')
sha256sums=('SKIP'
            '212d1667891da23c3e9663546c50afefa0179022016e0444858b523065cf6294')

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
  export XDP_COSMIC="/usr/lib/xdg-desktop-portal-cosmic"

  # use mold instead of lld to speed up build
  RUSTFLAGS+=" -C link-arg=-fuse-ld=mold"

  # use nice to build with lower priority
  XDP_COSMIC="/usr/lib/xdg-desktop-portal-cosmic" nice cargo build --release --frozen --offline
}

package() {
  cd "${pkgname%-git}"
  just rootdir="$pkgdir" install
}

