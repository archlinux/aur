# Maintainer: Geoff Clements <ro2kz0@gmail.com>
pkgname=vibe_player
pkgver=0.7.0
pkgrel=2
pkgdesc='A music player for the Lyrion music server'
url='https://github.com/GeoffClements/Vibe'
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
arch=('x86_64' 'aarch64')
license=('MIT')
makedepends=('cargo' 'clang')
depends=('libdbus' 'libpipewire')
sha256sums=('3a944892f147a3875b30648fe31326c5fa820beff5e3e7e8b4d5ca15fe3956de')

_vibe_features="--no-default-features --features=pipewire,notify"

prepare() {
  cd "Vibe-${pkgver}"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's|host: ||p')"
}

build() {
  cd "${srcdir}/Vibe-${pkgver}"

  if [[ $CARCH != x86_64 ]]; then
    export CARGO_PROFILE_RELEASE_LTO=off
  fi

  cargo build --frozen ${_vibe_features} --release --target-dir target
}

package() {
  cd "${srcdir}/Vibe-${pkgver}"

  install -Dm755 target/release/vibe "${pkgdir}/usr/bin/vibe"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
