# Maintainer: The Enclave contributors <security@enclave.chat>
#
# Built from the release tag: both Rust workspaces and lyrebird (Go), as
# `cargo xtask dist` builds them. release.yml's `aur` job sets pkgver,
# regenerates .SRCINFO and pushes.
pkgname=enclave-messenger
pkgver=0.1.6
pkgrel=1
pkgdesc='Private messages without a phone number, through Tor and the Nym mixnet'
arch=('x86_64' 'aarch64')
url='https://github.com/0xnullsect0r/enclave-messenger'
license=('GPL-3.0-only')
depends=('glibc' 'gcc-libs' 'alsa-lib' 'libpipewire' 'fontconfig' 'freetype2' 'ttf-font' 'libxkbcommon' 'libxkbcommon-x11'
         'wayland' 'libglvnd' 'libx11' 'libxcursor' 'libxi' 'libxrandr' 'hicolor-icon-theme')
makedepends=('rustup' 'go' 'git' 'clang' 'pkgconf')
optdepends=('xdg-desktop-portal: system file dialogs'
            'gnome-keyring: keep the profile key in the Secret Service'
            'kwallet: keep the profile key in the Secret Service')
provides=('enclave-messenger')
conflicts=('enclave-messenger-bin')
options=('!lto' '!debug')
_v=${pkgver//_/-}
# Checked out as Enclave/, the directory the steps below work in.
source=("Enclave::git+https://github.com/0xnullsect0r/enclave-messenger.git#tag=v${_v}")
sha256sums=('SKIP')

prepare() {
  cd Enclave
  # The toolchain rust-toolchain.toml names.
  rustup toolchain install --profile minimal "$(sed -n 's/^channel *= *"\(.*\)"/\1/p' rust-toolchain.toml)"
  cargo fetch --locked
  (cd nym && cargo fetch --locked)
}

build() {
  cd Enclave
  ENCLAVE_VERSION=$_v cargo xtask dist --target "${CARCH}-unknown-linux-gnu"
}

package() {
  cd "Enclave/target/${CARCH}-unknown-linux-gnu/release/dist"
  install -d "$pkgdir/usr/lib/enclave-messenger" "$pkgdir/usr/bin"
  install -m755 enclave enclave-vault enclave-netd enclave-mediad enclave-tord enclave-nymd lyrebird \
    "$pkgdir/usr/lib/enclave-messenger/"
  ln -s /usr/lib/enclave-messenger/enclave "$pkgdir/usr/bin/enclave"
  cp -r --no-preserve=ownership share "$pkgdir/usr/"
  install -Dm644 THIRD-PARTY-NOTICES.txt "$pkgdir/usr/share/licenses/$pkgname/THIRD-PARTY-NOTICES.txt"
}
