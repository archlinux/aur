# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-randr-git
pkgver=1.0.0.alpha.7.r0.gc32d0d6
pkgrel=1
pkgdesc="Library and utility for displaying and configuring Wayland outputs"
arch=('x86_64' 'aarch64')
url="https://github.com/pop-os/cosmic-randr"
license=('MPL-2.0')
depends=('wayland')
makedepends=(
  'cargo'
  'clang'
  'git'
  'just'
  'mold'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/pop-os/cosmic-randr.git'
        'lto.patch')
sha256sums=('SKIP'
            '3906072bc828dd7bc7239652e4b75979487b6f8b16e8e575a7d6b05be6cbb275')

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

  # use nice to build with lower priority
  nice just build-release --frozen
}

package() {
  cd "${pkgname%-git}"
  just rootdir="$pkgdir" install
}
