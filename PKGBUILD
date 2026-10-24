# Maintainer: francisjr <sjrduarte at gmail dot com>

pkgname=bimcraft-bin
_pkgname=bimcraft
pkgver=0.8.0
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
sha256sums_x86_64=('389661d6f28996c6168c6cc3aa2cec8728f4169b0e937ac88691284a4a0124aa')
sha256sums_aarch64=('b811f5054e42c46248b5590618cdafd069723a73df849d2f6b382596367fbe4f')

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
