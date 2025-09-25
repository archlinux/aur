# Maintainer: Alexander Tarasov <a.tevg@ya.ru>
pkgsubn=pwsp
pkgname=pwsp
pkgver=1.0.0
pkgrel=1
pkgdesc="Lets you play audio files through your microphone"
arch=('any')
url="https://github.com/arabianq/pipewire-soundpad"
license=('MIT')
makedepends=(clang rust cargo pipewire alsa-lib)
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('SKIP')


prepare() {
  cd pipewire-soundpad
  
  export CARGO_HOME="${srcdir}/${pkgname%}/.cargo"    # Download all to src directory, not in ~/.cargo

  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd pipewire-soundpad

  export CARGO_ENCODED_RUSTFLAGS="--remap-path-prefix=${srcdir}=/"    # Prevent warning: 'Package contains reference to $srcdir'
  [[ -n "${_sccache}" ]] && export RUSTC_WRAPPER=sccache  # If $_sccache not empty, build using binary cache

  export CARGO_HOME="${srcdir}/${pkgname%}/.cargo"    # Use downloaded earlier from src directory, not from ~/.cargo
  export CARGO_TARGET_DIR=target                        # Place the output in target relative to the current directory

  cargo build --frozen --release
}


package() {
  cd pipewire-soundpad
  
  install -Dm755 "target/release/pwsp-cli" "${pkgdir}/usr/bin/"
  install -Dm755 "target/release/pwsp-daemon" "${pkgdir}}/usr/bin/"
  install -Dm755 "target/release/pwsp-gui" "${pkgdir}/usr/bin/pwsp"

  install -Dm644 "assets/pwsp-gui.desktop" "${pkgdir}/usr/share/applications/"
  install -Dm644 "assets/icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/"

  install -Dm644 "assets/pwsp-daemon.service" "${pkgdir}/usr/lib/systemd/user/"
}
