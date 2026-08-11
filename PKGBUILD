# Maintainer: smiley <smiley@aur.archlinux.org>
pkgname=cosmic-ext-tweaks
pkgver=0.2.5
pkgrel=1
pkgdesc="A tweaking tool for the COSMIC desktop."
arch=('x86_64')
url="https://github.com/cosmic-utils/tweaks"
license=('GPL-3.0-or-later')
depends=(
  'hicolor-icon-theme'
  'libxkbcommon'
)
makedepends=(
  'cargo'
  'git'
  'just'
  'mold'
)
conflicts=('cosmic-ext-tweaks-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/cosmic-utils/tweaks/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('adc3c335d7bc0f9bb9b2882a8e53e15e75676021a1ed192d1171cf3cbaf15bc0')

prepare() {
  cd tweaks-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd tweaks-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  RUSTFLAGS+=" -C link-arg=-fuse-ld=mold"
  just build-release --frozen
}

package() {
  cd tweaks-$pkgver
  just rootdir="$pkgdir" install
}
