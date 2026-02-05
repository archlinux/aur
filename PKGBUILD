# Maintainer: Jonathan Capps <hello at cappsy dot net>
pkgname=cosmic-ext-applet-dict-git
pkgver=v0.1.3.r2.g4fef6df
pkgrel=1
pkgdesc="An English language dictionary applet for the COSMIC™ desktop"
arch=('x86_64' 'aarch64')
url="https://github.com/cosmic-utils/cosmic-ext-applet-dict"
license=('GPL-3.0-or-later')
depends=('cosmic-applets')
makedepends=(
  'cargo'
  'git'
  'just'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/cosmic-utils/cosmic-ext-applet-dict.git')
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
