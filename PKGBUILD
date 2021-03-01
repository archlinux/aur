# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>
# PKGBUILD/install/wrapper all shamelessly ripped off from [community]/dwarffortress

pkgname=arcanefortune
pkgver=0.3.0
_commit=edebac03caa11da84c35f5a57b52654926bb074a
pkgrel=1
pkgdesc="A game of empire building, diplomacy, conquest, construction, and deconstruction"
arch=('x86_64')
url="https://arcanefortune.com"
license=('AGPL3' 'CC BY-SA 4.0')
depends=('sh' 'sdl2' 'sdl2_image' 'sdl2_ttf' 'ncurses' 'freetype2' 'gcc-libs' 'libjpeg6-turbo' 'libtiff' 'zlib')
makedepends=('git' 'rust' 'musl')
install=arcanefortune.install
source=(${pkgname}::git+"https://github.com/cody2007/arcane_fortune.git#commit=${_commit}"
        "${url}/releases/arcane_fortune_v${pkgver//./_}_linux.zip"
        arcane_fortune)

sha512sums=('SKIP'
            '3245fc4869ab296106f3d5df119d3304dd3ded8fca229ddd1b52e993730e5a554710272143961175a46ff861ecbba4496620fc8d89cf56e0c0431e81a1ebe289'
            'd02f70b65490c70c1cbe0f240289f2942186df3ca0058066507f1b9930e56a74f87c9e78f0bad78d81eba013dae39bf5fc636a6c5abec3fa6d357876eec14602')

prepare() {
  # Fix clean-chroot build (use makepkg branch ref)
  sed -i 's:include_str!("../../../.git/refs/heads/v0.3.0"):include_str!("../../../.git/refs/heads/makepkg"):' arcanefortune/arcane_fortune/src/disp/version_status.rs
}

build() {
  cd arcanefortune/arcane_fortune

  # build ncurses binary
  cargo build --release --locked
  # rename built binary
  mv target/release/arcane_fortune target/release/arcane_fortune_ncurses
  # build sdl binary
  cargo build --release --features sdl --locked
}

package() {
  _destdir="${pkgdir}/opt/${pkgname}"
  # create directory tree
  install -Ddm755 "${_destdir}/game"
  # install helper script
  install -Dm755 arcane_fortune "${pkgdir}/usr/bin/arcane_fortune"
  # install binaries (using same naming convention as upstream precompiled binaries for compatibility)
  install -Dm755 ${pkgname}/arcane_fortune/target/release/arcane_fortune_ncurses "${_destdir}/game/arcane_fortune_linux_ncurses"
  install -Dm755 ${pkgname}/arcane_fortune/target/release/arcane_fortune "${_destdir}/game/arcane_fortune_linux"

  # copy config dir
  cp -r arcanefortune/arcane_fortune/src/config "${_destdir}/game/config"
  
  # copy fonts dir
  cp -r arcanefortune/arcane_fortune/src/fonts "${_destdir}/game/fonts"
  
  # install icon
  install -Dm644 arcanefortune/arcane_fortune/src/icon.ico "${_destdir}/game/icon.ico"

  # copy neural net weights
  cp -r "arcane_fortune_v${pkgver//./_}/game/nn" "${_destdir}/game/nn"

  install -Dm644 "arcanefortune/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}
