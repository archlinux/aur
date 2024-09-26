# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=xdg-desktop-portal-cosmic-git
pkgver=1.0.0.alpha.2.r0.gdcbdd99
pkgrel=2
pkgdesc="A backend implementation for xdg-desktop-portal for the COSMIC desktop environment"
arch=('x86_64' 'aarch64')
url="https://github.com/pop-os/xdg-desktop-portal-cosmic"
license=('GPL-3.0-or-later')
depends=(
  'hicolor-icon-theme'
  'libpipewire'
  'libxkbcommon'
  'mesa'
  'wayland'
  'xdg-desktop-portal'
)
makedepends=(
  'cargo'
  'clang'
  'git'
  'mold'
)
provides=("${pkgname%-git}" 'xdg-desktop-portal-impl')
conflicts=("${pkgname%-git}")
source=('git+https://github.com/pop-os/xdg-desktop-portal-cosmic.git'
        'lto.patch')
sha256sums=('SKIP'
            'd731157887872770c6964303ff89245090cd47ce68cb48aecd633e6ac40a685f')

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
  make prefix='/usr' libexecdir='/usr/lib' DESTDIR="$pkgdir" install
}
