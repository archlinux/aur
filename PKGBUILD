# Maintainer: TheElevatedOne <adam.mlady@elevated.ovh>

pkgname=reshade-linux-bin
_pkgname=reshade-linux
pkgver=6.8.0.1
pkgrel=1
pkgdesc="crosire's ReShade post-processing injector as a native Vulkan layer, enabled with RESHADE=1 (works with Proton via DXVK/VKD3D) (prebuilt)"
arch=('x86_64')
url='https://github.com/TheElevatedOne/reshade-linux'
license=('BSD-3-Clause')
depends=('glibc' 'libxcb' 'libxkbcommon' 'wayland' 'dbus' 'vulkan-icd-loader' 'bash' 'git')
optdepends=(
  'lib32-reshade-linux: 32-bit games (lib32-reshade-linux-bin or lib32-reshade-linux-git)'
  'curl: download the depth buffer compatibility list with reshade --download-shaders'
  'xdg-desktop-portal: global shortcuts (e.g. xdg-desktop-portal-kde or xdg-desktop-portal-hyprland)'
  'pipewire-audio: screenshot sound (pw-play)'
  'xdg-utils: open folders and links from the overlay'
)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
# The release binaries are built on Arch Linux by the GitHub workflow and already stripped.
options=('!debug' '!strip')
# Release tags have no "v" prefix: "<ReShade version>.<release of this port>".
source=("$url/releases/download/$pkgver/$_pkgname-$pkgver-x86_64.tar.gz")
sha256sums=('e91082eadc23d34a9c24c914a4fa6e7b4434b2f3b2a296a07d0a92a91c66ec29')

package() {
  cd "$_pkgname-$pkgver-x86_64"
  install -Dm755 bin/reshade -t "$pkgdir/usr/bin"
  install -Dm755 lib/reshade/libreshade.so -t "$pkgdir/usr/lib/reshade"
  # Vulkan layer manifest, desktop entry (for the global shortcuts portal) and icon
  find share -type f -exec install -Dm644 {} "$pkgdir/usr/{}" \;
  install -Dm644 README.md CHANGELOG.md -t "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname"
}
