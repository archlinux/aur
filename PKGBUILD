# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Kyuzial <kyuzial@protonmail.com>
pkgname=cosmic-term-git
pkgver=1.0.0.alpha.7.r26.ga20d77f
pkgrel=1
pkgdesc="COSMIC Terminal Emulator"
arch=('x86_64' 'aarch64')
url="https://github.com/pop-os/cosmic-term"
license=('GPL-3.0-only')
depends=(
  'cosmic-icons-git'
  'gcc-libs'
  'libxkbcommon'
)
makedepends=(
  'cargo'
  'git'
  'just'
  'mold'
)
provides=("${pkgname%-git}" 'cosmic-terminal')
conflicts=("${pkgname%-git}" 'cosmic-terminal')
source=('git+https://github.com/pop-os/cosmic-term.git'
        'lto.patch')
sha256sums=('SKIP'
            'b83d3403f73ad54363339304bdeca4d36ce11dfa17d5df51cc292d28fa78e824')

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
