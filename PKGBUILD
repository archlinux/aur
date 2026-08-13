# Maintainer: Geoff Clements <ro2kz0@gmail.com>
pkgname=vibe_player
pkgver=0.9.0
pkgrel=1
pkgdesc='A music player for the Lyrion music server'
url='https://github.com/GeoffClements/lms-player'
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/vibe-v${pkgver}.tar.gz")
arch=('x86_64' 'aarch64')
license=('GPL-3.0-or-later')
makedepends=('cargo' 'clang')
depends=('libdbus' 'libpipewire')
sha256sums=('a60485440e097bc936a383c09318009df13665ec994ff58c5a582705d2df1880')

_pkg_alt_name="lms-player-vibe"
_vibe_features="--no-default-features --features=pipewire,notify"

prepare() {
  cd "${_pkg_alt_name}-v${pkgver}"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's|host: ||p')"
}

build() {
  cd "${srcdir}/${_pkg_alt_name}-v${pkgver}"

  if [[ $CARCH != x86_64 ]]; then
    export CARGO_PROFILE_RELEASE_LTO=off
  fi

  cargo build --frozen ${_vibe_features} --release --target-dir target
}

package() {
  cd "${srcdir}/${_pkg_alt_name}-v${pkgver}"

  install -Dm755 target/release/vibe "${pkgdir}/usr/bin/vibe"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 vibe/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
