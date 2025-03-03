# Maintainer: soloturn <soloturn@gmail.com>
# Co-Maintainer: Mark Wagie <mark dot wagie at proton dot me>

pkgname=cosmic-app-library-git
pkgver=1.0.0.alpha.6.r2.gc58a366
pkgrel=1
pkgdesc="An application launcher for the COSMIC desktop"
arch=('x86_64' 'aarch64')
url="https://github.com/pop-os/cosmic-applibrary"
license=('GPL-3.0-only')
depends=(
  'hicolor-icon-theme'
  'libxkbcommon')
makedepends=(
  'cargo'
  'git'
  'just'
  'mold'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" 'cosmic-applibrary')
source=('git+https://github.com/pop-os/cosmic-applibrary.git')
sha256sums=('SKIP')

pkgver() {
  cd cosmic-applibrary
  git describe --long --tags --abbrev=7 | sed 's/^epoch-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd cosmic-applibrary
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd cosmic-applibrary
  export RUSTUP_TOOLCHAIN=stable

  # use mold instead of lld to speed up build
  RUSTFLAGS+=" -C link-arg=-fuse-ld=mold"

  # use nice to build with lower priority
  nice just build-release --frozen
}

package() {
  cd cosmic-applibrary
  just rootdir="$pkgdir" install
}
