# Maintainer: Robert O'Neill <robertdoneill@gmail.com>
pkgname=visipass-bin
pkgver=0.7.0
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
sha256sums_x86_64=('50b4fee27fd3761f08e8e47061147edce157cc4635fd16a86eb1eb988e1027a0')
sha256sums_aarch64=('42ff47de419c52fda514d5cf0d6c4a6137a911bace856c80cdb68b4734c1eeef')

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
