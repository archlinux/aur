# Maintainer: The Enclave contributors <ari@aricummings.com>
#
# The release's Linux programs (`cargo xtask dist`, built on AlmaLinux 9
# for glibc 2.34 and newer). release.yml's `aur` job sets pkgver and the
# checksums from the release, regenerates .SRCINFO and pushes.
pkgname=enclave-messenger-bin
pkgver=0.2.2
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
sha256sums_x86_64=('72754ea513e9c6abf4a28f6fe1f08e1ad9fa1de01709dae71897ddeb5f4ba7cc')
sha256sums_aarch64=('d0cd182ad2124e642a2425f11c078a2b411416cd59de38fe658ac2270532bb94')

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
