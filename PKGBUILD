# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-ext-calculator-git
_app_id=dev.edfloreshz.Calculator
pkgver=0.2.0.r4.g36e3c2e
pkgrel=1
pkgdesc="Calculator for the COSMIC desktop."
arch=('x86_64' 'aarch64')
url="https://github.com/cosmic-utils/calculator"
license=('GPL-3.0-or-later')
depends=(
  'hicolor-icon-theme'
  'libxkbcommon'
)
makedepends=(
  'cargo'
  'clang'
  'git'
  'just'
  'mold'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/cosmic-utils/calculator.git')
sha256sums=('SKIP')

pkgver() {
  cd calculator
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd calculator
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
  
  # Variable `APPID` not defined
  sed -i 's/appid/APPID/g' justfile

  # fix typo
  sed -i 's/icon-dst/icons-dst/g' justfile

  # correct file names
  mv -v res/app.desktop "res/${_app_id}.desktop"
  mv -v res/metainfo.xml "res/${_app_id}.metainfo.xml"
}

build() {
  cd calculator
  export RUSTUP_TOOLCHAIN=stable
  export CC=clang
  RUSTFLAGS+=" -C link-arg=-fuse-ld=mold"
  just build-release --frozen
}

package() {
  cd calculator
  just rootdir="$pkgdir" install
}
