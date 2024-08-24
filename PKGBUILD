# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-session-git
pkgver=1.0.0.alpha.1.r0.gc3de3d2
pkgrel=3
pkgdesc="Session manager for the COSMIC desktop environment"
arch=('x86_64' 'aarch64')
url="https://github.com/pop-os/cosmic-session"
license=('GPL-3.0-or-later')
depends=(
  'cosmic-applibrary-git'
  'cosmic-applets-git'
  'cosmic-bg-git'
  'cosmic-comp-git'
  'cosmic-greeter-git'
  'cosmic-icons-git'
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
  'cosmic-files-git: COSMIC file manager'
  'cosmic-store-git: COSMIC store'
  'cosmic-term-git: COSMIC terminal'
  'cosmic-wallpapers-git: COSMIC wallpapers'
  'vulkan-driver: packaged vulkan driver'

  # Default applications
  # See data/cosmic-mimeapps.list
#  'abiword'
#  'brasero'
#  'cosmic-edit'
#  'cosmic-files'
#  'cosmic-store'
#  'eog'
#  'dia'
#  'evince'
#  'evolution'
#  'file-roller'
#  'firefox'
#  'gimp'
#  'gnome-font-viewer'
#  'gnumeric'
#  'libreoffice'
#  'popsicle'
#  'rhythmbox'
#  'sound-juicer'
#  'totem'
#  'yelp'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/pop-os/cosmic-session.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/^epoch-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"

  # libexec > lib
  sed -i 's|libexec|lib|g' Justfile src/main.rs
}

build() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable

  # use mold instead of lld to speed up build
  RUSTFLAGS="-C link-arg=-fuse-ld=mold"

  # use nice to build with lower priority
  nice cargo build --release --frozen --offline
}

package() {
  cd "${pkgname%-git}"
  just rootdir="$pkgdir" install
}

