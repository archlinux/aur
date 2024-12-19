# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=observatory
pkgver=0.2.2
pkgrel=1
pkgdesc="A system monitor application for the COSMIC desktop environment"
arch=('x86_64' 'aarch64')
url="https://github.com/cosmic-utils/observatory"
license=('LicenseRef-unknown')
depends=(
  'hicolor-icon-theme'
  'libxkbcommon'
  'mesa'
  'systemd-libs'
)
makedepends=(
  'cargo'
  'git'
  'just'
)
source=("git+https://github.com/cosmic-utils/observatory.git#tag=v$pkgver")
sha256sums=('1ac2ce9723fcc92fb4cb5c34d14635f33b1dca0ad63b6540920920e3b18dad5d')

prepare() {
  cd "$pkgname"

  # Fix issues with justfile and cargo workspace
  git cherry-pick -n 27415c2146769f2aa661a03b2afa250da0934729
  
  # Fix justfile build target
  git cherry-pick -n 12c9ce063c3ac5d2390c3c993b184673b982f61a

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname"
  CFLAGS+=" -ffat-lto-objects"
  export RUSTUP_TOOLCHAIN=stable
  just build-release --frozen
}

package() {
  cd "$pkgname"
  just rootdir="$pkgdir" install
}
