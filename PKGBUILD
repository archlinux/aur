# Maintainer: francisjr <sjrduarte at gmail dot com>

pkgname=bimcraft-bin
_pkgname=bimcraft
pkgver=0.11.0
pkgrel=1
pkgdesc='Open-source building information modeling: plans, sections, 3D, schedules and IFC (prebuilt binaries)'
arch=('x86_64' 'aarch64')
url='https://github.com/IPedrax/BIMCraft'
license=('MIT OR Apache-2.0')
# Same runtime dependencies upstream declares in packaging/linux/arch-package.sh
depends=(
  'glibc'
  'gcc-libs'
  'libxkbcommon'
  'libxkbcommon-x11'
  'libx11'
  'libxcursor'
  'libxi'
  'libxrandr'
  'libglvnd'
  'hicolor-icon-theme'
)
optdepends=(
  'wayland: native Wayland windows'
  'mesa: OpenGL drivers'
  'xdg-desktop-portal: file dialogs'
  'dbus: file dialogs through the portal'
)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('!strip' '!debug')
source_x86_64=("$url/releases/download/v$pkgver/$_pkgname-$pkgver-linux-x86_64.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/$_pkgname-$pkgver-linux-aarch64.tar.gz")
sha256sums_x86_64=('932a7c6c16bc3328b508b723f664760814bb23e03603f05a46da68eeef1e2341')
sha256sums_aarch64=('a94d598d821b1da3366e6655147d318991a5a542c298da263f1fb97cc704d4c1')

package() {
  cd "$_pkgname-$pkgver-linux-$CARCH"

  # The tarball is already a /usr tree: bin/ and share/
  install -d "$pkgdir/usr"
  cp -dr --no-preserve=ownership bin share "$pkgdir/usr/"

  # Normalise permissions
  find "$pkgdir/usr" -type d -exec chmod 0755 {} +
  find "$pkgdir/usr" -type f -perm /111 -exec chmod 0755 {} +
  find "$pkgdir/usr" -type f ! -perm /111 -exec chmod 0644 {} +

  # Licenses where Arch expects them
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    share/doc/bimcraft/LICENSE-APACHE \
    share/doc/bimcraft/LICENSE-MIT \
    share/doc/bimcraft/NOTICE
}
