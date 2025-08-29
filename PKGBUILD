# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-greeter-git
pkgver=1.0.0.alpha.7.r46.gf150f9e
pkgrel=1
pkgdesc="libcosmic greeter for greetd, which can be run inside cosmic-comp"
arch=('x86_64' 'aarch64')
url="https://github.com/pop-os/cosmic-greeter"
license=('GPL-3.0-only')
depends=(
  'cosmic-comp-git'
  'cosmic-randr-git'
  'gnome-keyring'
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
backup=(
  "etc/greetd/${pkgname%-git}.toml"
#  "/etc/pam.d/${pkgname%-git}"
)
optdepends=(
  'fprintd: fingerprint authentication'
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

  # Use thin LTO
  patch -Np1 -i ../lto.patch

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"

  git lfs install --local
  git remote add network-origin https://github.com/pop-os/cosmic-greeter
  git lfs fetch network-origin
  git lfs checkout

  # Enable default-display-manager systemd service link
  patch -Np1 -i ../display-manager.patch
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

  # Symlink PAM login config instead of shipping upstream greeter config
  install -d "$pkgdir/etc/pam.d"
  ln -s /etc/pam.d/login "$pkgdir/etc/pam.d/${pkgname%-git}"
}
