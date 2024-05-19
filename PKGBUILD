# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-webapps-git
pkgver=0.4.3.r2.g52933bf
pkgrel=1
pkgdesc="Web App Manager written with love and libcosmic."
arch=('x86_64')
url="https://github.com/elevenhsoft/WebApps"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'libxkbcommon' 'openssl')
makedepends=('cargo' 'git' 'just')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" 'cosmic-wam')
source=('git+https://github.com/elevenhsoft/WebApps.git')
sha256sums=('SKIP')

pkgver() {
  cd WebApps
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd WebApps
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  just vendor
}

build() {
  cd WebApps
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable

  # Package contains reference to $srcdir
  RUSTFLAGS="$RUSTFLAGS --remap-path-prefix $PWD=/"

  just build-vendored
}

package() {
  cd WebApps
  just rootdir="$pkgdir" install
}
