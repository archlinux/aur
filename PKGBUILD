# Maintainer:
# Contributor: Barfin
# Contributor: DanielH, agstrc

_pkgname="iriunwebcam"
pkgname="$_pkgname-bin"
pkgver=2.9
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
  '074aef02ff27e5efc83e707a614c0c3bff4c811b9c6a7fd4f2bae4ca269a844b'
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
