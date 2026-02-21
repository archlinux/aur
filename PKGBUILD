# Maintainer:
# Contributor: Barfin
# Contributor: DanielH, agstrc

_pkgname="iriunwebcam"
pkgname="$_pkgname-bin"
pkgver=2.9.1
pkgrel=1
pkgdesc="Use your phone's camera as a wireless webcam in your PC"
url="https://iriun.com/"
license=('LicenseRef-Iriun')
arch=('x86_64')

optdepends=(
  'android-tools: adb'
  'qt5-wayland'
)

source=(
  "iriunwebcam-${pkgver}.deb"::"http://iriun.gitlab.io/iriunwebcam-${pkgver}.deb"
  "LICENSE.iriun.txt" # extracted from mac archive
)
sha256sums=(
  'b25a53c9eb53f7ac1a47b5ef7174990dd97f66269c7388603395c2c57f160b84'
  'eb2ba875d0b419ab7d6327a933d619d1b9eed51f89d49e55ed789bf8f37f75be'
)

options=("!emptydirs" "!debug")

package() {
  depends=(
    'alsa-lib'
    'avahi'
    'libdrm'
    'qt5-base'
    'v4l2loopback-dkms'
  )

  tar -xf "$srcdir/data.tar.zst" -C "$pkgdir"

  # binary
  install -Dm755 "$pkgdir/usr/local/bin/iriunwebcam" -t "$pkgdir/usr/bin/"
  rm -rf "$pkgdir/usr/local"

  # fixes
  sed -E -e 's&/usr/local/bin/&&' -i "$pkgdir/usr/share/applications/iriunwebcam.desktop"

  # license
  install -Dm644 LICENSE.iriun.txt -t "$pkgdir/usr/share/licenses/$pkgname/"

  # permissions
  chmod -R u+rwX,go+rX,go-w "$pkgdir"
}
