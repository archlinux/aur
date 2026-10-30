# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=voicenux
pkgver=0.4.0
pkgrel=1
pkgdesc="VoiceMod for Linux. Real-time voice changer and soundboard for PipeWire"
arch=('x86_64')
url="https://github.com/voicenux/voicenux"
# BSD: the program. MIT: the Fluent Emoji pictures, ISC: the Lucide icons,
# CC0: the background sounds. All of them are built into the binary.
license=('BSD-3-Clause' 'MIT' 'ISC' 'CC0-1.0')
# Upstream wants PipeWire and WirePlumber running, not only the library.
depends=('gtk4' 'libadwaita' 'libpipewire' 'pipewire' 'wireplumber' 'glib2'
         'cairo' 'pango' 'graphene' 'libgcc' 'glibc' 'hicolor-icon-theme')
# clang: bindgen, for the PipeWire headers
makedepends=('rust' 'clang')
optdepends=('xdg-desktop-portal: global shortcuts')
# !lto: makepkg's -flto=auto in CFLAGS turns ring's assembly (the TLS of
# the downloads) into bitcode that links to nothing. Cargo's own LTO is
# set in upstream's release profile.
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/voicenux/voicenux/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('212bc254ed0a09a06ca05607015a5e2b9a20d17df3ff127d1b272f277f4ef5f2')

prepare() {
  cd "${pkgname}-${pkgver}"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/^host: //p')"
}

build() {
  cd "${pkgname}-${pkgver}"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --frozen
}

package() {
  cd "${pkgname}-${pkgver}"

  make install DESTDIR="$pkgdir" PREFIX=/usr
  # the emoji licence, which `make install` leaves out
  install -Dm644 data/icons/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.emoji"
}
