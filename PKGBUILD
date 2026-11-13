# Maintainer: NorseHorse <NorseHorse@norsehor.se>
# pkgver must match a release tag whose assets include the RelayPony-linux-*.tar.gz builds.
pkgname=relaypony-bin
pkgver=4.0.0
pkgrel=1
pkgdesc="Encrypted, direct device-to-device file transfer - desktop app (prebuilt)"
arch=('x86_64' 'aarch64')
url="https://relaypony.app"
license=('Apache-2.0')
# The release tarball's launcher preloads the system libfreetype so the native GTK file chooser
# renders (the bundled runtime's older copy otherwise breaks it). freetype2 must therefore be
# present; fontconfig already pulls it in, but we depend on it directly since the launcher uses it.
depends=('fontconfig' 'freetype2')
provides=('relaypony')
conflicts=('relaypony')
options=(!strip)
source=(
  "relaypony.desktop::https://raw.githubusercontent.com/norsehorse-dev/RelayPonyDesktop/v$pkgver/packaging/aur/relaypony.desktop"
  "relaypony.png::https://raw.githubusercontent.com/norsehorse-dev/RelayPonyDesktop/v$pkgver/packaging/relaypony.png"
)
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/norsehorse-dev/RelayPonyDesktop/releases/download/v$pkgver/RelayPony-linux-x86_64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/norsehorse-dev/RelayPonyDesktop/releases/download/v$pkgver/RelayPony-linux-aarch64.tar.gz")
sha256sums=('16787da2f5519724ec1a4852d4f0d097ddbeaeecd07d1c6ee1578f95b70b55b0'
            '2c8c079a0c414667c138c3d4b3af8568b24f54a03e26f2b61bb31fa2747a122f')
sha256sums_x86_64=('a0f96b8af694752ea85ea472217ec5d1d39517bf67d4e6b0c275b72c588e7e64')
sha256sums_aarch64=('f502678268918772ea6495edb9bc8dc0678988d8fde5b188360c31e071d78b1a')

package() {
  install -dm755 "$pkgdir/opt/relaypony"
  cp -a "$srcdir/RelayPony/." "$pkgdir/opt/relaypony/"

  # As of 2.2.2 the tarball's own launcher (bin/RelayPony) preloads the system libfreetype, so a
  # plain symlink is enough here; the terminal command and the desktop entry both go through it.
  install -dm755 "$pkgdir/usr/bin"
  ln -s /opt/relaypony/bin/RelayPony "$pkgdir/usr/bin/relaypony"

  install -Dm644 "$srcdir/relaypony.desktop" "$pkgdir/usr/share/applications/relaypony.desktop"
  install -Dm644 "$srcdir/relaypony.png" "$pkgdir/usr/share/pixmaps/relaypony.png"
}
