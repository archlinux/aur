# Maintainer: Namise Noriyuki <nene@anche.no>
pkgname=pwsp-git
_srcname=pipewire-soundpad
pkgver=v1.13.0.r0.g6d7abdb
pkgrel=1
pkgdesc="Lets you play audio files through your microphone"
arch=('x86_64' 'aarch64')
url="https://github.com/arabianq/pipewire-soundpad"
license=('MIT')
source=("git+$url.git")
depends=('pipewire' 'alsa-lib' 'openssl')
makedepends=(clang rust cargo cmake pipewire alsa-lib git)
sha256sums=('SKIP')
conflicts=('pwsp' 'pwsp-bin')
provides=('pwsp')

pkgver() {
  git -C pipewire-soundpad describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/pipewire-soundpad"

  export CARGO_HOME="${srcdir}/${pkgname%}/.cargo" # Download all to src directory, not in ~/.cargo

  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${srcdir}/pipewire-soundpad"

  export CARGO_ENCODED_RUSTFLAGS="--remap-path-prefix=${srcdir}=/" # Prevent warning: 'Package contains reference to $srcdir'
  [[ -n "${_sccache}" ]] && export RUSTC_WRAPPER=sccache           # If $_sccache not empty, build using binary cache

  export CARGO_HOME="${srcdir}/${pkgname%}/.cargo" # Use downloaded earlier from src directory, not from ~/.cargo
  export CARGO_TARGET_DIR=target                   # Place the output in target relative to the current directory

  cargo build --frozen --release
}

package() {
  cd "${srcdir}/pipewire-soundpad"

  install -Dm755 "target/release/pwsp-cli" "${pkgdir}/usr/bin/pwsp-cli"
  install -Dm755 "target/release/pwsp-daemon" "${pkgdir}/usr/bin/pwsp-daemon"
  install -Dm755 "target/release/pwsp-gui" "${pkgdir}/usr/bin/pwsp-gui"

  install -Dm644 "pwsp-gui/assets/pwsp-gui.desktop" "${pkgdir}/usr/share/applications/pwsp-gui.desktop"
  install -Dm644 "pwsp-gui/assets/icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/pwsp.png"

  install -Dm644 "pwsp-daemon/assets/pwsp-daemon.service" "${pkgdir}/usr/lib/systemd/user/pwsp-daemon.service"
}
