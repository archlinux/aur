# Maintainer:
# Contributor: Barfin
# Contributor: DanielH, agstrc

_pkgname="iriunwebcam"
pkgname="$_pkgname-bin"
pkgver=2.8.2
pkgrel=3
pkgdesc="Use your phone's camera as a wireless webcam in your PC"
url="https://iriun.com/"
license=('LicenseRef-Iriun')
arch=('x86_64')

source=(
  "iriunwebcam-${pkgver}.deb::http://iriun.gitlab.io/iriunwebcam-${pkgver}.deb"
  "LICENSE.iriun.txt" # extracted from mac archive
)
sha256sums=(
  '1df7c6ce15cf7690f4b616f22ae80a01ea639007aae2a9a5394c86acdf007a04'
  'eb2ba875d0b419ab7d6327a933d619d1b9eed51f89d49e55ed789bf8f37f75be'
)

options=('!emptydirs')

package() {
  depends+=(
    'alsa-lib'
    'avahi'
    'qt5-base'
    'v4l2loopback-dkms'
  )

  tar -xf "$srcdir/data.tar.xz" -C "$pkgdir"

  # move binary
  install -Dm755 "$pkgdir/usr/local/bin/iriunwebcam" -t "$pkgdir/usr/bin/"
  rm -rf "$pkgdir/usr/local"

  # fix desktop
  sed -E -e 's&/usr/local/bin/&&' -i "$pkgdir/usr/share/applications/iriunwebcam.desktop"

  # license
  install -Dm644 LICENSE.iriun.txt -t "$pkgdir/usr/share/licenses/$pkgname/"

  # fix permissions
  chmod -R u+rwX,go+rX,go-w "$pkgdir"
}
