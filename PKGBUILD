# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-greeter-git
pkgver=1.0.16.r0.g7a0c083
pkgrel=1
pkgdesc="COSMIC greeter for greetd"
arch=('x86_64' 'aarch64')
url="https://github.com/pop-os/cosmic-greeter"
license=('GPL-3.0-only')
depends=(
  'cosmic-comp-git'
  'cosmic-icons-git'
  'cosmic-randr-git'
  'dbus'
  'greetd'
  'libxkbcommon'
  'pam'
  'wayland'
)
makedepends=(
  'cargo'
  'clang'
  'git'
  'git-lfs'
  'just'
  'mold'
)
backup=("etc/greetd/${pkgname%-git}.toml")
optdepends=(
  'fprintd: Fingerprint authentication'
  'gnome-keyring: Start gnome keyring components if the daemon is active'
  'xorg-xinit: Xorg session'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/pop-os/cosmic-greeter.git'
        'display-manager.patch'
        'lto.patch')
sha256sums=('SKIP'
            '12772a54559f299f9f8e8c5687b9aff30f37e38328e59692e27861f94cf6a0c7'
            '0c64dcae8a0232a15ff5ce1d8728434b12125bdbb098fba4ae21624a977f1e57')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/^epoch-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  git lfs install --local
  git remote add network-origin https://github.com/pop-os/cosmic-greeter
  git lfs fetch network-origin
  git lfs checkout

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple

  # revert pam config for now
  git revert -n ef1253aa2393666bb2a0b0132b722f51ec7ebbf3

  # Enable default-display-manager systemd service link
  patch -Np1 -i ../display-manager.patch

  # Use thin LTO
  patch -Np1 -i ../lto.patch
}

build() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable

  # use mold instead of lld to speed up build
  RUSTFLAGS+=" -C link-arg=-fuse-ld=mold"

  # use nice to build with lower priority
  nice just build-release --frozen
}

package() {
  cd "${pkgname%-git}"
  just rootdir="$pkgdir" install

  install -Dm644 "${pkgname%-git}.toml" -t "$pkgdir/etc/greetd/"
  install -Dm644 debian/"${pkgname%-git}"{.service,-daemon.service} -t \
    "$pkgdir/usr/lib/systemd/system/"
}
