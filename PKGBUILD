# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-ext-calculator-git
_app_id=dev.edfloreshz.Calculator
pkgver=0.2.1.r12.g65f1d40
pkgrel=1
pkgdesc="Calculator for the COSMIC desktop."
arch=('x86_64' 'aarch64')
url="https://github.com/cosmic-ext-orbit/cosmic-ext-calculator"
license=('GPL-3.0-or-later')
depends=(
  'hicolor-icon-theme'
  'libxkbcommon'
)
makedepends=(
  'cargo'
  'git'
  'just'
)
checkdepends=(
  'appstream'
  'desktop-file-utils'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/cosmic-ext-orbit/cosmic-ext-calculator.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_PROFILE_RELEASE_LTO=true
  export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1
  just build-release --frozen
}

check() {
  cd "${pkgname%-git}"
  appstreamcli validate --no-net res/metainfo.xml
  desktop-file-validate res/app.desktop
}

package() {
  cd "${pkgname%-git}"
  just rootdir="$pkgdir" install
}
