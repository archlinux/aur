# Maintainer: soloturn <soloturn@gmail.com>
# Co-Maintainer: Mark Wagie <mark dot wagie at proton dot me>

pkgname=cosmic-bg-git
pkgver=1.0.0.beta.1.r0.g40254a7
pkgrel=2
pkgdesc="COSMIC session service which applies backgrounds to displays."
arch=('x86_64' 'aarch64')
url="https://github.com/pop-os/cosmic-bg"
license=('MPL-2.0')
depends=(
  'cosmic-icons-git'
  'libxkbcommon'
)
makedepends=(
  'cargo'
  'clang'
  'git'
  'just'
  'mold'
  'nasm'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/pop-os/cosmic-bg.git'
        'lto.patch')
sha256sums=('SKIP'
            'd6700a009732ec4087fe8dfae5ea9470dd889a0e63969e91e2abaaa56ca7827c')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/^epoch-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"

  # Use thin LTO
  patch -Np1 -i ../lto.patch

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable

  # use mold instead of lld to speed up build
  RUSTFLAGS+=" -C link-arg=-fuse-ld=mold"

  # use nice to build with lower priority
  nice just build-release
}

package() {
  cd "${pkgname%-git}"
  just rootdir="$pkgdir" install
}
