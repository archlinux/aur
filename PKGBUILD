# Maintainer: The Enclave contributors <security@enclave.chat>
#
# The release's Linux programs (`cargo xtask dist`, built on AlmaLinux 9
# for glibc 2.34 and newer). release.yml's `aur` job sets pkgver and the
# checksums from the release, regenerates .SRCINFO and pushes.
pkgname=enclave-messenger-bin
pkgver=0.1.6
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
sha256sums_x86_64=('2b0f6d55a17f53616200435c2fa7e02630742e8280976a6083a012dee02d00fb')
sha256sums_aarch64=('f9c00986640032ef213fe9d9ed5bb34f454691b5ff61f1a4fcfa2ebf92cfe18b')

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
