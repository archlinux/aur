# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-workspaces-git
pkgver=1.2.0.r9.g28a2bfe
pkgrel=1
pkgdesc="Cosmic workspaces"
arch=('x86_64' 'aarch64')
url="https://github.com/pop-os/cosmic-workspaces-epoch"
license=('GPL-3.0-only')
depends=(
  'cosmic-icons-git'
  'libinput'
  'libxkbcommon'
  'mesa'
  'wayland'
)
makedepends=(
  'cargo'
  'git'
  'mold'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/pop-os/cosmic-workspaces-epoch.git'
        'lto.patch')
sha256sums=('SKIP'
            '52d7bdcb68032b8d750a568fcbebf21a375bb68b0c46ea7b64494d93d6c4430a')

pkgver() {
  cd "${pkgname%-git}-epoch"
  git describe --long --tags --abbrev=7 | sed 's/^epoch-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}-epoch"

  # use thin LTO profile
  patch -Np1 -i ../lto.patch

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  cd "${pkgname%-git}-epoch"
  export RUSTUP_TOOLCHAIN=stable

  # use mold instead of lld to speed up build
  RUSTFLAGS+=" -C link-arg=-fuse-ld=mold"

  # use nice to build with lower priority
  nice make ARGS+=" --frozen --release"
}

package() {
  cd "${pkgname%-git}-epoch"
  make prefix='/usr' DESTDIR="$pkgdir" install
}
