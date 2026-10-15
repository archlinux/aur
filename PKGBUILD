# Maintainer: Robert O'Neill <robertdoneill@gmail.com>
pkgname=visipass-bin
pkgver=0.10.1
pkgrel=1
pkgdesc="Password manager for coding agents: they find, use and save secrets without seeing them"
arch=('x86_64' 'aarch64')
url="https://github.com/VisiOffice/VisiPass"
license=('AGPL-3.0-only')
# visipass-prompt (the approval window) loads Wayland, Vulkan and fontconfig at runtime.
depends=('glibc' 'gcc-libs' 'libxcb' 'libxkbcommon' 'libxkbcommon-x11' 'wayland' 'vulkan-icd-loader' 'fontconfig' 'freetype2')
optdepends=(
  '1password-cli: the 1Password backend (required until the native store ships)'
  'wl-clipboard: --clipboard input on Wayland'
  'zenity: fallback approval dialog'
)
provides=('visipass')
conflicts=('visipass')
source_x86_64=("$url/releases/download/v$pkgver/visipass-$pkgver-linux-x86_64.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/visipass-$pkgver-linux-aarch64.tar.gz")
sha256sums_x86_64=('564e94b168bf0485bb7961da272fa32038e29de8d7f0700efdeb6c221f6f9a77')
sha256sums_aarch64=('0bcacb4cdc84c5fe1f99422ba77abe838867eed797bc997589f47621478c21e7')

package() {
  cd "visipass-$pkgver-linux-$CARCH"
  install -Dm755 vp visipassd visipass-prompt visipass-app -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md SECURITY.md SKILL.md -t "$pkgdir/usr/share/doc/visipass/"
  install -Dm644 visipass.desktop -t "$pkgdir/usr/share/applications/"
  install -Dm644 com.visioffice.visipass.policy -t "$pkgdir/usr/share/polkit-1/actions/"
  install -Dm644 visipass.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/visipass.svg"
  install -d "$pkgdir/usr/share/visipass"
  cp -r --no-preserve=ownership extension "$pkgdir/usr/share/visipass/"
  for size in 16 24 32 48 64 128 256 512; do
    install -Dm644 "icons/visipass-$size.png" "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/visipass.png"
  done
}
