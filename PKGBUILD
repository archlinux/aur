# Maintainer: Alexander Tarasov <a.tevg@ya.ru>
pkgsubn=pwsp
pkgname=pwsp
pkgver=1.1.1
pkgrel=1
pkgdesc="Lets you play audio files through your microphone"
arch=('any')
url="https://github.com/arabianq/pipewire-soundpad"
license=('MIT')
makedepends=(clang rust cargo pipewire alsa-lib)
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')


prepare() {
  cd "${srcdir}/pipewire-soundpad-${pkgver}"
  
  export CARGO_HOME="${srcdir}/${pkgname%}/.cargo"    # Download all to src directory, not in ~/.cargo

  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${srcdir}/pipewire-soundpad-${pkgver}"

  export CARGO_ENCODED_RUSTFLAGS="--remap-path-prefix=${srcdir}=/"    # Prevent warning: 'Package contains reference to $srcdir'
  [[ -n "${_sccache}" ]] && export RUSTC_WRAPPER=sccache  # If $_sccache not empty, build using binary cache

  export CARGO_HOME="${srcdir}/${pkgname%}/.cargo"    # Use downloaded earlier from src directory, not from ~/.cargo
  export CARGO_TARGET_DIR=target                        # Place the output in target relative to the current directory

  cargo build --frozen --release
}


package() {
  cd "${srcdir}/pipewire-soundpad-${pkgver}"
  
  install -Dm755 "target/release/pwsp-cli" "${pkgdir}/usr/bin/pwsp-cli"
  install -Dm755 "target/release/pwsp-daemon" "${pkgdir}/usr/bin/pwsp-daemon"
  install -Dm755 "target/release/pwsp-gui" "${pkgdir}/usr/bin/pwsp-gui"

  install -Dm644 "assets/pwsp-gui.desktop" "${pkgdir}/usr/share/applications/pwsp-gui.desktop"
  install -Dm644 "assets/icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/icon.png"

  install -Dm644 "assets/pwsp-daemon.service" "${pkgdir}/usr/lib/systemd/user/pwsp-daemon.service"
}
