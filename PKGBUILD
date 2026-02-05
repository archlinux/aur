# Maintainer: Jonathan Capps <hello at cappsy dot dev>
pkgname=cosmic-ext-applet-drives-git
pkgver=v0.1.0.r0.gc0d04fc
pkgrel=1
pkgdesc="Ani removable drives applet for the COSMIC™ desktop"
arch=('x86_64' 'aarch64')
url="https://github.com/cosmic-utils/cosmic-ext-applet-drives"
license=('GPL-3.0-or-later')
depends=('cosmic-applets')
makedepends=(
  'cargo'
  'git'
  'just'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/cosmic-utils/cosmic-ext-applet-drives.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  just build-release --frozen
}

package() {
  cd "${pkgname%-git}"
  just rootdir="$pkgdir" install
}
