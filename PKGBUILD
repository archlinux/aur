# Maintainer:
# Contributor: Barfin
# Contributor: DanielH, agstrc

_pkgname="iriunwebcam"
pkgname="$_pkgname-bin"
pkgver=2.9.3
pkgrel=2
pkgdesc="Use your phone's camera as a wireless webcam in your PC"
url="https://iriun.com/"
license=('LicenseRef-Iriun')
arch=('x86_64')

optdepends=(
  'android-tools: adb'
)

source=(
  "iriunwebcam-${pkgver}.deb"::"http://iriun.gitlab.io/iriunwebcam-${pkgver}.deb"
  "LICENSE.iriun.txt" # extracted from mac archive
)
sha256sums=(
  '3635363ec642788aca1e5a3fd45ee978ab6f69ac0a0d2ab5d68ae11bc4a80cc9'
  'eb2ba875d0b419ab7d6327a933d619d1b9eed51f89d49e55ed789bf8f37f75be'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

options=("!emptydirs" "!debug")

package() {
  depends=(
    'alsa-lib'
    'avahi'
    'libdrm'
    'qt6-base'
    'v4l2loopback-dkms'
  )

  bsdtar -xf "$srcdir/data.tar.zst" -C "$pkgdir"

  # binary
  mkdir -pm755 "$pkgdir/usr/bin"
  mv "$pkgdir/usr/local/bin/iriunwebcam" "$pkgdir/usr/bin/"

  # spa plugin
  mv "$pkgdir/usr/lib/x86_64-linux-gnu/spa-0.2" "$pkgdir/usr/lib/"

  # config
  mv "$pkgdir/etc/modprobe.d" "$pkgdir/usr/lib/"
  mv "$pkgdir/etc/modules-load.d" "$pkgdir/usr/lib/"

  # fix path
  sed -E -e 's&/.*/&&' -i "$pkgdir/usr/share/applications/iriunwebcam.desktop"

  # move broken config
  mv "$pkgdir/usr/share/pipewire" "$pkgdir/usr/share/$_pkgname"

  # license
  install -Dm644 LICENSE.iriun.txt -t "$pkgdir/usr/share/licenses/$pkgname/"

  # permissions
  chmod -R u+rwX,go+rX,go-w "$pkgdir"
}
