# Maintainer: Geoff Clements <ro2kz0@gmail.com>
pkgname=vibe_player
pkgver=0.8.0
pkgrel=1
pkgdesc='A music player for the Lyrion music server'
url='https://github.com/GeoffClements/lms-player'
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/vibe-v${pkgver}.tar.gz")
arch=('x86_64' 'aarch64')
license=('MIT')
makedepends=('cargo' 'clang')
depends=('libdbus' 'libpipewire')
sha256sums=('4151dbe6fc9358c10dd930e0138b122a4d6b08bf34bce712b425c35d3ec2a895')

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
