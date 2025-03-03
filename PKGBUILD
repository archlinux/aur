# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-store-git
pkgver=1.0.0.alpha.6.r3.g9896668
pkgrel=1
pkgdesc="COSMIC Store"
arch=('x86_64' 'aarch64')
url="https://github.com/pop-os/cosmic-store"
license=('GPL-3.0-only')
depends=(
  'cosmic-icons-git'
  'flatpak'
  'glib2'
  'libxkbcommon'
)
makedepends=(
  'cargo'
  'git'
  'just'
  'mold'
)
optdepends=(
  'archlinux-appstream-data: Appstream data for use with packagekit'
  'packagekit: package manager integration module'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/pop-os/cosmic-store.git'
        'lto.patch')
sha256sums=('SKIP'
            'f3546ad15b66e888b4b64a73647545587558137661a57260089d8e3526592596')

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
  nice just build-release --frozen
}

package() {
  cd "${pkgname%-git}"
  just rootdir="$pkgdir" install
}
