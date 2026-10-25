# Maintainer: The Enclave contributors <security@enclave.chat>
#
# The release's Linux programs (`cargo xtask dist`, built on AlmaLinux 9
# for glibc 2.34 and newer). release.yml's `aur` job sets pkgver and the
# checksums from the release, regenerates .SRCINFO and pushes.
pkgname=enclave-messenger-bin
pkgver=0.1.2
pkgrel=1
pkgdesc='Private messages without a phone number, through Tor and the Nym mixnet'
arch=('x86_64' 'aarch64')
url='https://github.com/0xnullsect0r/enclave-messenger'
license=('GPL-3.0-only')
depends=('glibc' 'gcc-libs' 'alsa-lib' 'libpipewire' 'fontconfig' 'freetype2' 'ttf-font' 'libxkbcommon' 'libxkbcommon-x11'
         'wayland' 'libglvnd' 'libx11' 'libxcursor' 'libxi' 'libxrandr' 'hicolor-icon-theme')
optdepends=('xdg-desktop-portal: system file dialogs'
            'gnome-keyring: keep the profile key in the Secret Service'
            'kwallet: keep the profile key in the Secret Service')
provides=('enclave-messenger')
conflicts=('enclave-messenger')
options=('!strip' '!debug')
_v=${pkgver//_/-}
source_x86_64=("https://github.com/0xnullsect0r/enclave-messenger/releases/download/v${_v}/enclave-${_v}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/0xnullsect0r/enclave-messenger/releases/download/v${_v}/enclave-${_v}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('a3d1ba4e37290b7e23a50e9a78213072572eff9ea6e4741ae0ba864af1567a7a')
sha256sums_aarch64=('e5bc18ae6bb94b4df33a77f230f64f528ca658b6d6020cdfa701de9d8d28b1c0')

package() {
  cd "enclave-${_v}-${CARCH}-unknown-linux-gnu"
  install -d "$pkgdir/usr/lib/enclave-messenger" "$pkgdir/usr/bin"
  install -m755 enclave enclave-vault enclave-netd enclave-mediad enclave-tord enclave-nymd lyrebird \
    "$pkgdir/usr/lib/enclave-messenger/"
  # The programs start each other from their own folder.
  ln -s /usr/lib/enclave-messenger/enclave "$pkgdir/usr/bin/enclave"
  cp -r --no-preserve=ownership share "$pkgdir/usr/"
  install -Dm644 THIRD-PARTY-NOTICES.txt "$pkgdir/usr/share/licenses/$pkgname/THIRD-PARTY-NOTICES.txt"
}
