# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=voicenux-git
pkgver=0.2.0.r3.gfc86de1
pkgrel=1
pkgdesc="VoiceMod for Linux. Real-time voice changer and soundboard for PipeWire (git)"
arch=('x86_64')
url="https://github.com/voicenux/voicenux"
# BSD: the program. MIT: the Fluent Emoji pictures, ISC: the Lucide icons,
# CC0: the background sounds. All of them are built into the binary.
license=('BSD-3-Clause' 'MIT' 'ISC' 'CC0-1.0')
# Upstream wants PipeWire and WirePlumber running, not only the library.
depends=('gtk4' 'libadwaita' 'libpipewire' 'pipewire' 'wireplumber' 'glib2'
         'cairo' 'pango' 'graphene' 'libgcc' 'glibc' 'hicolor-icon-theme')
# clang: bindgen, for the PipeWire headers
makedepends=('rust' 'clang' 'git')
optdepends=('xdg-desktop-portal: global shortcuts')
provides=('voicenux')
conflicts=('voicenux')
# !lto: makepkg's -flto=auto in CFLAGS turns ring's assembly (the TLS of
# the downloads) into bitcode that links to nothing. Cargo's own LTO is
# set in upstream's release profile.
options=('!lto')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags --abbrev=7 --match 'v[0-9]*' \
    | sed 's/^v//; s/\([^-]*-g\)/r\1/; s/-/./g'
}

prepare() {
  cd "$pkgname"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/^host: //p')"
}

build() {
  cd "$pkgname"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --frozen
}

package() {
  cd "$pkgname"

  make install DESTDIR="$pkgdir" PREFIX=/usr
  mv "$pkgdir/usr/share/licenses/voicenux" "$pkgdir/usr/share/licenses/$pkgname"
  # the emoji licence, which `make install` leaves out
  install -Dm644 data/icons/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.emoji"
}
