# Maintainer:  arch1t3cht <arch1t3cht@gmail.com>

_plug=dvdsrc2
pkgname="vapoursynth-plugin-${_plug}-git"
pkgver=beta1.11.g84f4cfc
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/jsaowji/dvdsrc2.git'
license=('MIT')
depends=(
  'vapoursynth'
  'a52dec'
  'libmpeg2'
  'libdvdread'
)
makedepends=(
  'git'
  'cargo'
)
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/jsaowji/dvdsrc2.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - . | tr -d r)"
}

prepare() {
  cd "${_plug}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${_plug}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "${_plug}"
  install -Dm755 -t "${pkgdir}/usr/lib/vapoursynth" "target/release/lib${_plug}.so"
}
